tests
testIsForDevelopment

	self
		assert: JQueryUIDeploymentMetadataLibrary isForDeployment;
		deny: JQueryUIDeploymentMetadataLibrary isForDevelopment