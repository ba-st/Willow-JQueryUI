"
I'm a component command with the logic to configure the interaction of the accept button of a JQueryUI dialog.
"
Class {
	#name : #JQueryUIDialogButtonClickingCommand,
	#superclass : #WebInteractionCommand,
	#category : #'Willow-JQueryUI-Frontend'
}

{ #category : #'accessing - private' }
JQueryUIDialogButtonClickingCommand >> dialogButtonsOn: aCanvas [

	^ aCanvas jQuery: 'div.ui-dialog-buttonset button.ui-button'
]

{ #category : #'accessing - private' }
JQueryUIDialogButtonClickingCommand >> firstDialogButtonOn: aCanvas [

	^ ((self parentDialogOn: aCanvas) find: (self dialogButtonsOn: aCanvas)) first
]

{ #category : #accessing }
JQueryUIDialogButtonClickingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #'accessing - private' }
JQueryUIDialogButtonClickingCommand >> parentDialogOn: aCanvas [

	^ aCanvas jQuery this closest: 'div.ui-dialog'
]

{ #category : #accessing }
JQueryUIDialogButtonClickingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
JQueryUIDialogButtonClickingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
JQueryUIDialogButtonClickingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | ( self firstDialogButtonOn: aCanvas ) call: 'click' ]
]
