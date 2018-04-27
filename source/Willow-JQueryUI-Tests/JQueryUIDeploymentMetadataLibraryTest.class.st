Class {
	#name : #JQueryUIDeploymentMetadataLibraryTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #tests }
JQueryUIDeploymentMetadataLibraryTest >> testDeployFiles [

	self
		assertFileDeploymentOf: JQueryUIDeploymentMetadataLibrary default
		createsAsFolders: #('jquery-ui-1.12.1' 'jquery-ui-1.12.1/images')
		andFileContentsMatching:
			{('jquery-ui-1.12.1/images/ui-bg_diagonal-maze_20_6e4f1c_10x10.png' -> '1c3395cc66f28680e90a252a85cc5242716d3a6f').
			('jquery-ui-1.12.1/images/ui-bg_diagonal-maze_40_000000_10x10.png' -> 'b09e102e17165a659624989a31e8ec0ef76164ab').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_10_eceadf_60x60.png' -> '57964b61c127c8cdbdd95e07a5c2113612c31c35').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_10_f8f7f6_60x60.png' -> '9c945e47ec08171de50e9d691731ddae14fd3071').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_15_eceadf_60x60.png' -> '91b5211b092a9f9fbf161f91326074e2bad7bf31').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_15_f7f3de_60x60.png' -> '90072e3afa3bceb8bb30587d997669e6bab4f8db').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_15_ffffff_60x60.png' -> '8e6032ce3d6ff4f9045280828971bb6ba8c46632').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_65_654b24_60x60.png' -> '5b124d3b352c01146237800529339ac68b2a4d4c').
			('jquery-ui-1.12.1/images/ui-bg_fine-grain_68_b83400_60x60.png' -> 'ca33f208fa48224accc9ebfebe6382c13fd59131').
			('jquery-ui-1.12.1/images/ui-icons_222222_256x240.png' -> 'ed25437c00514462b174d5d884b2eaccb6b38746').
			('jquery-ui-1.12.1/images/ui-icons_3572ac_256x240.png' -> 'cd3fe4165c59a981c6ebea29805e7c46eacc824f').
			('jquery-ui-1.12.1/images/ui-icons_8c291d_256x240.png' -> '56935052738e785e9fe9bc543e8234bd2575686a').
			('jquery-ui-1.12.1/images/ui-icons_b83400_256x240.png' -> '7de7010565d32e5558cad7786744bbff9a4a07f6').
			('jquery-ui-1.12.1/images/ui-icons_fbdb93_256x240.png' -> '9a05a4bf6d24719dfca790788b15299b9c5c537c').
			('jquery-ui-1.12.1/images/ui-icons_ffffff_256x240.png' -> '2dcd9f88298724135571dd8460bc32b52d782a75').
			('jquery-ui-1.12.1/jquery-ui.min.js' -> '6599f4c15128a0d44cff63bf0a063bf1ccea7562').
			('jquery-ui-1.12.1/jquery-ui.structure.min.css' -> 'ae5f08c185765e64b85aabdd19b1118f13261112').
			('jquery-ui-1.12.1/jquery-ui.theme.min.css' -> 'decb8ec2b4fc1f7ce1595c0d0a588cee435507dd')}
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
			'<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.structure.min.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.theme.min.css"/><script type="text/javascript" src="/files/jquery-ui-1.12.1/jquery-ui.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
