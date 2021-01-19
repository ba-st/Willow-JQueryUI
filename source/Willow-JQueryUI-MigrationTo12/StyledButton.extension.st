Extension { #name : #StyledButton }

{ #category : #'*Willow-JQueryUI-MigrationTo12' }
StyledButton >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
