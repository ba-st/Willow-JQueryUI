Class {
	#name : #JQueryUIDevelopmentMetadataLibraryTest,
	#superclass : #JQueryUIMetadataLibraryDeploymentTest,
	#category : #'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #tests }
JQueryUIDevelopmentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQueryUIDevelopmentMetadataLibrary default
		createsAsFolders: #('jquery-ui-1.13.2' 'jquery-ui-1.13.2/themes/pepper-grinder' 'jquery-ui-1.13.2/themes/pepper-grinder/images')
		andFileContentsMatching:
			{'jquery-ui-1.13.2/jquery-ui.js' -> '4a9a177bc1987254ecbf1f3a233b7441ee35cf75'},
			self expectedImageFilesContentIntegrity , 
			{'jquery-ui-1.13.2/themes/pepper-grinder/jquery-ui.css' -> '98a9abf5d5f9a833a5bd9f08f350ba655a0e34b0'.
			'jquery-ui-1.13.2/themes/pepper-grinder/theme.css' -> '70b9b3a70cdc4c9767e4d74235f39235fb4f2d86'}
]

{ #category : #tests }
JQueryUIDevelopmentMetadataLibraryTest >> testHandlesFolder [

	self
		assert:
			(JQueryUIDevelopmentMetadataLibrary
				handlesFolder: JQueryUIDevelopmentMetadataLibrary folderName);
		deny: (JQueryUIDevelopmentMetadataLibrary handlesFolder: #files)
]

{ #category : #tests }
JQueryUIDevelopmentMetadataLibraryTest >> testIsForDevelopment [

	self
		assert: JQueryUIDevelopmentMetadataLibrary isForDevelopment;
		deny: JQueryUIDevelopmentMetadataLibrary isForDeployment
]

{ #category : #tests }
JQueryUIDevelopmentMetadataLibraryTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIDevelopmentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			 '<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.13.2/themes/pepper-grinder/theme.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.13.2/themes/pepper-grinder/jquery-ui.css"/><script type="text/javascript" src="/files/jquery-ui-1.13.2/jquery-ui.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
