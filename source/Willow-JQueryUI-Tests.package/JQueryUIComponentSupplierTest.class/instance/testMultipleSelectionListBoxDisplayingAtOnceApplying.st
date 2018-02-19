tests-Supplying
testMultipleSelectionListBoxDisplayingAtOnceApplying

	self
		assertRenderingOf:
			[ :supplier | supplier multipleSelectionListBoxDisplayingAtOnce: 10 applying: [ :listBox |  ] ]
		equals: '<select name="1" size="10" multiple="multiple"></select><input name="2" type="hidden"/>'