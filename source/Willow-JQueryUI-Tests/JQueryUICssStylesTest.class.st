Class {
	#name : 'JQueryUICssStylesTest',
	#superclass : 'BWRenderingTest',
	#pools : [
		'Willow'
	],
	#category : 'Willow-JQueryUI-Tests-WebViews',
	#package : 'Willow-JQueryUI-Tests',
	#tag : 'WebViews'
}

{ #category : 'private - asserting' }
JQueryUICssStylesTest >> assertClassificationAt: aSymbol equals: anExpectedString [

	self assert: Classification >> #jQueryUI >> aSymbol equals: anExpectedString
]

{ #category : 'tests' }
JQueryUICssStylesTest >> testDialogs [

	self
		assertClassificationAt: #uiDialog equals: 'ui-dialog';
		assertClassificationAt: #uiDialogButtonset equals: 'ui-dialog-buttonset';
		assertClassificationAt: #uiDialogContent equals: 'ui-dialog-content'
]

{ #category : 'tests' }
JQueryUICssStylesTest >> testIcons [

	self
		assertClassificationAt: #uiIconSeekNext equals: 'ui-icon-seek-next';
		assertClassificationAt: #uiIconArrowthick1W equals: 'ui-icon-arrowthick-1-w';
		assertClassificationAt: #uiIconSeekPrev equals: 'ui-icon-seek-prev';
		assertClassificationAt: #uiIconStar equals: 'ui-icon-star';
		assertClassificationAt: #uiIconComment equals: 'ui-icon-comment';
		assertClassificationAt: #uiIconCheck equals: 'ui-icon-check';
		assertClassificationAt: #uiIconArrowthick1S equals: 'ui-icon-arrowthick-1-s';
		assertClassificationAt: #uiIconClosethick equals: 'ui-icon-closethick';
		assertClassificationAt: #uiIconPencil equals: 'ui-icon-pencil';
		assertClassificationAt: #uiIconCancel equals: 'ui-icon-cancel';
		assertClassificationAt: #uiIconMinusthick equals: 'ui-icon-minusthick';
		assertClassificationAt: #uiIconPlus equals: 'ui-icon-plus';
		assertClassificationAt: #uiIconPlusthick equals: 'ui-icon-plusthick';
		assertClassificationAt: #uiIconArrowthick1E equals: 'ui-icon-arrowthick-1-e';
		assertClassificationAt: #uiIconClose equals: 'ui-icon-close'
]

{ #category : 'tests' }
JQueryUICssStylesTest >> testWidgets [

	self
		assertClassificationAt: #uiButton equals: 'ui-button';
		assertClassificationAt: #uiButtonIconPrimary equals: 'ui-button-icon-primary';
		assertClassificationAt: #uiCornerAll equals: 'ui-corner-all';
		assertClassificationAt: #uiCornerLeft equals: 'ui-corner-left';
		assertClassificationAt: #uiFront equals: 'ui-front';
		assertClassificationAt: #uiHelperClearfix equals: 'ui-helper-clearfix';
		assertClassificationAt: #uiIcon equals: 'ui-icon';
		assertClassificationAt: #uiMenuItem equals: 'ui-menu-item';
		assertClassificationAt: #uiProgressbarValue equals: 'ui-progressbar-value';
		assertClassificationAt: #uiStateDefault equals: 'ui-state-default';
		assertClassificationAt: #uiStateFocus equals: 'ui-state-focus';
		assertClassificationAt: #uiStateHighlight equals: 'ui-state-highlight';
		assertClassificationAt: #uiStateHover equals: 'ui-state-hover';
		assertClassificationAt: #uiWidget equals: 'ui-widget';
		assertClassificationAt: #uiWidgetContent equals: 'ui-widget-content';
		assertClassificationAt: #uiWidgetHeader equals: 'ui-widget-header'
]
