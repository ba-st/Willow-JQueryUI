tests-Supplying
testSynchronicButtonLabeledApplying

	self
		assertRenderingOf:
			[ :supplier | supplier synchronicButtonLabeled: 'Buy' applying: [ :button | button addClass willow ] ]
		equals: '<button class="willow" type="submit">Buy</button>'