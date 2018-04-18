Extension { #name : #WebInteractionInterpreter }

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> acceptContainerDialog [

	interaction onTriggerExecute: JQueryUIDialogButtonClickingCommand new
]

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> showJQueryUILoadingNotification [

	| classes |

	classes := Array
		with: WillowCssStyles topPageNotification
		with: JQueryUICssStyles uiStateFocus
		with: JQueryUICssStyles uiWidget
		with: JQueryUICssStyles uiWidgetHeader
		with: JQueryUICssStyles uiCornerAll.
	self showLoadingNotificationStyledAsAll: classes
]

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector [

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: aComponentByStyleName ]
				altering: aCssStyle
				sending: #toggleClass:
				using: [ :component | 
					component effect
						times: 1;
						slow;
						perform: anEffectSelector ])
]
