sap.ui.define(["sap/ui/core/mvc/Controller"], function (Controller) {
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.First", {
		onListItemPress: function (oEvent) {
			/*this.getView().getModel().setDefaultBindingMode("OneWay");*/
			var oSelectedItem = oEvent.getSource();
			var oCtxt = oSelectedItem.getBindingContext();
			var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
			oRouter.navTo("detail", {
				ID: oCtxt.getProperty("ID")
			});
		}
	});
});