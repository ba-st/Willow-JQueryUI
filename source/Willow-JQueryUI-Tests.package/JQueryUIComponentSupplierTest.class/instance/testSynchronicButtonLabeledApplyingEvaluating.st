tests-Supplying
testSynchronicButtonLabeledApplyingEvaluating

	| supplier button html |

	supplier := JQueryUIComponentSupplier online.

	button := supplier
		synchronicButtonLabeled: 'Search'
		applying: (ComponentClassificationCommand toStyleWith: 'big')
		evaluating: [ self fail ].

	html := self render: button.

	self assert: html equals: '<button name="1" class="big" type="submit">Search</button>'