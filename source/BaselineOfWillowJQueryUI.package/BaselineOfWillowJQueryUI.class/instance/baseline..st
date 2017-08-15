baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Willow-JQueryUI' with: [ spec requires: #('Seaside3' 'Willow') ];
				package: 'Willow-JQueryUI-Tests'
					with: [ spec requires: #('Willow-JQueryUI' 'Willow-Tests') ].
			spec
				group: 'Deployment' with: #('Willow-JQueryUI');
				group: 'Development' with: #('Deployment' 'Willow-JQueryUI-Tests');
				group: 'default' with: #('Deployment') ]