sap.ui.define(["sap/ui/core/mvc/Controller", "sap/ui/core/routing/History", "sap/m/MessageToast", "satya/prasad/mvcapp/utilities/utilities"],
	function (Controller, History,
		MessageToast, utilities) {
		"use strict";
		return Controller.extend("satya.prasad.mvcapp.controller.List", {
			variable: utilities
		});

	});