"
I'm a component command enabling the autocompletion using JQueryUI.
"
Class {
	#name : 'JQueryUIAutocompleteCommand',
	#superclass : 'WebComponentCommand',
	#instVars : [
		'configurationCommand',
		'selectInterpreter'
	],
	#category : 'Willow-JQueryUI-Frontend',
	#package : 'Willow-JQueryUI',
	#tag : 'Frontend'
}

{ #category : 'instance creation' }
JQueryUIAutocompleteCommand class >> configuredBy: aBlock [

	^ self new initializeConfiguredBy: aBlock
]

{ #category : 'instance creation' }
JQueryUIAutocompleteCommand class >> obtainingSuggestionsFrom: anAutocompleteProvider [

	^ self configuredBy: [ :autocomplete | autocomplete sourceCallback: anAutocompleteProvider ]
]

{ #category : 'processing' }
JQueryUIAutocompleteCommand >> applyTo: aComponent on: aCanvas [

	^ ( ComponentScriptCommand toExecute: [ :canvas |
			    | autocomplete |

			    autocomplete := canvas jQuery this autocomplete.
			    configurationCommand value: autocomplete.
			    selectInterpreter applyTo: autocomplete on: canvas.
			    autocomplete
		    ] ) applyTo: aComponent on: aCanvas
]

{ #category : 'initialization' }
JQueryUIAutocompleteCommand >> initializeConfiguredBy: aConfigurationCommand [

	configurationCommand := aConfigurationCommand.
	selectInterpreter := WebInteractionInterpreter
		                     forEvaluationOf: #onSelect:
		                     withAll: ( Array with: 'event' with: 'ui' )
]

{ #category : 'configuring' }
JQueryUIAutocompleteCommand >> onSelect [

	^ selectInterpreter
]
