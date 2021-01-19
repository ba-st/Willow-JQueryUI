Extension { #name : #JQueryUIDialogWebView }

{ #category : #'*Willow-JQueryUI-MigrationTo12' }
JQueryUIDialogWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]
