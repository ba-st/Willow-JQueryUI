tests-Supplying
testMultiLineTextFieldApplying

	| supplier textField html |

	supplier := JQueryUIComponentSupplier online.

	textField := supplier
		multiLineTextFieldApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: textField.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1" class="big"></textarea>'