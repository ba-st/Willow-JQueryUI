Interaction
addStatementsTo: aJSScript toCloseDialogsIn: jQueryMatchingDialogContainer matching: dialogSupplier on: aCanvas

	aJSScript << (dialogSupplier value: (aCanvas jQuery class: JQueryUICssStyles uiDialogContent)) dialog close