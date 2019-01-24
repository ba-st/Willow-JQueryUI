Class {
	#name : #JQueryUIComponentSupplierTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-JQueryUI-Tests-Frontend'
}

{ #category : #private }
JQueryUIComponentSupplierTest >> assertRenderingOf: aComponentCreationBlock equals: anExpectedHtml [

	| component html |

	component := aComponentCreationBlock value: JQueryUIComponentSupplier online.

	html := self render: component.

	self assert: html equals: anExpectedHtml
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testAsynchronicButtonLabeledApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier asynchronicButtonLabeled: 'Buy' applying: [ :button | button addClass willow ] ]
		equals: '<button class="willow" type="button">Buy</button>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testAsynchronicLinkLabeledApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier asynchronicLinkLabeled: 'Buy' applying: [ :link | link addClass willow ] ]
		equals:
			'<a id="a-id1" class="willow">Buy</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testCheckboxLabeledOnModelOffModelApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				checkboxLabeled: 'Labelization'
				onModel: 3
				offModel: 'the off'
				applying: [ :checkbox | checkbox addClass willow ] ]
		equals:
			'<input class="willow" checked name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Labelization</label>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testCheckboxUnlabeledOnModelOffModelApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				checkboxUnlabeledOnModel: 3
				offModel: 'the off'
				applying: [ :checkbox | checkbox addClass willow ] ]
		equals:
			'<input class="willow" checked name="1" type="checkbox"/><input name="2" type="hidden"/>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testDecimalNumberFieldApplying [

	self
		assertRenderingOf: [ :supplier | supplier decimalNumberFieldApplying: [ :field | field addClass willow ] ]
		equals: '<input value="" name="1" type="number" class="willow"/>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testDropdownListApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier dropdownListApplying: [ :dropdownList | dropdownList addClass willow ] ]
		equals: '<select name="1" class="willow"></select>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testFieldSetContainingApplyingWithLegendApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				fieldSetContaining: 'The View'
				applying: [ :fieldSet | fieldSet beDisabled ]
				withLegend: 'Its Title'
				applying: [ :legend | legend beAutofocused ] ]
		equals:
			'<fieldset disabled><legend autofocus>Its Title</legend>The View</fieldset>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testMultiLineTextFieldApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier multiLineTextFieldApplying: [ :textField | textField addClass willow ] ]
		equals: '<textarea rows="auto" cols="auto" name="1" class="willow"></textarea>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testMultipleSelectionListBoxDisplayingAtOnceApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier multipleSelectionListBoxDisplayingAtOnce: 10 applying: [ :listBox |  ] ]
		equals: '<select name="1" size="10" multiple></select><input name="2" type="hidden"/>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testNaturalNumberFieldApplying [

	self
		assertRenderingOf: [ :supplier | supplier naturalNumberFieldApplying: [ :field | field addClass willow ] ]
		equals: '<input value="" name="1" type="number" min="0" class="willow"/>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testRadioRenderingWithApplyingToLabelApplyingToInput [

	self
		assertRenderingOf:
			[ :supplier | supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ] ]
		equals: ''.

	self
		assertRenderingOf: [ :supplier | 
			(supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ])
				allowAnyOf: #(f h);
				yourself ]
		equals:
			'<label for="radio-button-id2" class="willow"><input name="1" id="radio-button-id2" class="willow" value="1" type="radio"/>F</label><label for="radio-button-id3" class="willow"><input name="1" id="radio-button-id3" class="willow" value="2" type="radio"/>H</label>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testSingleLineTextFieldApplying [

	self
		assertRenderingOf:
			[ :supplier | supplier singleLineTextFieldApplying: [ :textField | textField addClass willow ] ]
		equals: '<input value="" name="1" class="willow" type="text"/>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testSingleSelectionListBoxDisplayingAtOnceApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				singleSelectionListBoxDisplayingAtOnce: 15
				applying: [ :listBox | listBox addClass willow ] ]
		equals: '<select name="1" size="15" class="willow"></select>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testSynchronicButtonLabeledApplyingEvaluating [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				synchronicButtonLabeled: 'Buy'
				applying: [ :button | button addClass willow ]
				evaluating: [  ] ]
		equals: '<button name="1" class="willow" type="submit">Buy</button>'
]

{ #category : #'tests-Supplying' }
JQueryUIComponentSupplierTest >> testUnorderedListApplyingListingApplyingToEach [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				unorderedListApplying: [ :list | list labelItemsWith: [ :item | 'N.<1p>' expandMacrosWith: item ] ]
				listing: #(1 2 3)
				applyingToEach: [ :listItem | listItem addClass willow ] ]
		equals:
			'<ul><li class="willow">N.1</li><li class="willow">N.2</li><li class="willow">N.3</li></ul>'
]

{ #category : #'tests-Processing' }
JQueryUIComponentSupplierTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIComponentSupplier online updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title></title><meta name="viewport" content="width=device-width, initial-scale=1.0"/><link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"/><script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/themes/pepper-grinder/jquery-ui.css" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]

{ #category : #'tests-Processing' }
JQueryUIComponentSupplierTest >> testUpdateRootWithSelfHostedLibraries [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | (JQueryUIComponentSupplier withJQueryUILibrary: JQueryUIDevelopmentMetadataLibrary default) updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title></title><meta name="viewport" content="width=device-width, initial-scale=1.0"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.structure.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.theme.css"/><script type="text/javascript" src="/files/jquery-ui-1.12.1/jquery-ui.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
