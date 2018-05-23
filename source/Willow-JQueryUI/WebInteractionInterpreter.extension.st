Extension { #name : #WebInteractionInterpreter }

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> acceptContainerDialog [

	interaction onTriggerExecute: JQueryUIDialogButtonClickingCommand new
]

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreter >> showJQueryUILoadingNotification [

	| classes |

	classes := Array
		with: Willow classes >> #topPageNotification
		with: Willow classes >> #jQueryUI >> #uiStateFocus
		with: Willow classes >> #jQueryUI >> #uiWidget
		with: Willow classes >> #jQueryUI >> #uiWidgetHeader
		with: Willow classes >> #jQueryUI >> #uiCornerAll.
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
