sap.ui.define(["sap/ui/model/json/JSONModel", "sap/ui/core/UIComponent"], function (JSONModel, UIComponent) {
	"use strict";
	return UIComponent.extend("satya.prasad.mvcapp.Component", {
		"metadata": {
			"rootView": "satya.prasad.mvcapp.view.App",
			"config": {
				"serviceUrl": "webapp/model/defaultmodel.json"
			}
		},
		createContent: function () {
			var oView = UIComponent.prototype.createContent.apply(this, arguments);

			var sPath = this.getMetadata().getConfig().serviceUrl;

			// model creation and setting data
			var oModel = new JSONModel(sPath);
			this.setModel(oModel);

			/*	var oView = sap.ui.view("appView",{
				viewName:"satya.prasad.mvcapp.view.App",
				type:sap.ui.core.mvc.ViewType.XML
			});*/

			oApp = oView.byId("app");

			return oView;

		}
	});
});