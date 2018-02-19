private
assertRenderingOf: aComponentCreationBlock equals: anExpectedHtml

	| component html |

	component := aComponentCreationBlock value: JQueryUIComponentSupplier online.

	html := self render: component.

	self assert: html equals: anExpectedHtml