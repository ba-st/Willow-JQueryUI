"
A DialogClosingCommandTest is a test class for testing the behavior of DialogClosingCommand using the JQueryUI Component Supplier
"
Class {
	#name : #JQueryUIDialogClosingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-JQueryUI-Tests-WebInteraction'
}

{ #category : #private }
JQueryUIDialogClosingCommandTest >> componentSupplier [

	^ JQueryUIComponentSupplier online
]

{ #category : #private }
JQueryUIDialogClosingCommandTest >> createHandlers [

	^ Array with: self
]

{ #category : #private }
JQueryUIDialogClosingCommandTest >> isSession [

	^ true
]

{ #category : #tests }
JQueryUIDialogClosingCommandTest >> testModelLoadingActionsWhenOnlyRemovingLastDialog [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			DialogClosingCommand onlyForLastDialog modelLoadingInstructions appendTo: script on: canvas.
			anchor script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$(".ui-dialog-content").last().dialog("close")});</script>'
]

{ #category : #tests }
JQueryUIDialogClosingCommandTest >> testModelLoadingActionsWhenRemovingAllDialogs [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			DialogClosingCommand forAllDialogs modelLoadingInstructions appendTo: script on: canvas.
			anchor script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$(".ui-dialog-content").dialog("close")});</script>'
]
