tests
testHandlesFolder

	self
		assert:
			(JQueryUIDevelopmentMetadataLibrary
				handlesFolder: JQueryUIDevelopmentMetadataLibrary folderName);
		deny: (JQueryUIDevelopmentMetadataLibrary handlesFolder: #files)