private - configuring
configureAcceptButton

	self onTrigger
		serializeChildForm;
		executeOnClient: [ :aScript :canvas | aScript << (self functionToRemoveComponentOn: canvas) ]