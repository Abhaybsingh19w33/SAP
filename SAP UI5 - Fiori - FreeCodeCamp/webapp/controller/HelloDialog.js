sap.ui.define([
    "sap/ui/base/ManagedObject",
    "sap/ui/core/Fragment"
], function (ManagedObject, Fragment) {
    "use strict"
    return ManagedObject.extend("sap.ui.walkthrough.controller.HelloDialog", {
        constructor: function (oView) {
            console.log("-------------HelloDialog.js constructor func called-------------");
            this._oView = oView
        },
        exit: function () {
            console.log("-------------HelloDialog.js exit func called-------------");
            delete this._oView;
        },
        open: function () {
            console.log("-------------HelloDialog.js open func called-------------");
            var oView = this._oView;
            // this code will run only once if this fragment has not been called even once
            // create the dialog lazily
            if (!oView.byId("helloDialog")) {
                var oFragmentController = {
                    onCloseDialog: function () {
                        console.log("-------------HelloDialog.js open onCloseDialog func called-------------");
                        oView.byId("helloDialog").close();
                    }
                }
                // load asynchronous XML fragment
                Fragment.load({
                    id: oView.getId(),
                    name: "sap.ui.demo.walkthrough.view.HelloDialog",
                    controller: oFragmentController
                }).then(function (oDialog) {
                    // connect dialog to the root view of the component (models, lifecycle)
                    oView.addDependent(oDialog);
                    oDialog.open();
                })
            } else {
                // once it is connected to the root view, no need to add again, directly call it
                oView.byId("helloDialog").open();
            }
        }
    });
});