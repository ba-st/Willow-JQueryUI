"
A ComponentVisibilityTogglingCommandTest is a test class for testing the behavior of ComponentVisibilityTogglingCommand
"
Class {
	#name : #ComponentVisibilityTogglingCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#pools : [
		'Willow'
	],
	#category : #'Willow-JQueryUI-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentVisibilityTogglingCommandTest >> setUp [

	super setUp.
	command := ComponentVisibilityTogglingCommand for: Classification >> #willow using: #bounce
]

{ #category : #'tests-accessing' }
ComponentVisibilityTogglingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentVisibilityTogglingCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script input |

			script := canvas javascript.
			input := canvas textInput.
			canvas ensureIdFor: input.

			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			input script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$(".willow").toggle("bounce")});</script>'
]

{ #category : #'tests-accessing' }
ComponentVisibilityTogglingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentVisibilityTogglingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
ComponentVisibilityTogglingCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
