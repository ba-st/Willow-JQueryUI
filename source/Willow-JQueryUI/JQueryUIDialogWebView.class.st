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
	#category : 'Willow-JQueryUI-WebViews'
}

{ #category : #'private - instance creation' }
JQueryUIDialogWebView class >> titled: aTitle containing: aWebView optingFor: anOptional [

	^ self new initializeTitled: aTitle containing: aWebView optingFor: anOptional
]

{ #category : #'instance creation' }
JQueryUIDialogWebView class >> titled: aTitle toConfirm: aWebView [

	^ self titled: aTitle toConfirm: aWebView with: 'Accept'
]

{ #category : #'instance creation' }
JQueryUIDialogWebView class >> titled: aTitle toConfirm: aWebView with: anAcceptanceText [

	^ self
		titled: aTitle
		containing: aWebView
		optingFor: (Optional containing: anAcceptanceText)
]

{ #category : #'instance creation' }
JQueryUIDialogWebView class >> titled: aTitle toShow: aWebView [

	^ self titled: aTitle containing: aWebView optingFor: Optional unused
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
		, ((aCanvas jQuery id: WillowConstants dialogSectionName) html: [ :aSubCanvas |  ])
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeCommandToComponent [

	commandToComponent := ComponentScriptCommand
		toExecute: [ :canvas | self dialogScriptOn: canvas ]
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeInteractionInterpreter [

	interactionInterpreter := WebInteractionInterpreter forEvaluationOf: #add: withAll: #()
]

{ #category : #initialization }
JQueryUIDialogWebView >> initializeTitled: aTitle containing: aWebView optingFor: anOptional [

	title := aTitle.
	contentsView := aWebView.
	acceptButtonOptional := anOptional.
	self initializeInteractionInterpreter.
	self initializeCommandToComponent.
	self configureToAcceptOnTrigger
]

{ #category : #configuring }
JQueryUIDialogWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
JQueryUIDialogWebView >> renderContentOn: aCanvas [

	| component |

	component := aCanvas div.
	commandToComponent applyTo: component on: aCanvas.
	component with: contentsView
]
