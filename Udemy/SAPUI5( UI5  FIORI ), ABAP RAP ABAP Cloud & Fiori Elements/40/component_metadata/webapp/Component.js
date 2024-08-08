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
			// this superclass function will call the metadata section, this will return the rootview
			var oView = UIComponent.prototype.createContent.apply(this, arguments);

			// we will get the data path url here
			var sPath = this.getMetadata().getConfig().serviceUrl;

			// model creation and setting data
			var oModel = new JSONModel(sPath);
			this.setModel(oModel);

			// in metadata we have declared the root view, so it is not needed anymore
			// but we were using the ID appView for navigation purposes
			// this will be solved using routing
			/*	var oView = sap.ui.view("appView",{
				viewName:"satya.prasad.mvcapp.view.App",
				type:sap.ui.core.mvc.ViewType.XML
			});*/

			oApp = oView.byId("app");

			return oView;

		}
	});
});