tests-Supplying
testAsynchronicAnchorLabeledApplying

	| supplier anchor html |

	supplier := JQueryUIComponentSupplier online.

	anchor := supplier asynchronicAnchorLabeled: 'Buy' applying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: anchor.

	self assert: html equals: '<a role="button" class="big">Buy</a>'