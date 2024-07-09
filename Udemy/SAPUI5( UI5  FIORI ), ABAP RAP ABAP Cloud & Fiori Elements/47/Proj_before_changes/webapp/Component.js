sap.ui.define(["sap/ui/model/json/JSONModel", "sap/ui/core/UIComponent"], function(JSONModel, UIComponent) {
	"use strict";
	return UIComponent.extend("satya.prasad.mvcapp.Component", {
		"metadata": {
			manifest: "json"
		},
		init: function() {
			UIComponent.prototype.init.apply(this, arguments);
			this.getRouter().initialize();
		}
	});
});