sap.ui.define(["sap/ui/model/json/JSONModel", "sap/ui/core/UIComponent"], function (JSONModel, UIComponent) {
	"use strict";
	return UIComponent.extend("satya.prasad.mvcapp.Component", {
		"metadata": {
			"rootView": "satya.prasad.mvcapp.view.App",
			"config": {
				"serviceUrl": "webapp/model/defaultmodel.json"
			},
			//routing start- global configuration for the router
			"routing": {
				"config": {
					"routerClass": "sap.m.routing.Router", //standard router class provided by sap
					"viewType": "XML", //all our views in routing are XML Views
					"viewPath": "satya.prasad.mvcapp.view", //folder in which views are present
					"controlId": "app", //control in which views should be placed
					"controlAggregation": "pages", //aggregation in which views should be placed
					"transition": "slide" //we can try flip/show transitions as well
				},
				"routes": [
					{
						"pattern": "", //no text after # in URL
						"name": "master",
						"target": "master1"
					},
					{
						"pattern": "detail/{ID}", // => URL Pattern looks like this - #/detail/0 or 1 -> ID is mandatory parameter
						"name": "detail",
						"target": "detail"
					}
				],
				"targets": { // targets define which view should be displayed
					"master1": {
						"viewName": "First", //view path is defined in global configuration of the router- no need to define full path
						"viewLevel": 1 //slides to left
						/* "controlAggregation":"pages"*/
					},
					"detail": {
						"viewName": "second",
						"viewLevel": 2 //slides to right
					}
				}
			}
			//routing end
		},
		init: function () {
			UIComponent.prototype.init.apply(this, arguments);
			this.getRouter().initialize(); // mandatory
		},
		createContent: function () {
			var oView = UIComponent.prototype.createContent.apply(this, arguments);
			var sPath = this.getMetadata().getConfig().serviceUrl;
			// model creation and setting data
			var oModel = new JSONModel(sPath);
			this.setModel(oModel);

			return oView;
		}
	});
});