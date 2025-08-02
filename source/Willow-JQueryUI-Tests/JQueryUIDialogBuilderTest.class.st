Class {
	#name : 'JQueryUIDialogBuilderTest',
	#superclass : 'BWRenderingTest',
	#category : 'Willow-JQueryUI-Tests-WebViews',
	#package : 'Willow-JQueryUI-Tests',
	#tag : 'WebViews'
}

{ #category : 'accessing' }
JQueryUIDialogBuilderTest >> componentSupplier [

	^ JQueryUIComponentSupplier online
]

{ #category : 'utility' }
JQueryUIDialogBuilderTest >> createHandlers [

	^ Array with: self
]

{ #category : 'testing' }
JQueryUIDialogBuilderTest >> isSession [

	^ true
]

{ #category : 'utility' }
JQueryUIDialogBuilderTest >> scriptGeneratorClass [

	^ WADefaultScriptGenerator
]

{ #category : 'tests' }
JQueryUIDialogBuilderTest >> testCantBuildWithoutTitle [

	self should: [ JQueryUIComponentSupplier online dialogBuilder build ] raise: AssertionFailed
]

{ #category : 'tests' }
JQueryUIDialogBuilderTest >> testRenderContentOnWithCommands [

	| html |

	html := self render: [ :canvas |
			        | dialog |

			        dialog := JQueryUIComponentSupplier online dialogBuilder
				                  dismissableHeaderTitled: 'Terms and Conditions';
				                  wrapping: 'Some very large legal stuff. ;)';
				                  buildApplying: [ :document | document addClass willow ].
			        canvas render: dialog
		        ].

	self
		assert: html
		equals:
		'<div id="container-id1" class="willow">Some very large legal stuff. ;)</div><script type="text/javascript">$("#container-id1").dialog({"close":function(){$("#container-id1").closest("div.ui-dialog").remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]

{ #category : 'tests' }
JQueryUIDialogBuilderTest >> testRenderContentOnWithConfirmationButton [

	| html dialog |

	dialog := JQueryUIComponentSupplier online dialogBuilder
		          dismissableHeaderTitled: 'Terms and Conditions';
		          wrapping: 'Some very large legal stuff. ;)';
		          confirmWith: 'Ok';
		          build.

	html := self render: dialog.

	self
		assert: html
		equals:
		'<div id="container-id1">Some very large legal stuff. ;)</div><script type="text/javascript">$("#container-id1").dialog({"buttons":{"Ok":function(){Willow.callServer({"type":"POST","url":"/","data":["2",$(this).children("form").serialize(),$(this).serialize()].join("&")})}},"close":function(){$("#container-id1").closest("div.ui-dialog").remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]

{ #category : 'tests' }
JQueryUIDialogBuilderTest >> testRenderContentOnWithCustomConfirmationCommand [

	| html dialog |

	dialog := JQueryUIComponentSupplier online dialogBuilder
		          dismissableHeaderTitled: 'Terms and Conditions';
		          wrapping: 'Some very large legal stuff. ;)';
		          confirmWith: 'Ok';
		          build.
	dialog onConfirmationDo: [ :request :defaultCommand |
			request onRespond inform: 'Hello!'.
			defaultCommand value
		].

	html := self render: dialog.

	self
		assert: html
		equals:
		'<div id="container-id1">Some very large legal stuff. ;)</div><script type="text/javascript">$("#container-id1").dialog({"buttons":{"Ok":function(){Willow.callServer({"type":"POST","url":"/","data":["2",$(this).children("form").serialize(),$(this).serialize()].join("&")})}},"close":function(){$("#container-id1").closest("div.ui-dialog").remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]

{ #category : 'tests' }
JQueryUIDialogBuilderTest >> testRenderContentOnWithoutConfirmationButton [

	| html dialog |

	dialog := JQueryUIComponentSupplier online dialogBuilder
		          dismissableHeaderTitled: 'Terms and Conditions';
		          wrapping: 'Some very large legal stuff. ;)';
		          build.

	html := self render: dialog.

	self
		assert: html
		equals:
		'<div id="container-id1">Some very large legal stuff. ;)</div><script type="text/javascript">$("#container-id1").dialog({"close":function(){$("#container-id1").closest("div.ui-dialog").remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]
