"
Accordion component.
https://jqueryui.com/accordion/
"
Class {
	#name : #JQueryUICollapsibleSectionWebView,
	#superclass : #WAPainter,
	#instVars : [
		'sections',
		'commandToComponent'
	],
	#category : #'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
JQueryUICollapsibleSectionWebView class >> applying: aBlockOrWebComponentCommand [

	^ self new initializeApplying: aBlockOrWebComponentCommand
]

{ #category : #accessing }
JQueryUICollapsibleSectionWebView >> addCollapsedSectionNamed: aName containing: aContent [

	self addSectionNamed: aName containing: aContent applying: self initiallyCollapsedCommand
]

{ #category : #accessing }
JQueryUICollapsibleSectionWebView >> addSectionNamed: aName containing: aContent [

	self addSectionNamed: aName containing: aContent applying: [  ]
]

{ #category : #accessing }
JQueryUICollapsibleSectionWebView >> addSectionNamed: aName containing: aContent applying: aCommandToSection [

	sections
		add: [ :canvas | 
			canvas heading: aName.
			canvas div with: aContent applying: aCommandToSection
			]
]

{ #category : #initialization }
JQueryUICollapsibleSectionWebView >> initializeApplying: aBlockOrWebComponentCommand [

	sections := OrderedCollection new.
	commandToComponent := aBlockOrWebComponentCommand asWebComponentCommand
]

{ #category : #'private - accessing' }
JQueryUICollapsibleSectionWebView >> initiallyCollapsedCommand [

	^ [ :view | view setStyleTo: [ :style | style display: #none ] ]
]

{ #category : #rendering }
JQueryUICollapsibleSectionWebView >> renderContentOn: aCanvas [

	aCanvas div
		script:
			( aCanvas jQuery new accordion
				collapsible: true;
				icons: false;
				animate: 50;
				heightStyle: 'content';
				yourself );
		with: sections applying: commandToComponent
]
