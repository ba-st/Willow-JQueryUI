"
I'm a WebView that represents a simple button with a style.
"
Class {
	#name : #StyledButton,
	#superclass : #WAPainter,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent'
	],
	#category : #'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
StyledButton class >> describedBy: aDescription styledAs: aCssStyle [

	^self new initializeDescribedBy: aDescription styledAs: aCssStyle
]

{ #category : #initialization }
StyledButton >> initializeDescribedBy: aDescription styledAs: aCssStyle [

	commandToComponent := [ :button | 
	( button setTitleTo: aDescription ) + ( ComponentClassificationCommand toStyleWith: aCssStyle )
		+ button addClass jQueryUI uiWidgetContent + button addClass jQueryUI uiCornerAll
	].
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick
]

{ #category : #configuring }
StyledButton >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
StyledButton >> renderContentOn: aCanvas [

	"The message order is important to make it work!"

	aCanvas button
		interactUsing: interactionInterpreter;
		apply: commandToComponent
]
