"
The catalog implementation when using JQuery UI
"
Class {
	#name : #JQueryUIComponentSupplier,
	#superclass : #FrontendComponentSupplier,
	#instVars : [
		'jQueryUILibraries'
	],
	#category : 'Willow-JQueryUI-Frontend'
}

{ #category : #'instance creation' }
JQueryUIComponentSupplier class >> online [

	^ self usingAll: {JQueryUIOnlineLibrary default}
]

{ #category : #'instance creation - private' }
JQueryUIComponentSupplier class >> usingAll: aLibraryCollection [

	^ self new initializeUsingAll: aLibraryCollection
]

{ #category : #'instance creation' }
JQueryUIComponentSupplier class >> withJQueryUILibrary: aJQueryUILibrary [

	^ self usingAll: {aJQueryUILibrary}
]

{ #category : #Interaction }
JQueryUIComponentSupplier >> addStatementsTo: aJSScript toCloseDialogsIn: jQueryMatchingDialogContainer matching: dialogSupplier on: aCanvas [

	aJSScript << (dialogSupplier value: (aCanvas jQuery class: JQueryUICssStyles uiDialogContent)) dialog close
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> asynchronicButtonLabeled: aRenderable applying: aComponentCommand [

	^ AsynchronicButtonWebView labeled: aRenderable applying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> asynchronicLinkLabeled: aRenderable applying: aComponentCommand [

	^ LinkWebView asynchronicLabeled: aRenderable applying: aComponentCommand
]

{ #category : #accessing }
JQueryUIComponentSupplier >> borderedWidgetCssStyles [

	^ OrderedCollection new
		addAll: self widgetCssStyles;
		add: JQueryUICssStyles uiCornerAll;
		yourself
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> checkboxLabeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		labeled: aRenderable
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> checkboxUnlabeledOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> decimalNumberFieldApplying: aComponentCommand [

	^ NumberFieldWebView applying: aComponentCommand transformingWith: FloatCodec new
]

{ #category : #'Supplying - Non Portable' }
JQueryUIComponentSupplier >> dialogBuilder [

	^ JQueryUIDialogBuilder new
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> dropdownListApplying: aComponentCommand [

	^ DropDownListWebView applying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> fieldSetContaining: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand [

	^ FieldSetWebView
		containing: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand
]

{ #category : #'Supplying - Non Portable' }
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

{ #category : #'Supplying - Non Portable' }
JQueryUIComponentSupplier >> headlessTableShowing: aColumnRendererCollection applying: aCommand [

	^ TableWebView headlessDefinedBy: aColumnRendererCollection applying: aCommand
]

{ #category : #initialization }
JQueryUIComponentSupplier >> initializeUsingAll: aLibraryCollection [

	jQueryUILibraries := aLibraryCollection
]

{ #category : #'Supplying - Non Portable' }
JQueryUIComponentSupplier >> interactiveButtonDescribedBy: aString [

	^ self
		synchronicButtonLabeled: aString
		applying: (JQueryUIButtonCommand describedBy: aString)
		evaluating: [  ]
]

{ #category : #'Supplying - Non Portable' }
JQueryUIComponentSupplier >> interactiveButtonDescribedBy: aDescription representedBy: anIcon [

	^ self
		synchronicButtonLabeled: aDescription
		applying: (JQueryUIButtonCommand representedBy: anIcon)
		evaluating: [  ]
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> multiLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView multiLineTriggeringOnChangeApplying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> multipleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	^ MultipleSelectionListBoxWebView
		displayingAtOnce: aNumberOfElements
		applying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> radioRenderingWith: aRenderingBlock applyingToLabel: aCommandToLabel applyingToInput: aCommandToInput [

	^RadioGroupWebView 
		renderingWith: aRenderingBlock 
		applyingToLabel: aCommandToLabel 
		applyingToInput: aCommandToInput
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> singleLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> singleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	^ SingleSelectionListBoxWebView
		displayingAtOnce: aNumberOfElements
		applying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> synchronicButtonLabeled: aRenderable applying: aComponentCommand evaluating: anActionBlock [

	^ SynchronicSubmitButtonWebView
		labeled: aRenderable
		applying: aComponentCommand
		evaluating: anActionBlock
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> synchronicLinkLabeled: aRenderable applying: aComponentCommand [

	^ LinkWebView synchronicLabeled: aRenderable applying: aComponentCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> tableBuilder [

	^ TableWebViewBuilder new
]

{ #category : #'Supplying - Non Portable' }
JQueryUIComponentSupplier >> tableShowing: aColumnRendererCollection applying: aCommand [

	^ TableWebView headedDefinedBy: aColumnRendererCollection applying: aCommand
]

{ #category : #Supplying }
JQueryUIComponentSupplier >> unorderedListApplying: aCommandToList listing: aCollection applyingToEach: aCommandToItem [

	^ UnorderedListWebView
		applying: aCommandToList
		listing: aCollection
		applyingToEach: aCommandToItem
]

{ #category : #Processing }
JQueryUIComponentSupplier >> updateRoot: aRoot [

	aRoot beHtml5.
	aRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1.0'.
	jQueryUILibraries do: [ :library | library updateRoot: aRoot ]
]

{ #category : #'accessing - private' }
JQueryUIComponentSupplier >> widgetCssStyles [

	^ OrderedCollection new
		add: JQueryUICssStyles uiWidget;
		add: JQueryUICssStyles uiWidgetContent;
		yourself
]
