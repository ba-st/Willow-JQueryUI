Extension { #name : 'ComponentStyleClassUpdateBuilder' }

{ #category : '*Willow-JQueryUI' }
ComponentStyleClassUpdateBuilder >> toggleClass: aCssClass withEffect: anEffectSelector [

	transformations
		add: [ :element | 
			( element toggleClass: aCssClass ) effect
				times: 1;
				slow;
				perform: anEffectSelector
			]
]
