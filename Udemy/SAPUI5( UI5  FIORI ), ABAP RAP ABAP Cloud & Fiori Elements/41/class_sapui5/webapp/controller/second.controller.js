sap.ui.define(["sap/ui/core/mvc/Controller", "sap/ui/core/routing/History"], function (Controller, History) {
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.second", {
		onInit: function () {
			this._oRouter = sap.ui.core.UIComponent.getRouterFor(this);
			this._oRouter.getRoute("detail").attachPatternMatched(this._oRoutePatternMatched, this);
		},
		_oRoutePatternMatched: function (oEvent) {
			var sPath = "/SweetsSupplier/" + oEvent.getParameter("arguments").ID;
			this.getView().bindElement(sPath); // this will load the data for this provided path
		},
		onNavPress: function () {
			var oHistory = History.getInstance();
			var sPreviousHash = oHistory.getPreviousHash();

			if (sPreviousHash !== undefined) {
				window.history.go(-1);
			} else {
				this._oRouter.navTo("master");
			}

		}

	});

});