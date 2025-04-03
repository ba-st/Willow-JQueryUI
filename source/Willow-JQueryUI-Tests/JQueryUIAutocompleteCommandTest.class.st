Class {
	#name : 'JQueryUIAutocompleteCommandTest',
	#superclass : 'BWRenderingTest',
	#category : 'Willow-JQueryUI-Tests-Frontend',
	#package : 'Willow-JQueryUI-Tests',
	#tag : 'Frontend'
}

{ #category : 'private - accessing' }
JQueryUIAutocompleteCommandTest >> autocompleteCommand [

	^ JQueryUIAutocompleteCommand configuredBy: [ :autocomplete |
			  autocomplete
				  changeMethodTo: 'animalAutocomplete';
				  minLength: 3;
				  delay: 400;
				  classes: ( Dictionary new
						    at: 'ui-autocomplete' put: 'autocompleteList';
						    yourself ).
			  autocomplete
		  ]
]

{ #category : 'private - accessing' }
JQueryUIAutocompleteCommandTest >> componentSupplier [

	^ JQueryUIComponentSupplier online
]

{ #category : 'tests' }
JQueryUIAutocompleteCommandTest >> testCommand [

	| html |

	html := self render: self textView.

	self
		assert: html
		equals:
		'<input value="" name="1" id="id2" type="text"/><script type="text/javascript">$("#id2").animalAutocomplete({"minLength":3,"delay":400,"classes":{"ui-autocomplete":"autocompleteList"}});</script>'
]

{ #category : 'private - accessing' }
JQueryUIAutocompleteCommandTest >> textView [

	^ self componentSupplier singleLineTextFieldApplying: [ :view | self autocompleteCommand ]
]
