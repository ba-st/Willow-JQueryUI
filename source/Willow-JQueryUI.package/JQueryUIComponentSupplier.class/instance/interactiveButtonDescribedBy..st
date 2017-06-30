Supplying
interactiveButtonDescribedBy: aString

	^ self
		synchronicButtonLabeled: aString
		applying: (JQueryUIButtonCommand describedBy: aString)
		evaluating: [  ]