Extension { #name : #ComponentClassificationCommandBuilder }

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> jQueryUI [

	styleProviderBinding := Binding to: JQueryUICssStyles
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiCornerAll [

	^ self commandStyledWith: styleProviderBinding content uiCornerAll
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiStateDefault [

	^ self commandStyledWith: styleProviderBinding content uiStateDefault
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidget [

	^ self commandStyledWith: styleProviderBinding content uiWidget
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidgetContent [

	^ self commandStyledWith: styleProviderBinding content uiWidgetContent
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidgetHeader [

	^ self commandStyledWith: styleProviderBinding content uiWidgetHeader
]
