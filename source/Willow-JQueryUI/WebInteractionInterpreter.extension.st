Extension { #name : #WebInteractionInterpreter }

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> acceptContainerDialog [

	interaction onTriggerExecute: JQueryUIDialogButtonClickingCommand new
]

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> showJQueryUILoadingNotification [

	| classes |

	classes := Array
		with: Willow classification >> #topPageNotification
		with: Willow classification >> #jQueryUI >> #uiStateFocus
		with: Willow classification >> #jQueryUI >> #uiWidget
		with: Willow classification >> #jQueryUI >> #uiWidgetHeader
		with: Willow classification >> #jQueryUI >> #uiCornerAll.
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
