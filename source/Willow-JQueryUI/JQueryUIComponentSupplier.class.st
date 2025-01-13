"
The catalog implementation when using JQuery UI
"
Class {
	#name : 'JQueryUIComponentSupplier',
	#superclass : 'FrontendComponentSupplier',
	#instVars : [
		'jQueryUILibraries'
	],
	#pools : [
		'Willow'
	],
	#category : 'Willow-JQueryUI-Frontend',
	#package : 'Willow-JQueryUI',
	#tag : 'Frontend'
}

{ #category : 'class initialization' }
JQueryUIComponentSupplier class >> initialize [

	<ignoreForCoverage>
	Classification bind: #topPageNotification to: 'willow-top-page-notification'.
	self initializeJQueryUIClasses
]

{ #category : 'class initialization' }
JQueryUIComponentSupplier class >> initializeDialogClasses [

	<ignoreForCoverage>
	Classification >> #jQueryUI
		bind: #uiDialog to: 'ui-dialog';
		bind: #uiDialogButtonset to: 'ui-dialog-buttonset';
		bind: #uiDialogContent to: 'ui-dialog-content'
]

{ #category : 'class initialization' }
JQueryUIComponentSupplier class >> initializeIconsClasses [

	<ignoreForCoverage>
	( Classification >> #jQueryUI )
		bind: #uiIconArrowthick1E to: 'ui-icon-arrowthick-1-e';
		bind: #uiIconArrowthick1S to: 'ui-icon-arrowthick-1-s';
		bind: #uiIconArrowthick1W to: 'ui-icon-arrowthick-1-w';
		bind: #uiIconCancel to: 'ui-icon-cancel';
		bind: #uiIconCaret1E to: 'ui-icon-caret-1-e';
		bind: #uiIconCaret1S to: ' ui-icon-caret-1-s';
		bind: #uiIconCheck to: 'ui-icon-check';
		bind: #uiIconClose to: 'ui-icon-close';
		bind: #uiIconClosethick to: 'ui-icon-closethick';
		bind: #uiIconComment to: 'ui-icon-comment';
		bind: #uiIconMinusthick to: 'ui-icon-minusthick';
		bind: #uiIconPencil to: 'ui-icon-pencil';
		bind: #uiIconPlus to: 'ui-icon-plus';
		bind: #uiIconPlusthick to: 'ui-icon-plusthick';
		bind: #uiIconSeekNext to: 'ui-icon-seek-next';
		bind: #uiIconSeekPrev to: 'ui-icon-seek-prev';
		bind: #uiIconStar to: 'ui-icon-star'
]

{ #category : 'class initialization' }
JQueryUIComponentSupplier class >> initializeJQueryUIClasses [

	<ignoreForCoverage>
	Classification bind: #jQueryUI to: Namespace new.
	( Classification >> #jQueryUI )
		bind: #uiButton to: 'ui-button';
		bind: #uiButtonIconPrimary to: 'ui-button-icon-primary';
		bind: #uiCornerAll to: 'ui-corner-all';
		bind: #uiCornerLeft to: 'ui-corner-left';
		bind: #uiFront to: 'ui-front';
		bind: #uiHelperClearfix to: 'ui-helper-clearfix';
		bind: #uiIcon to: 'ui-icon';
		bind: #uiMenuItem to: 'ui-menu-item';
		bind: #uiProgressbarValue to: 'ui-progressbar-value';
		bind: #uiStateDefault to: 'ui-state-default';
		bind: #uiStateFocus to: 'ui-state-focus';
		bind: #uiStateHighlight to: 'ui-state-highlight';
		bind: #uiStateHover to: 'ui-state-hover';
		bind: #uiWidget to: 'ui-widget';
		bind: #uiWidgetContent to: 'ui-widget-content';
		bind: #uiWidgetHeader to: 'ui-widget-header'.
	self
		initializeDialogClasses;
		initializeIconsClasses
]

{ #category : 'instance creation' }
JQueryUIComponentSupplier class >> online [

	^ self usingAll: {JQueryUIOnlineLibrary default}
]

{ #category : 'instance creation - private' }
JQueryUIComponentSupplier class >> usingAll: aLibraryCollection [

	^ self new initializeUsingAll: aLibraryCollection
]

{ #category : 'instance creation' }
JQueryUIComponentSupplier class >> withJQueryUILibrary: aJQueryUILibrary [

	^ self usingAll: {aJQueryUILibrary}
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> asynchronicButtonLabeled: aRenderable applying: aComponentCommand [

	^ AsynchronicButtonWebView labeled: aRenderable applying: aComponentCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> asynchronicLinkLabeled: aRenderable applying: aComponentCommand [

	^ LinkWebView asynchronicLabeled: aRenderable applying: aComponentCommand
]

{ #category : 'accessing' }
JQueryUIComponentSupplier >> borderedWidgetCssStyles [

	^ OrderedCollection new
		addAll: self widgetCssStyles;
		add: self jQueryUI >> #uiCornerAll;
		yourself
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> checkboxLabeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		labeled: aRenderable
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> checkboxUnlabeledOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> decimalNumberFieldApplying: aComponentCommand [

	^ NumberFieldWebView applying: aComponentCommand transformingWith: FloatCodec new
]

{ #category : 'Supplying - Non Portable' }
JQueryUIComponentSupplier >> dialogBuilder [

	^ JQueryUIDialogBuilder new
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> dropdownListApplying: aComponentCommand applyingToOptions: anOptionCommand [

	^ SingleSelectionWebView
		dropDownListApplying: aComponentCommand
		applyingToOptions: anOptionCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> fieldSetContaining: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand [

	^ FieldSetWebView
		containing: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand
]

{ #category : 'Supplying - Non Portable' }
JQueryUIComponentSupplier >> fieldSetTitled: aTitle containing: aWebView styledAsAll: aCssStyleCollection [

	| styles fieldSetCommand |

	styles := self widgetCssStyles
		addAll: aCssStyleCollection;
		yourself.
	fieldSetCommand := ComponentClassificationCommand toStyleWithAll: styles.
	^ self
		fieldSetContaining: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying:
			[ :legend | legend addClass jQueryUI uiWidgetHeader + legend addClass jQueryUI uiCornerAll ]
]

{ #category : 'initialization' }
JQueryUIComponentSupplier >> initializeUsingAll: aLibraryCollection [

	jQueryUILibraries := aLibraryCollection
]

{ #category : 'Supplying - Non Portable' }
JQueryUIComponentSupplier >> interactiveButtonDescribedBy: aString [

	^ self
		synchronicButtonLabeled: aString
		applying: (JQueryUIButtonCommand describedBy: aString)
		evaluating: [  ]
]

{ #category : 'Supplying - Non Portable' }
JQueryUIComponentSupplier >> interactiveButtonDescribedBy: aDescription representedBy: anIcon [

	^ self
		synchronicButtonLabeled: aDescription
		applying: (JQueryUIButtonCommand representedBy: anIcon)
		evaluating: [  ]
]

{ #category : 'accessing - private' }
JQueryUIComponentSupplier >> jQueryUI [

	^ Classification >> #jQueryUI
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> multiLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView multiLineApplying: aComponentCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> multipleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	^ MultipleSelectionListBoxWebView
		displayingAtOnce: aNumberOfElements
		applying: aComponentCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> naturalNumberFieldApplying: aComponentCommand [

	^ NumberFieldWebView
		applying: [ :field | field boundNotNegative + aComponentCommand ]
		transformingWith: NaturalNumberCodec new
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> radioRenderingWith: aRenderingBlock applyingToLabel: aCommandToLabel applyingToInput: aCommandToInput [

	^RadioGroupWebView 
		renderingWith: aRenderingBlock 
		applyingToLabel: aCommandToLabel 
		applyingToInput: aCommandToInput
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> singleLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView singleLineApplying: aComponentCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> singleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand applyingToOptions: anOptionCommand [

	^ SingleSelectionWebView
		listBoxDisplayingAtOnce: aNumberOfElements
		applying: aComponentCommand
		applyingToOptions: anOptionCommand
]

{ #category : 'Interaction' }
JQueryUIComponentSupplier >> statementToCloseDialogsIn: jQueryMatchingDialogContainer matching: dialogSupplier on: aCanvas [

	^ ( dialogSupplier value: ( aCanvas jQuery class: self jQueryUI >> #uiDialogContent ) ) dialog
		close
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> synchronicButtonLabeled: aRenderable applying: aComponentCommand evaluating: anActionBlock [

	^ SynchronicSubmitButtonWebView
		labeled: aRenderable
		applying: aComponentCommand
		evaluating: anActionBlock
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> synchronicLinkLabeled: aRenderable applying: aComponentCommand [

	^ LinkWebView synchronicLabeled: aRenderable applying: aComponentCommand
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> tableBuilder [

	^ TableWebViewBuilder new
]

{ #category : 'Supplying' }
JQueryUIComponentSupplier >> unorderedListApplying: aCommandToList listing: aCollection applyingToEach: aCommandToItem [

	^ UnorderedListWebView
		applying: aCommandToList
		listing: aCollection
		applyingToEach: aCommandToItem
]

{ #category : 'Processing' }
JQueryUIComponentSupplier >> updateRoot: aRoot [

	aRoot beHtml5.
	aRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1.0'.
	jQueryUILibraries do: [ :library | library updateRoot: aRoot ]
]

{ #category : 'accessing - private' }
JQueryUIComponentSupplier >> widgetCssStyles [

	^ OrderedCollection new
		add: self jQueryUI >> #uiWidget;
		add: self jQueryUI >> #uiWidgetContent;
		yourself
]
