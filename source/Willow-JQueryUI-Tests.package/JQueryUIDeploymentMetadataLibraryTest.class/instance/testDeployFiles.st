tests
testDeployFiles

	self
		useFileTestingPlatformDuring: [ JQueryUIDeploymentMetadataLibrary default deployFiles.
			self
				assert: GRPlatform current createdFolders equals: #('jquery-ui-1.12.1' 'jquery-ui-1.12.1/images');
				assert: GRPlatform current createdFiles
					equals:
					#('jquery-ui-1.12.1/images/ui-bg_diagonal-maze_20_6e4f1c_10x10.png' 'jquery-ui-1.12.1/images/ui-bg_diagonal-maze_40_000000_10x10.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_10_eceadf_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_10_f8f7f6_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_eceadf_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_f7f3de_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_15_ffffff_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_65_654b24_60x60.png' 'jquery-ui-1.12.1/images/ui-bg_fine-grain_68_b83400_60x60.png' 'jquery-ui-1.12.1/images/ui-icons_222222_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_3572ac_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_8c291d_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_b83400_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_fbdb93_256x240.png' 'jquery-ui-1.12.1/images/ui-icons_ffffff_256x240.png' 'jquery-ui-1.12.1/jquery-ui.min.css' 'jquery-ui-1.12.1/jquery-ui.min.js') ]