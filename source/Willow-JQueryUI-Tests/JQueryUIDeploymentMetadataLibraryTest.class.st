Class {
	#name : #JQueryUIDeploymentMetadataLibraryTest,
	#superclass : #JQueryUIMetadataLibraryDeploymentTest,
	#category : #'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #tests }
JQueryUIDeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQueryUIDeploymentMetadataLibrary default
		createsAsFolders: #('jquery-ui-1.13.2' 'jquery-ui-1.13.2/themes/pepper-grinder' 'jquery-ui-1.13.2/themes/pepper-grinder/images')
		andFileContentsMatching:
			{'jquery-ui-1.13.2/jquery-ui.min.js' -> '17d386d23640c5f80725ba1e785a57a1f7c485f0'} , 
			self expectedImageFilesContentIntegrity , 
			{'jquery-ui-1.13.2/themes/pepper-grinder/jquery-ui.min.css' -> '30649dc7073cd092dfda640262fd028260221244'.
			 'jquery-ui-1.13.2/themes/pepper-grinder/theme.css' -> '70b9b3a70cdc4c9767e4d74235f39235fb4f2d86'}
]

{ #category : #tests }
JQueryUIDeploymentMetadataLibraryTest >> testHandlesFolder [

	self
		assert: (JQueryUIDeploymentMetadataLibrary handlesFolder: JQueryUIDeploymentMetadataLibrary folderName);
		deny: (JQueryUIDeploymentMetadataLibrary handlesFolder: #files)
]

{ #category : #tests }
JQueryUIDeploymentMetadataLibraryTest >> testIsForDevelopment [

	self
		assert: JQueryUIDeploymentMetadataLibrary isForDeployment;
		deny: JQueryUIDeploymentMetadataLibrary isForDevelopment
]

{ #category : #tests }
JQueryUIDeploymentMetadataLibraryTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIDeploymentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			 '<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.13.2/themes/pepper-grinder/theme.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.13.2/themes/pepper-grinder/jquery-ui.min.css"/><script type="text/javascript" src="/files/jquery-ui-1.13.2/jquery-ui.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
