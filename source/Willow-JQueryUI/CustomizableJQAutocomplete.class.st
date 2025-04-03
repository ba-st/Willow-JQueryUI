Class {
	#name : 'CustomizableJQAutocomplete',
	#superclass : 'JQAutocomplete',
	#instVars : [
		'method'
	],
	#category : 'Willow-JQueryUI-Frontend',
	#package : 'Willow-JQueryUI',
	#tag : 'Frontend'
}

{ #category : 'configuring' }
CustomizableJQAutocomplete >> changeMethodTo: aWidgetName [

	method := aWidgetName
]

{ #category : 'initialization' }
CustomizableJQAutocomplete >> initialize [

	super initialize.
	self changeMethodTo: super method
]

{ #category : 'accessing' }
CustomizableJQAutocomplete >> method [

	^ method
]
