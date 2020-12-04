Extension { #name : #CombinedWebInteractionInterpreter }

{ #category : #'*Willow-JQueryUI' }
CombinedWebInteractionInterpreter >> toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector [

	self interpretersDo: [ :interpreter | interpreter toggleCssClass: aCssStyle onComponentsWithClass: aComponentByStyleName withEffect: anEffectSelector ]
]
