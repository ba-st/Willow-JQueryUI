*Willow-JQueryUI
showJQueryUILoadingNotification

	| classes |

	classes := Array
		with: WillowCssStyles topPageNotification
		with: JQueryUICssStyles uiStateFocus
		with: JQueryUICssStyles uiWidget
		with: JQueryUICssStyles uiWidgetHeader
		with: JQueryUICssStyles uiCornerAll.
	self showLoadingNotificationStyledAsAll: classes