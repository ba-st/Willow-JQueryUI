Class {
	#name : #JQueryUIDialogBuilderTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-JQueryUI-Tests-WebViews'
}

{ #category : #tests }
JQueryUIDialogBuilderTest >> testCantBuildWithoutTitle [

	self should: [ JQueryUIComponentSupplier online dialogBuilder build ] raise: AssertionFailed
]

{ #category : #tests }
JQueryUIDialogBuilderTest >> testRenderContentOnWithCommands [

	| html dialog |

	dialog := JQueryUIComponentSupplier online dialogBuilder
		dismissableHeaderTitled: 'Terms and Conditions';
		wrapping: 'Some very large legal stuff. ;)';
		buildApplying: [ :document | document addClass willow  ].

	html := self render: dialog.

	self
		assert: html
		equals:
			'<div class="willow" id="id1">Some very large legal stuff. ;)</div><script type="text/javascript">$("#id1").dialog({"close":function(){$(this).remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]

{ #category : #tests }
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
			'<div id="id2">Some very large legal stuff. ;)</div><script type="text/javascript">$("#id2").dialog({"buttons":{"Ok":function(){$(this).remove();$("#willow-dialog-section").html("");Willow.callServer({"type":"POST","url":"/","data":["1",$(this).children("form").serialize()].join("&")})}},"close":function(){$(this).remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]

{ #category : #tests }
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
			'<div id="id1">Some very large legal stuff. ;)</div><script type="text/javascript">$("#id1").dialog({"close":function(){$(this).remove();$("#willow-dialog-section").html("")},"height":"auto","width":"auto","title":"Terms and Conditions","autoOpen":true,"resizable":false,"closeOnEscape":true});</script>'
]
