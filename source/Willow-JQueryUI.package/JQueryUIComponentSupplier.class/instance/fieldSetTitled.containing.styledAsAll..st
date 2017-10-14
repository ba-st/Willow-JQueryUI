Supplying
fieldSetTitled: aTitle containing: aWebView styledAsAll: aCssStyleCollection

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