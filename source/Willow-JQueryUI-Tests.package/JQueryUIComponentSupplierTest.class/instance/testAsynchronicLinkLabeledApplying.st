tests-Supplying
testAsynchronicLinkLabeledApplying

	self
		assertRenderingOf:
			[ :supplier | supplier asynchronicLinkLabeled: 'Buy' applying: [ :link | link addClass willow ] ]
		equals:
			'<a id="a-id1" class="willow">Buy</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'