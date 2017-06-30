Interaction
closeDialogsIn: aDialogSectionJQuery suppliedBy: dialogSupplier on: aCanvas

	^ (dialogSupplier value: (aCanvas jQuery class: JQueryCssStyles uiDialogContent)) dialog
		close