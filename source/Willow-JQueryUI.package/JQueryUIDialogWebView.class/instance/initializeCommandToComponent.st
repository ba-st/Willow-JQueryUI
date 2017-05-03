initialization
initializeCommandToComponent

	commandToComponent := ComponentScriptCommand
		toExecute: [ :canvas | self dialogScriptOn: canvas ]