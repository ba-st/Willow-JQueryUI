Interaction
closeDialogsIn: aDialogSectionJQuery suppliedBy: dialogSupplier on: aCanvas

	^ (dialogSupplier value: (aDialogSectionJQuery children: (CssUniversalSelector implicit class: JQueryCssStyles uiDialogContent) asJavascript)) dialog close