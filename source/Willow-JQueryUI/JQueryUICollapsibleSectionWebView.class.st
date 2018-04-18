"
Accordion component.
https://jqueryui.com/accordion/
"
Class {
	#name : #JQueryUICollapsibleSectionWebView,
	#superclass : #WAPainter,
	#instVars : [
		'cssStyle',
		'contentView'
	],
	#category : 'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
JQueryUICollapsibleSectionWebView class >> containing: aContentView styledAs: aCssStyle [

	^ self new initializeContaining: aContentView styledAs: aCssStyle
]

{ #category : #initialization }
JQueryUICollapsibleSectionWebView >> initializeContaining: aContentView styledAs: aCssStyle [

	contentView := aContentView.
	cssStyle := aCssStyle
]

{ #category : #rendering }
JQueryUICollapsibleSectionWebView >> renderContentOn: aCanvas [

	(aCanvas div class: cssStyle)
		script:
				(aCanvas jQuery new accordion
						collapsible: true;
						icons: false;
						animate: 50;
						heightStyle: 'content';
						yourself);
		with: [ aCanvas render: contentView ]
]
