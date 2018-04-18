"
I'm a WebView that represents a simple button with a style.
"
Class {
	#name : #StyledButton,
	#superclass : #WAPainter,
	#instVars : [
		'commandsToComponent',
		'interactionInterpreter'
	],
	#category : 'Willow-JQueryUI-WebViews'
}

{ #category : #'instance creation' }
StyledButton class >> describedBy: aDescription styledAs: aCssStyle [

	^self new initializeDescribedBy: aDescription styledAs: aCssStyle
]

{ #category : #initialization }
StyledButton >> initializeDescribedBy: aDescription styledAs: aCssStyle [

	commandsToComponent := OrderedCollection new.
	commandsToComponent add: (ComponentTitleCommand toSet: aDescription).
	commandsToComponent
		add:
			(ComponentClassificationCommand
				toStyleWithAll:
					(OrderedCollection new
						add: aCssStyle;
						add: JQueryUICssStyles uiWidgetContent;
						add: JQueryUICssStyles uiCornerAll;
						yourself)).
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent
]

{ #category : #configuring }
StyledButton >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
StyledButton >> renderContentOn: aCanvas [

	"El orden es importante para que funcione!"

	| component |

	component := aCanvas button.
	interactionInterpreter applyTo: component on: aCanvas.
	commandsToComponent do: [ :command | command applyTo: component on: aCanvas ]
]
