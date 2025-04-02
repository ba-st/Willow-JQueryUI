Extension { #name : 'JQAutocomplete' }

{ #category : '*Willow-JQueryUI' }
JQAutocomplete >> classes: aJSON [
	"Specify additional classes to add to the widget's elements. Any of classes specified in the Theming section can be used as keys to override their value. To learn more about this option, check out the learn article about the classes option."

	self optionAt: 'classes' put: aJSON
]
