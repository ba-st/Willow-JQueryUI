Class {
	#name : #JQueryUIDevelopmentMetadataLibraryTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #tests }
JQueryUIDevelopmentMetadataLibraryTest >> testDeployFiles [

	self
		useFileTestingPlatformDuring: [ JQueryUIDevelopmentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jquery-ui-1.12.1' 'jquery-ui-1.12.1/images');
				assert: GRPlatform current createdFiles
					equals:
					#('jquery-ui-1.12.1/images/ui-bg_diagonal-maze_20_6e4f1c_10x10.png' 'jquery-ui-1.12.1/images/ui-bg_diagonal-maze_40_000000_10x10.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_10_eceadf_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_10_f8f7f6_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_eceadf_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_f7f3de_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_ffffff_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_65_654b24_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_68_b83400_60x60.png' 'jquery-ui-1.12.1/images/ui-icons_222222_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_3572ac_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_8c291d_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_b83400_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_fbdb93_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_ffffff_256x240.png' 'jquery-ui-1.12.1/jquery-ui.js' 'jquery-ui-1.12.1/jquery-ui.structure.css' 'jquery-ui-1.12.1/jquery-ui.theme.css') ]
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
			'<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.structure.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.theme.css"/><script type="text/javascript" src="/files/jquery-ui-1.12.1/jquery-ui.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
