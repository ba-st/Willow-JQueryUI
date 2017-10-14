initialization
initializeApplying: aCommandToComponent obtainingCommandFrom: aLabelCommandProvider

	commandToComponent := aCommandToComponent.
	elementCommandProvider := aLabelCommandProvider.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue