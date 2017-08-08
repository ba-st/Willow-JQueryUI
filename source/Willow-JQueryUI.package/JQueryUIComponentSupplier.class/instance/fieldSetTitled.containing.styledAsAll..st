Supplying
fieldSetTitled: aTitle containing: aWebView styledAsAll: aCssStyleCollection

	| styles fieldSetCommand legendCommand |

	styles := self widgetCssStyles
		addAll: aCssStyleCollection;
		yourself.
	fieldSetCommand := ComponentClassificationCommand toStyleWithAll: styles.
	styles := Array
		with: JQueryUICssStyles uiWidgetHeader
		with: JQueryUICssStyles uiCornerAll.
	legendCommand := ComponentClassificationCommand toStyleWithAll: styles.
	^ self
		fieldSetContaining: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand