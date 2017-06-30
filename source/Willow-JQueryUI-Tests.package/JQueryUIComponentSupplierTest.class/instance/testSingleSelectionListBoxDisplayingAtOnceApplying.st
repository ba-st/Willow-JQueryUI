tests-Supplying
testSingleSelectionListBoxDisplayingAtOnceApplying

	| supplier listBox html |

	supplier := JQueryUIComponentSupplier online.

	listBox := supplier
		singleSelectionListBoxDisplayingAtOnce: 4
		applying: (ComponentClassificationCommand toStyleWith: 'theBox').

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="4" class="theBox"></select>'