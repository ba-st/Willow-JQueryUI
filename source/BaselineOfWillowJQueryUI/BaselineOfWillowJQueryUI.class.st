Class {
	#name : #BaselineOfWillowJQueryUI,
	#superclass : #BaselineOf,
	#category : 'BaselineOfWillowJQueryUI'
}

{ #category : #baselines }
BaselineOfWillowJQueryUI >> baseline: spec [

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
]

{ #category : #baselines }
BaselineOfWillowJQueryUI >> setUpDependencies: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec
				repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
				loads: #('JQuery-UI') ].

	spec
		baseline: 'Willow'
			with: [ spec
				repository: 'github://ba-st/Willow:v11/source';
				loads: #('Willow') ];
		project: 'Willow-Tests' copyFrom: 'Willow' with: [ spec loads: #('Willow-Tests') ]

]
