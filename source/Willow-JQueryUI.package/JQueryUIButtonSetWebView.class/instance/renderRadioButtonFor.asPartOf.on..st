private-rendering
renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas

	| radioButtonId radioButton |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifyIn: aCanvas.
	radioButton := self
		renderedButtonIdentifiedAs: radioButtonId
		for: anElement
		asPartOf: aRadioGroup
		on: aCanvas.
	interactionInterpreter applyTo: radioButton on: aCanvas.
	self
		renderLabelFor: anElement
		representedBy: radioButton
		identifiedAs: radioButtonId
		on: aCanvas