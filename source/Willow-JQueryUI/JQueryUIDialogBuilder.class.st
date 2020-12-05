Class {
	#name : #JQueryUIDialogBuilder,
	#superclass : #WillowComponentBuilder,
	#instVars : [
		'titleBinding',
		'content',
		'acceptTextOptional'
	],
	#category : #'Willow-JQueryUI-WebViews'
}

{ #category : #building }
JQueryUIDialogBuilder >> buildApplying: aDocumentCommand [

	^ JQueryUIDialogWebView
		titled: titleBinding content
		containing: content
		acceptedUsing: acceptTextOptional
		applying: aDocumentCommand
]

{ #category : #configuring }
JQueryUIDialogBuilder >> confirmWith: anAcceptanceText [

	acceptTextOptional := Optional containing: anAcceptanceText
]

{ #category : #configuring }
JQueryUIDialogBuilder >> dismissableHeaderTitled: aRenderable [

	titleBinding := Binding to: aRenderable
]

{ #category : #initialization }
JQueryUIDialogBuilder >> initialize [

	super initialize.
	titleBinding := Binding undefinedExplainedBy: 'Title was not specified'.
	content := ''.
	acceptTextOptional := Optional unused
]

{ #category : #configuring }
JQueryUIDialogBuilder >> wrapping: theContent [

	content := theContent 
]
