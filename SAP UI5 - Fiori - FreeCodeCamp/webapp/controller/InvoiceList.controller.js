sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel"
], function (Controller, JSONModel) {
    "use strict"
    return Controller.extend("sap.ui.demo.walkthrough.controller.InvoiceList", {
        onInit: function () {
            console.log("-------------InvoiceList.controller.js onInit func called-------------");
            
            var oViewModel = new JSONModel({
                currency: "EUR"
            });
            this.getView().setModel(oViewModel, "view")
        }
    })
})