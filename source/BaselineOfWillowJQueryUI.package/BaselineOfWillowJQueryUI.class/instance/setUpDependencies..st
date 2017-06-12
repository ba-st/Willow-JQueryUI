baselines
setUpDependencies: spec

	spec
		baseline: 'Seaside3'
			with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.2/repository';
				loads: #('JQuery-UI') ];
		import: 'Seaside3'.
	spec
		baseline: 'Willow'
			with: [ spec
				repository: 'github://ba-st/Willow:master/source';
				loads: #('Deployment') ];
		import: 'Willow'
