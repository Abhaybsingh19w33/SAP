sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict"
    return Controller.extend("sap.ui.demo.walkthrough.App", {
        onOpenDialog: function () {
            console.log("-------------App.controller.js onOpenDialog func called-------------");

            this.getOwnerComponent().openHelloDialog();
        }
    });
});