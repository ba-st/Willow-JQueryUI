Class {
	#name : #BaselineOfWillowJQueryUI,
	#superclass : #BaselineOf,
	#category : #BaselineOfWillowJQueryUI
}

{ #category : #baselines }
BaselineOfWillowJQueryUI >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				setUpPackages: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Dependent-SUnit-Extensions' with: 'Willow-SUnit';
				group: 'Tools' with: 'Willow-Tools';
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #accessing }
BaselineOfWillowJQueryUI >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfWillowJQueryUI >> setUpDependencies: spec [

	spec
		baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.x/repository' ];
		project: 'Seaside3-JQueryUI'
			copyFrom: 'Seaside3'
			with: [ spec loads: #('Core' 'Javascript' 'JQuery' 'JQuery-UI') ].

	spec
		baseline: 'Willow' with: [ spec repository: 'github://ba-st/Willow:v14/source' ];
		project: 'Willow-Deployment' copyFrom: 'Willow' with: [ spec loads: 'Deployment' ];
		project: 'Willow-SUnit' copyFrom: 'Willow' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Willow-Tools' copyFrom: 'Willow' with: [ spec loads: 'Tools' ]
]

{ #category : #baselines }
BaselineOfWillowJQueryUI >> setUpPackages: spec [

	spec
		package: 'Willow-JQueryUI' with: [ spec requires: #('Seaside3-JQueryUI' 'Willow-Deployment') ];
		group: 'Deployment' with: 'Willow-JQueryUI';
		package: 'Willow-JQueryUI-Tests' with: [ spec requires: #('Willow-JQueryUI' 'Willow-SUnit') ];
		group: 'Tests' with: 'Willow-JQueryUI-Tests'
]
