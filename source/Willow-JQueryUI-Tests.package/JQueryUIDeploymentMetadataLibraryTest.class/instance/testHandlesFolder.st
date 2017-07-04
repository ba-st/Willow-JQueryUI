tests
testHandlesFolder

	self
		assert: (JQueryUIDeploymentMetadataLibrary handlesFolder: JQueryUIDeploymentMetadataLibrary folderName);
		deny: (JQueryUIDeploymentMetadataLibrary handlesFolder: #files)