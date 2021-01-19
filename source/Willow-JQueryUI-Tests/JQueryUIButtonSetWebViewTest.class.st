Class {
	#name : #JQueryUIButtonSetWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-JQueryUI-Tests-WebViews'
}

{ #category : #tests }
JQueryUIButtonSetWebViewTest >> testOn [

	| buttonSet html |

	buttonSet := JQueryUIButtonSetWebView applying: [  ] obtainingCommandFrom: [ :each | [  ] ].
	buttonSet allowAnyOf: #(one two).
	buttonSet on trigger inform: 'Triggered'.

	html := self renderUsing: [ :canvas | canvas render: buttonSet ].

	self
		assert: html
		equals:
			'<div id="id1"><input id="radio-button-id3" name="2" value="1" type="radio"/><label for="radio-button-id3"></label><input id="radio-button-id4" name="2" value="2" type="radio"/><label for="radio-button-id4"></label></div><script type="text/javascript">$("#id1").buttonset();$("#radio-button-id3").change(function(event){alert("Triggered")});$("#radio-button-id4").change(function(event){alert("Triggered")});</script>'
]

{ #category : #tests }
JQueryUIButtonSetWebViewTest >> testRenderContentOn [

	| buttonSet html |

	buttonSet := JQueryUIButtonSetWebView
		applying: [ :view | view addClass willow ]
		obtainingCommandFrom: [ :each | [ :optionLabel | optionLabel setTitleTo: each ] ].
	buttonSet allowAnyOf: #(one two).

	html := self renderUsing: [ :canvas | canvas render: buttonSet ].

	self
		assert: html
		equals:
		'<div id="id1" class="willow"><input id="radio-button-id3" name="2" value="1" type="radio"/><label title="one" for="radio-button-id3"></label><input id="radio-button-id4" name="2" value="2" type="radio"/><label title="two" for="radio-button-id4"></label></div><script type="text/javascript">$("#id1").buttonset();</script>'
]
