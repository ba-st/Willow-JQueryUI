"
Generic Dialog Component.
http://api.jqueryui.com/dialog/
"
Class {
	#name : #JQueryUIDialogWebView,
	#superclass : #WAPainter,
	#instVars : [
		'contentsView',
		'interactionInterpreter',
		'title',
		'commandToComponent',
		'acceptButtonOptional'
	],
	#pools : [
		'Willow'
	],
	#category : #'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
JQueryUIDialogWebView class >> titled: aTitle containing: aRenderable acceptedUsing: aTextOptional applying: aDocumentCommand [

	^ self new
		initializeTitled: aTitle
		containing: aRenderable
		acceptedUsing: aTextOptional
		applying: aDocumentCommand
]

{ #category : #'private - configuring' }
JQueryUIDialogWebView >> addAcceptButtonLabeled: aString to: aDialog on: aCanvas [

	| functions |

	functions := Set new.
	interactionInterpreter applyTo: functions on: aCanvas.
	aDialog addButton: aString do: functions any
]

{ #category : #'private - configuring' }
JQueryUIDialogWebView >> addAcceptButtonTo: aDialog on: aCanvas [

	acceptButtonOptional
		withContentDo: [ :buttonText | self addAcceptButtonLabeled: buttonText to: aDialog on: aCanvas ]
]

{ #category : #'private - configuring' }
JQueryUIDialogWebView >> configureAcceptButton [

	self onTrigger
		serializeChildForm;
		executeOnClient: [ :aScript :canvas | aScript << (self functionToRemoveComponentOn: canvas) ]
]

{ #category : #'private - configuring' }
JQueryUIDialogWebView >> configureToAcceptOnTrigger [

	acceptButtonOptional withContentDo: [ :buttonText | self configureAcceptButton ]
]

{ #category : #accessing }
JQueryUIDialogWebView >> contentsView [

	^ contentsView
]

{ #category : #'private - accessing' }
JQueryUIDialogWebView >> dialogScriptOn: aCanvas [

	| dialog |

	dialog := aCanvas jQuery new dialog.
	self addAcceptButtonTo: dialog on: aCanvas.
	dialog
		onClose: (self functionToRemoveComponentOn: aCanvas);
		height: 'auto';
		width: 'auto';
		title: title;
		autoOpen: true;
		resizable: false;
		closeOnEscape: true.
	^ dialog
]

{ #category : #'private - accessing' }
JQueryUIDialogWebView >> functionToRemoveComponentOn: aCanvas [

	^ aCanvas jQuery this remove
		, ((aCanvas jQuery id: Constants >> #willow >> #dialogSectionName) html: [ :aSubCanvas |  ])
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeCommandToComponentWith: aCommand [

	commandToComponent := aCommand asWebComponentCommand
		+ [ :button | button addScript js: [ :canvas | self dialogScriptOn: canvas ] ]
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeInteractionInterpreter [

	interactionInterpreter := WebInteractionInterpreter forEvaluationOf: #add: withAll: #()
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeTitled: aTitle containing: aRenderable acceptedUsing: aTextOptional applying: aComponentCommand [

	title := aTitle.
	contentsView := aRenderable.
	acceptButtonOptional := aTextOptional.
	self initializeInteractionInterpreter.
	self initializeCommandToComponentWith: aComponentCommand.
	self configureToAcceptOnTrigger
]

{ #category : #configuring }
JQueryUIDialogWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
JQueryUIDialogWebView >> renderContentOn: aCanvas [

	aCanvas div with: contentsView applying: commandToComponent
]
