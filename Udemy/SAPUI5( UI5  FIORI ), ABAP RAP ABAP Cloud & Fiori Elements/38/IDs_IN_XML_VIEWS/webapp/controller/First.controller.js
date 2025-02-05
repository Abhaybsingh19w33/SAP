sap.ui.define(["sap/ui/core/mvc/Controller"], function (Controller) {
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.First", {
		onListItemPress: function (oEvent) {
			// find the system generated view id from detailPageID
			var oAppview = sap.ui.getCore().byId("appView");
			// when we try to access the view by xml reference give id provided by us
			var oDetailPageId = oAppview.byId("detailPageId");
			var sPageId = oDetailPageId.getId();
			var oPage = oApp.getPage(sPageId);

			var oContext = oEvent.getSource().getBindingContext();
			oPage.setBindingContext(oContext);
			oApp.to(sPageId);

			// if the view is generated by framework we have provide that id only to make it work
			/*var sPageId="appView--detailPageId";
			 var oPage = oApp.getPage(sPageId);
			 
			 var oContext = oEvent.getSource().getBindingContext();
			 oPage.setBindingContext(oContext);
			 oApp.to(sPageId);*/
		},
		toLowerCase: function (sValue) {
			var sString = String(sValue);
			return sString.toLowerCase();
		}
	});
});