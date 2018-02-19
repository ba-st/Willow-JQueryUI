tests-Supplying
testSynchronicButtonLabeledApplyingEvaluating

	self
		assertRenderingOf: [ :supplier | 
			supplier
				synchronicButtonLabeled: 'Buy'
				applying: [ :button | button addClass willow ]
				evaluating: [  ] ]
		equals: '<button name="1" class="willow" type="submit">Buy</button>'