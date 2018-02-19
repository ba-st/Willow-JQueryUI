Supplying - Non Portable
interactiveButtonDescribedBy: aDescription representedBy: anIcon

	^ self
		synchronicButtonLabeled: aDescription
		applying: (JQueryUIButtonCommand representedBy: anIcon)