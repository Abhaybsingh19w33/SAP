sap.ui.define(["sap/ui/core/mvc/Controller"],function(Controller){
	"use strict";
	return Controller.extend("satya.prasad.mvcapp.controller.First",{
		onListItemPress:function(oEvent){
		var oAppview = sap.ui.getCore().byId("appView");
		var oDetailPageId = oAppview.byId("detailPageId");
		var sPageId	= oDetailPageId.getId();
		 var oPage = oApp.getPage(sPageId);
		 
		 var oContext = oEvent.getSource().getBindingContext();
		 oPage.setBindingContext(oContext);
		 oApp.to(sPageId);	
		 		
		/*var sPageId="appView--detailPageId";
		 var oPage = oApp.getPage(sPageId);
		 
		 var oContext = oEvent.getSource().getBindingContext();
		 oPage.setBindingContext(oContext);
		 oApp.to(sPageId);*/	
		}
	});
});