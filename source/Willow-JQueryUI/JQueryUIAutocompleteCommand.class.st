"
I'm a component command enabling the autocompletion using JQueryUI.
"
Class {
	#name : #JQueryUIAutocompleteCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'scriptProvider'
	],
	#category : 'Willow-JQueryUI-Frontend'
}

{ #category : #'instance creation' }
JQueryUIAutocompleteCommand class >> obtainingSuggestionsFrom: anAutocompleteProvider [

	^ self
		toExecute:
			[ :canvas | canvas jQuery this autocomplete sourceCallback: anAutocompleteProvider ]
]

{ #category : #'instance creation - private' }
JQueryUIAutocompleteCommand class >> toExecute: aBlock [

	^ self new initializeToExecute: aBlock
]

{ #category : #processing }
JQueryUIAutocompleteCommand >> applyTo: aComponent on: aCanvas [

	^ (ComponentScriptCommand toExecute: scriptProvider) applyTo: aComponent on: aCanvas
]

{ #category : #'initialize-release' }
JQueryUIAutocompleteCommand >> initializeToExecute: aScriptProvider [

	scriptProvider := aScriptProvider
]
