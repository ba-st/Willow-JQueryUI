Extension { #name : #JQueryUIButtonSetWebView }

{ #category : #'*Willow-JQueryUI-MigrationTo12' }
JQueryUIButtonSetWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
