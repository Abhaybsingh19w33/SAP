sap.ui.define(["sap/ui/core/mvc/Controller"], function (Controller) {
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.First", {
		onListItemPress: function (oEvent) {
			var sPageId = "detailPageId";
			var oPage = oApp.getPage(sPageId);

			// this logic is for content display
			var oContext = oEvent.getSource().getBindingContext();
			oPage.setBindingContext(oContext);
			oApp.to(sPageId);
		}
	});
});