accessing - private
widgetCssStyles

	^ OrderedCollection new
		add: JQueryUICssStyles uiWidget;
		add: JQueryUICssStyles uiWidgetContent;
		yourself