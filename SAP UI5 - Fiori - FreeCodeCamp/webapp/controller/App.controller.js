sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict"
    return Controller.extend("sap.ui.demo.walkthrough.App", {
        onInit: function () {
            console.log("-------------App.controller.js onInit func called-------------");
        
            this.getView().addStyleClass(this.getOwnerComponent().getContentDensityClass());
        },

        onOpenDialog: function () {
            console.log("-------------App.controller.js onOpenDialog func called-------------");

            this.getOwnerComponent().openHelloDialog();
        }
    });
});