private-rendering
renderLabelFor: anElement representedBy: radioButton identifiedAs: radioButtonId on: aCanvas

	| label |

	label := aCanvas label.
	(elementCommandProvider value: anElement) applyTo: label on: aCanvas.
	label for: radioButtonId