tests
testIsForDevelopment

	self
		assert: JQueryUIDevelopmentMetadataLibrary isForDevelopment;
		deny: JQueryUIDevelopmentMetadataLibrary isForDeployment