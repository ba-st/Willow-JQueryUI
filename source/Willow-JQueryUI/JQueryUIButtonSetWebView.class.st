"
Button Set Component.
https://api.jqueryui.com/buttonset/
"
Class {
	#name : #JQueryUIButtonSetWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'commandToComponent',
		'interactionInterpreter',
		'elementCommandProvider'
	],
	#category : #'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
JQueryUIButtonSetWebView class >> applying: aCommandToComponent obtainingCommandFrom: aLabelCommandProvider [

	^ self new
		initializeApplying: aCommandToComponent asWebComponentCommand
		obtainingCommandFrom: aLabelCommandProvider
]

{ #category : #initialization }
JQueryUIButtonSetWebView >> initializeApplying: aCommandToComponent obtainingCommandFrom: aLabelCommandProvider [

	commandToComponent := aCommandToComponent.
	elementCommandProvider := aLabelCommandProvider.
	interactionInterpreter := EventInterpreterDispatcher defaultingToChange
]

{ #category : #configuring }
JQueryUIButtonSetWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
JQueryUIButtonSetWebView >> renderContentOn: aCanvas [

	(self renderedComponentOn: aCanvas) with: [ self renderRadioGroupOn: aCanvas ] applying: commandToComponent
]

{ #category : #'private-rendering' }
JQueryUIButtonSetWebView >> renderLabelFor: anElement representedBy: radioButton identifiedAs: radioButtonId on: aCanvas [

	aCanvas label
		apply: (elementCommandProvider value: anElement);
		for: radioButtonId
]

{ #category : #'private-rendering' }
JQueryUIButtonSetWebView >> renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas [

	| radioButtonId radioButton |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifierOn: aCanvas.
	radioButton := self
		renderedButtonIdentifiedAs: radioButtonId
		for: anElement
		asPartOf: aRadioGroup
		on: aCanvas.
	radioButton interactUsing: interactionInterpreter.
	self
		renderLabelFor: anElement
		representedBy: radioButton
		identifiedAs: radioButtonId
		on: aCanvas
]

{ #category : #'private-rendering' }
JQueryUIButtonSetWebView >> renderRadioGroupOn: aCanvas [

	aCanvas radioGroup
		callback: [ :element | self choose: element ];
		with: [ :radioGroup | 
			chosenElementOptional withContentDo: [ :chosenElement | radioGroup selected: chosenElement ].
			availableElements
				do: [ :element | self renderRadioButtonFor: element asPartOf: radioGroup on: aCanvas ] ]
]

{ #category : #'private-rendering' }
JQueryUIButtonSetWebView >> renderedButtonIdentifiedAs: radioButtonId for: anElement asPartOf: aRadioGroup on: aCanvas [

	| radioButton |

	radioButton := aCanvas radioButton.
	radioButton id: radioButtonId.
	radioButton
		group: aRadioGroup;
		value: anElement.
	^ radioButton
]

{ #category : #'private-rendering' }
JQueryUIButtonSetWebView >> renderedComponentOn: aCanvas [

	^(aCanvas div)
		script: aCanvas jQuery new buttonset;
		yourself
]
