sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageToast",
    "sap/ui/core/Fragment"
], function (Controller, MessageToast, Fragement) {
    'use strict';
    return Controller.extend("sap.ui.demo.walkthrough.controller.HelloPanel", {
        onShowHello: function () {

            console.log("-------------HelloPanel.controller.js onShowHello func called-------------");
            // read msg from i18n model
            var oBundle = this.getView().getModel("i18n").getResourceBundle();
            var sRecipient = this.getView().getModel().getProperty("/recipient/name");
            var sMsg = oBundle.getText("helloMsg", [sRecipient]);
            // Show message
            MessageToast.show(sMsg);
        },
        onOpenDialog: function () {

            console.log("-------------HelloPanel.controller.js onOpenDialog func called-------------");

            this.getOwnerComponent().openHelloDialog();

            // var oView = this.getView();

            // // this code will run only once if this fragment has not been called even once
            // // create the dialog lazily
            // if (!this.byId("helloDialog")) {
            //     // load asynchronous XML fragment
            //     Fragement.load({
            //         id: oView.getId(),
            //         name: "sap.ui.demo.walkthrough.view.HelloDialog",
            //         controller: this
            //     }).then(function (oDialog) {
            //         // connect dialog to the root view of this component (models, lifecycle)
            //         oView.addDependent(oDialog);
            //         oDialog.open();
            //     })
            // } else {
            //     // once it is connected to the root view, no need to add again, directly call it
            //     this.byId("helloDialog").open();
            // }
        }
        // onCloseDialog: function () {
        //     console.log("-------------HelloPanel.controller.js onCloseDialog func called-------------");

        //     this.byId("helloDialog").close();
        // }
    })
});