Supplying - Non Portable
interactiveButtonDescribedBy: aString

	^ self
		synchronicButtonLabeled: aString
		applying: (JQueryUIButtonCommand describedBy: aString)
		evaluating: [  ]