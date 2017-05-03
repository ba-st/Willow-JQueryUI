initialization
initializeTitled: aTitle containing: aWebView optingFor: anOptional

	title := aTitle.
	contentsView := aWebView.
	acceptButtonOptional := anOptional.
	self initializeInteractionInterpreter.
	self initializeCommandToComponent.
	self configureToAcceptOnTrigger