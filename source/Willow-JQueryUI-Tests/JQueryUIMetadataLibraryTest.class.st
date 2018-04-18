Class {
	#name : #JQueryUIMetadataLibraryTest,
	#superclass : #TestCase,
	#category : 'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #tests }
JQueryUIMetadataLibraryTest >> testForDeployment [

	self
		assert: JQueryUIMetadataLibrary forDeployment
		equals: JQueryUIDeploymentMetadataLibrary
]

{ #category : #tests }
JQueryUIMetadataLibraryTest >> testForDevelopment [

	self
		assert: JQueryUIMetadataLibrary forDevelopment
		equals: JQueryUIDevelopmentMetadataLibrary
]

{ #category : #tests }
JQueryUIMetadataLibraryTest >> testVersionCompatibility [

	self
		assert: JQueryUIDeploymentMetadataLibrary version
			equals: JQueryUIDevelopmentMetadataLibrary version;
		assert: JQueryUIDeploymentMetadataLibrary version
			equals: JQueryUIOnlineLibrary default version
]
