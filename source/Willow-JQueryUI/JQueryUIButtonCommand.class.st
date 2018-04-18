"
I'm a component command that transforms a button into a JQueryUI button.
"
Class {
	#name : #JQueryUIButtonCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'scriptProvider'
	],
	#category : 'Willow-JQueryUI-Frontend'
}

{ #category : #'instance creation' }
JQueryUIButtonCommand class >> describedBy: aDescription [

	^ self toExecute: [ :canvas | canvas jQuery this button text: aDescription ]
]

{ #category : #'instance creation' }
JQueryUIButtonCommand class >> representedBy: anIcon [

	^ self
		toExecute: [ :canvas | 
			canvas jQuery this button
				text: false;
				primaryIcon: anIcon ]
]

{ #category : #'instance creation - private' }
JQueryUIButtonCommand class >> toExecute: aBlock [

	^ self new initializeToExecute: aBlock
]

{ #category : #processing }
JQueryUIButtonCommand >> applyTo: aComponent on: aCanvas [

	^ (ComponentScriptCommand toExecute: scriptProvider) applyTo: aComponent on: aCanvas
]

{ #category : #'initialize-release' }
JQueryUIButtonCommand >> initializeToExecute: aScriptProvider [

	scriptProvider := aScriptProvider
]
