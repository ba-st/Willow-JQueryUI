accessing
borderedWidgetCssStyles

	^ OrderedCollection new
		addAll: self widgetCssStyles;
		add: JQueryUICssStyles uiCornerAll;
		yourself