baselines
setUpDependencies: spec

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('JQuery-UI') ];
		project: 'Seaside3-Tests'
			copyFrom: 'Seaside3'
			with: [ spec loads: #('JQueryUI Tests') ].
	spec
		baseline: 'Willow'
			with: [ spec
				repository: 'github://ba-st/Willow:master/source';
				loads: #('Willow') ];
		project: 'Willow-Tests' copyFrom: 'Willow' with: [ spec loads: #('Willow-Tests') ]