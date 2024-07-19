sap.ui.define(["sap/ui/core/mvc/Controller", "sap/ui/core/routing/History", "sap/m/MessageToast"], function(Controller, History,
	MessageToast) {
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.second", {
		onInit: function() {
			sap.ui.getCore().getMessageManager().registerObject(this.getView(),true);
			this._oRouter = sap.ui.core.UIComponent.getRouterFor(this);
			this._oRouter.getRoute("detail").attachPatternMatched(this._oRoutePatternMatched, this);
		},
		_oRoutePatternMatched: function(oEvent) {
			var sPath = "/SweetsSupplier/" + oEvent.getParameter("arguments").ID;
			this.getView().bindElement(sPath);
		},
		onNavPress: function() {
			var oHistory = History.getInstance();
			var sPreviousHash = oHistory.getPreviousHash();

			if (sPreviousHash !== undefined) {
				window.history.go(-1);
			} else {
				this._oRouter.navTo("master");
			}

		},
		onPress: function() {
			var msg = this.getView().getModel("i18n").getResourceBundle().getText("Name", ['Hai How are you?']);
			MessageToast.show(msg);
		},
		onList:function(){
			this._oRouter.navTo("list");
		}
	});

});