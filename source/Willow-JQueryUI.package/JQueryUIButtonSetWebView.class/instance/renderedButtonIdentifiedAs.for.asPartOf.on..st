private-rendering
renderedButtonIdentifiedAs: radioButtonId for: anElement asPartOf: aRadioGroup on: aCanvas

	| radioButton |

	radioButton := aCanvas radioButton.
	radioButton id: radioButtonId.
	radioButton
		group: aRadioGroup;
		value: anElement.
	^ radioButton