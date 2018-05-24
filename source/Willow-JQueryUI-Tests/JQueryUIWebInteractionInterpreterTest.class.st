"
I'm a test for JQuery UI related extensions on WebInteractionInterpreter
"
Class {
	#name : #JQueryUIWebInteractionInterpreterTest,
	#superclass : #WARenderingTest,
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
JQueryUIWebInteractionInterpreterTest >> testCombinedToggleCssClassOnComponentsWithClassWithEffect [

	| interpreter html |

	interpreter := CombinedWebInteractionInterpreter
		combiningInterpretersOf:
			{okButton.
			cancelButton}.

	interpreter toggleCssClass: Classification >> #loading onComponentsWithClass: Classification >> #willow withEffect: #bounce.

	html := self
		renderUsing: [ :canvas | 
			canvas
				render: okButton;
				render: cancelButton ].
	self
		assert: html
		equals:
			'<button id="button-id1" type="button">Ok</button><button id="button-id2" type="button">Cancel</button><script type="text/javascript">$("#button-id1").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});$("#button-id2").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'
]

{ #category : #tests }
JQueryUIWebInteractionInterpreterTest >> testToggleCssClassOnComponentsWithClassWithEffect [

	| interpreter html |

	interpreter := WebInteractionInterpreter forClickOnComponent.
	interpreter toggleCssClass: Classification >> #loading onComponentsWithClass: Classification >> #willow withEffect: #bounce.
	html := self apply: interpreter toComponentDefinedBy: [ :canvas | canvas textInput apply: [ :input | input addClass willow ] ].
	self
		assert: html
		equals:
			'<input class="willow" id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(event){$(".willow").toggleClass("willow-loading").effect("bounce",{"times":1},"slow")});</script>'
]
