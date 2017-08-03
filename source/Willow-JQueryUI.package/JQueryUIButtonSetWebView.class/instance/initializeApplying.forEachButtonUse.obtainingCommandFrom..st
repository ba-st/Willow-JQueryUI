initialization
initializeApplying: aCommandToComponent forEachButtonUse: aDefinition obtainingCommandFrom: aLabelCommandProvider

	commandToComponent := aCommandToComponent.
	elementCommandProvider := aLabelCommandProvider.
	radioButtonDefinition := aDefinition.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue