instance creation
applying: aCommandToComponent obtainingCommandFrom: aLabelCommandProvider

	^ self new
		initializeApplying: aCommandToComponent asWebComponentCommand
		obtainingCommandFrom: aLabelCommandProvider