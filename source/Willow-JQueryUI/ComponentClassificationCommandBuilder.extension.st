Extension { #name : #ComponentClassificationCommandBuilder }

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> jQueryUI [

	classesProvider := classesProvider >> #jQueryUI
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiCornerAll [

	^ self commandStyledWith: #uiCornerAll
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiStateDefault [

	^ self commandStyledWith: #uiStateDefault
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidget [

	^ self commandStyledWith: #uiWidget
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidgetContent [

	^ self commandStyledWith: #uiWidgetContent
]

{ #category : #'*Willow-JQueryUI' }
ComponentClassificationCommandBuilder >> uiWidgetHeader [

	^ self commandStyledWith: #uiWidgetHeader
]
