"
I'm a WebInteractionCommand used to toggle the visibility of a component
"
Class {
	#name : #ComponentVisibilityTogglingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'cssStyle',
		'effect'
	],
	#category : 'Willow-JQueryUI-WebInteraction'
}

{ #category : #'instance creation' }
ComponentVisibilityTogglingCommand class >> for: aCssStyle using: anEffect [

	^self new initializeFor: aCssStyle using: anEffect
]

{ #category : #accessing }
ComponentVisibilityTogglingCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
ComponentVisibilityTogglingCommand >> initializeFor: aCssStyle using: anEffect [

	cssStyle := aCssStyle.
	effect := anEffect
]

{ #category : #accessing }
ComponentVisibilityTogglingCommand >> modelLoadingActions [

	^Array with: 
			[:aScript :aCanvas |
			aScript << (((aCanvas jQuery class: cssStyle) effect)
						toggle;
						perform: effect)]
]

{ #category : #accessing }
ComponentVisibilityTogglingCommand >> priorityActions [

	^#()
]

{ #category : #testing }
ComponentVisibilityTogglingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentVisibilityTogglingCommand >> serverIndependentActions [

	^#()
]
