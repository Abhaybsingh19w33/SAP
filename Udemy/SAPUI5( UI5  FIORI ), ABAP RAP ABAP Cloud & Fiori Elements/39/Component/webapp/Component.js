sap.ui.define(["sap/ui/model/json/JSONModel", "sap/ui/core/UIComponent"], function (JSONModel, UIComponent) {
	"use strict";
	return UIComponent.extend("satya.prasad.mvcapp.Component", {

		createContent: function () {
			UIComponent.prototype.createContent.apply(this, arguments);
			/*	var oView = UIComponent.prototype.createContent.apply(this,arguments);*/
			var oData = {
				"CountSweets": "2",
				"SweetsSupplier": [
					{
						"ID": 0,
						"Name": "Sweet Magic",
						"Address": {
							"Street": "Sivarao Street",
							"City": "Vijayawada",
							"State": "Andhra Pradesh",
							"ZipCode": "521456",
							"Country": "INDIA"
						}
					},
					{
						"ID": "1",
						"Name": "Aanjaneya Sweets",
						"Address": {
							"Street": "Bhavanipuram",
							"City": "Vijayawada",
							"State": "Andhra Pradesh",
							"ZipCode": "521456",
							"Country": "INDIA"
						}
					}
				]
			};

			// model creation and setting data
			var oModel = new JSONModel();
			oModel.setData(oData);
			this.setModel(oModel);

			var oView = sap.ui.view("appView", {
				viewName: "satya.prasad.mvcapp.view.App",
				type: sap.ui.core.mvc.ViewType.XML
			});

			oApp = oView.byId("app");

			return oView;
		}
	});
});