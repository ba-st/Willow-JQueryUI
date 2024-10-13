"
Smalltalk extension of the JQuery UI Sortable plugin to implement to Swappable plugin.
"
Class {
	#name : 'Swappable',
	#superclass : 'JQSortable',
	#category : 'Willow-JQueryUI-Plugins',
	#package : 'Willow-JQueryUI',
	#tag : 'Plugins'
}

{ #category : 'options-generated' }
Swappable >> cursorAt: anObject [
	"Moves the sorting element or helper so the cursor always appears to drag from the same position. Coordinates can be given as a hash using a combination of one or two keys: { top, left, right, bottom }."
	"Always set option cursorAt: {top: -nnn} as a Negative Integer."

	self optionAt: 'cursorAt' put: anObject
]

{ #category : 'options-generated' }
Swappable >> items: aSelector [
	"Specifies which items inside the element should be sortable."
	"Always set option items with items' class name, not element or filter."

	self optionAt: 'items' put: aSelector
]

{ #category : 'accessing' }
Swappable >> method [

	^'swappable'
]
