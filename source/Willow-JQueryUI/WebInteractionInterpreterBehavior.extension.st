Extension { #name : #WebInteractionInterpreterBehavior }

{ #category : #'*Willow-JQueryUI' }
WebInteractionInterpreterBehavior >> toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector [

	self
		deprecated: 'use updateCssClasses:onElementsMatching: instead'
		transformWith:
			'`@receiver toggleCssClass: `@aCssStyle onComponentsWithClass: `@aComponentByStyleName withEffect: `@anEffectSelector'
				->
					'`@receiver
		updateCssClasses: [ :element | element toggleClass: `@aCssStyle withEffect: `@anEffectSelector ]
		onElementsMatching: [ :canvas | canvas jQuery class: `@aComponentByStyleName ]'.
	self
		updateCssClasses: [ :element | element toggleClass: aCssStyle withEffect: anEffectSelector ]
		onElementsMatching: [ :canvas | canvas jQuery class: aComponentByStyleName ]
]
