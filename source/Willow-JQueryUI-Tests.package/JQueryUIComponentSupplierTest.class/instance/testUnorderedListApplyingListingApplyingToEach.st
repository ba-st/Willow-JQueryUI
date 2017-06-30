tests-Supplying
testUnorderedListApplyingListingApplyingToEach

	| supplier list html |

	supplier := JQueryUIComponentSupplier online.

	list := supplier
		unorderedListApplying: (ListLabelingCommand with: [ :item | 'N.<1p>' expandMacrosWith: item ])
		listing: #(1 2 3)
		applyingToEach: (ComponentClassificationCommand toStyleWith: 'item').

	html := self render: list.

	self assert: html equals: '<ul><li class="item">N.1</li><li class="item">N.2</li><li class="item">N.3</li></ul>'