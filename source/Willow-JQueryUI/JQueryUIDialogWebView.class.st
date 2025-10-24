"
Generic Dialog Component.
http://api.jqueryui.com/dialog/
"
Class {
	#name : 'JQueryUIDialogWebView',
	#superclass : 'WAPainter',
	#instVars : [
		'contentsView',
		'interactionInterpreter',
		'title',
		'commandToComponent',
		'acceptButtonOptional',
		'container',
		'confirmationCommand'
	],
	#pools : [
		'Willow'
	],
	#category : 'Willow-JQueryUI-WebViews',
	#package : 'Willow-JQueryUI',
	#tag : 'WebViews'
}

{ #category : 'instance creation' }
JQueryUIDialogWebView class >> titled: aTitle containing: aRenderable acceptedUsing: aTextOptional applying: aDocumentCommand [

	^ self new
		initializeTitled: aTitle
		containing: aRenderable
		acceptedUsing: aTextOptional
		applying: aDocumentCommand
]

{ #category : 'private - configuring' }
JQueryUIDialogWebView >> addAcceptButtonLabeled: aString to: aDialog on: aCanvas [

	| functions |

	functions := Set new.
	interactionInterpreter applyTo: functions on: aCanvas.
	aDialog addButton: aString do: functions any
]

{ #category : 'private - configuring' }
JQueryUIDialogWebView >> addAcceptButtonTo: aDialog on: aCanvas [

	acceptButtonOptional
		withContentDo: [ :buttonText | self addAcceptButtonLabeled: buttonText to: aDialog on: aCanvas ]
]

{ #category : 'private - configuring' }
JQueryUIDialogWebView >> configureAcceptButton [

	self on trigger
		serializeChildForm;
		serverDo: [ :request |
				confirmationCommand
					cull: request
					cull: [ request onRespond userAgentDo: [ :canvas | self functionToRemoveComponentOn: canvas ] ]
			]
]

{ #category : 'private - configuring' }
JQueryUIDialogWebView >> configureToAcceptOnTrigger [

	acceptButtonOptional withContentDo: [ :buttonText | self configureAcceptButton ]
]

{ #category : 'accessing' }
JQueryUIDialogWebView >> contentsView [

	^ contentsView
]

{ #category : 'private - accessing' }
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

{ #category : 'private - accessing' }
JQueryUIDialogWebView >> functionToRemoveComponentOn: aCanvas [

	^ ( ( aCanvas jQuery id: ( container identifierOn: aCanvas ) ) closest: 'div.ui-dialog' ) remove
	  , ( ( aCanvas jQuery id: Constants >> #willow >> #dialogSectionName ) html: [ :aSubCanvas |  ] )
]

{ #category : 'initialization' }
JQueryUIDialogWebView >> initializeCommandToComponentWith: aCommand [

	commandToComponent := aCommand asWebComponentCommand
		+ [ :button | button addScript js: [ :canvas | self dialogScriptOn: canvas ] ]
]

{ #category : 'initialization' }
JQueryUIDialogWebView >> initializeContainer [

	container := self componentSupplier
		             divisionContainerWrapping: contentsView
		             applying: commandToComponent.
	container beIdentifiable
]

{ #category : 'initialization' }
JQueryUIDialogWebView >> initializeInteractionInterpreter [

	interactionInterpreter := EventInterpreterDispatcher
		interpretingByDefault: 'add'
		configuring: ( WebInteractionInterpreter forEvaluationOf: #add: withAll: #() )
]

{ #category : 'initialization' }
JQueryUIDialogWebView >> initializeTitled: aTitle containing: aRenderable acceptedUsing: aTextOptional applying: aComponentCommand [

	title := aTitle.
	contentsView := aRenderable.
	acceptButtonOptional := aTextOptional.
	self initializeInteractionInterpreter.
	self initializeCommandToComponentWith: aComponentCommand.
	self initializeContainer.
	self onConfirmationDo: [ :request :defaultCommand | defaultCommand value ].
	self configureToAcceptOnTrigger
]

{ #category : 'configuring' }
JQueryUIDialogWebView >> on [

	^ interactionInterpreter
]

{ #category : 'configuring' }
JQueryUIDialogWebView >> onConfirmationDo: aCommand [

	confirmationCommand := aCommand
]

{ #category : 'rendering' }
JQueryUIDialogWebView >> renderContentOn: aCanvas [

	aCanvas render: container
]
