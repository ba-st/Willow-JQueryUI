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
