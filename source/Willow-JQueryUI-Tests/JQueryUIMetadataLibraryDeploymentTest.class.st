Class {
	#name : #JQueryUIMetadataLibraryDeploymentTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-JQueryUI-Tests-Libraries'
}

{ #category : #testing }
JQueryUIMetadataLibraryDeploymentTest class >> isAbstract [

	^ self = JQueryUIMetadataLibraryDeploymentTest
]

{ #category : #tests }
JQueryUIMetadataLibraryDeploymentTest >> expectedImageFilesContentIntegrity [
	
	^ { 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_diagonal-maze_20_6e4f1c_10x10.png' -> '7760178469039a9098654ed35affd1f2a94b47c4'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_diagonal-maze_40_000000_10x10.png' -> '955b310eef82c424da668c4eef1a66197c4bad14'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_10_eceadf_60x60.png' -> 'e2ce44093e62df0c86bc1de4eefc5f832060cff1'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_10_f8f7f6_60x60.png' -> 'a8e5e8bb39e6f2e609f3b8d9dde6508e3c12223f'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_15_eceadf_60x60.png' -> '93c105d68c18ed1b72f099bcd75fc50428ef7cd5'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_15_f7f3de_60x60.png' -> '05325e64963bdcdee84b91a7a688a5f7acb882b7'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_15_ffffff_60x60.png' -> '894cb2973ec0497d79db5550d9a5b6ef58c0cced'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_65_654b24_60x60.png' -> '8b9e04be879d29c6fd6b14356917cc9125457f76'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-bg_fine-grain_68_b83400_60x60.png' -> 'eeef4731c49b1a67d0a700fdca0e8b94737691cf'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_222222_256x240.png' -> '09f2174464177fad580ae63bce56fd8cef3b6332'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_3572ac_256x240.png' -> 'e0567744b3aca5da4685eea1d26b3609ee0c0fd5'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_8c291d_256x240.png' -> '478bb788977528d6674a439106714b43e9d6503c'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_b83400_256x240.png' -> '06a6d792ca8cd17e5695765dc20e0ca5b2bb5a2b'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_fbdb93_256x240.png' -> '368c6564ce15d42d0b616044cc2e41fb1a412d27'.
		 'jquery-ui-1.13.2/themes/pepper-grinder/images/ui-icons_ffffff_256x240.png' -> '32ff4770dbd9ff37e2f6744d55a66ecfe9416adc' }
]
