"
I'm a test for JQuery UI related extensions on WebInteractionInterpreter
"
Class {
	#name : #JQueryUIWebInteractionInterpreterTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'okButton',
		'cancelButton'
	],
	#pools : [
		'Willow'
	],
	#category : #'Willow-JQueryUI-Tests-WebInteraction'
}

{ #category : #initialization }
JQueryUIWebInteractionInterpreterTest >> setUp [

	super setUp.
	okButton := AsynchronicButtonWebView labeled: 'Ok'.
	cancelButton := AsynchronicButtonWebView labeled: 'Cancel'
]

{ #category : #tests }
JQueryUIWebInteractionInterpreterTest >> testAcceptContainerDialog [

	| interpreter html |

	interpreter := SingleEventInterpreterDispatcher defaultingToClick trigger.
	interpreter acceptContainerDialog.
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass willow ] ].
	self
		assert: html
		equals:
			'<input class="willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(this).closest("div.ui-dialog").find($("div.ui-dialog-buttonset button.ui-button")).first().click()});</script>'
]

{ #category : #tests }
JQueryUIWebInteractionInterpreterTest >> testCombinedToggleCssClassOnComponentsWithClassWithEffect [

	| interpreter html |

	interpreter := ( CombinedEventInterpreterDispatcher
		combiningInterpretersOfAll:
			{okButton.
			cancelButton} ) trigger.

	interpreter
		updateCssClasses: [ :element | element toggleClass: Classification >> #loading withEffect: #bounce ]
		onElementsMatching: [ :canvas | canvas jQuery class: Classification >> #willow ].

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton
			].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});$("#button-id2").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'
]

{ #category : #tests }
JQueryUIWebInteractionInterpreterTest >> testToggleCssClassOnComponentsWithClassWithEffect [

	| interpreter html |

	interpreter := SingleEventInterpreterDispatcher defaultingToClick trigger.
	interpreter
		updateCssClasses: [ :element | element toggleClass: Classification >> #loading withEffect: #bounce ]
		onElementsMatching: [ :canvas | canvas jQuery class: Classification >> #willow ].
	html := self
		apply: interpreter
		toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass willow ] ].
	self
		assert: html
		equals:
			'<input class="willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'
]
