baselines
setUpDependencies: spec

	| repoLocation |

	spec
		baseline: 'Seaside3'
		with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('JQuery-UI') ].
			
	repoLocation := 'github://ba-st/Willow:master/source'.
	spec
		baseline: 'Willow'
		with: [ spec
				repository: repoLocation;
				loads: #('Willow') ].
	spec
		project: 'Willow-Tests';
		baseline: 'Willow'
			with: [ spec
				repository: repoLocation;
				loads: #('Willow-Tests') ]