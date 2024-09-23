sap.ui.define([
    "sap/ui/core/UIComponent",
    "sap/ui/model/json/JSONModel",
    "./controller/HelloDialog",
    "sap/ui/Device"
], function (UIComponent, JSONModel, HelloDialog, Device) {
    "use strict";
    return UIComponent.extend("sap.ui.demo.walkthrough.Component", {
        metadata: {
            manifest: "json"
        },
        init: function () {

            console.log("-------------Component.js init func called-------------");

            // Mandatory 
            // call the init function of the parent
            UIComponent.prototype.init.apply(this, arguments);
            // the init method of UIComponent (the parent class) is called first, ensuring the base class's initialization logic is executed before adding anything specific to CustomComponent
            // else this error will be shown
            // Mandatory init() not called for UIComponent: 'sap.ui.demo.walkthrough'. This is likely caused by a missing super call in the component's init implementation. - sap.ui.support 

            // set data models
            var oData = {
                recipient: {
                    name: "UI5"
                }
            };
            var oModel = new JSONModel(oData);
            this.setModel(oModel);

            // set device model
            var oDeviceModel = new JSONModel(Device);
            oDeviceModel.setDefaultBindingMode("OneWay");
            this.setModel(oDeviceModel, "device");

            // set dialog
            this._helloDialog = new HelloDialog(this.getRootControl());

            // create the views based on the url/hash
            this.getRouter().initialize();
        },

        getContentDensityClass : function () {
            
            console.log("-------------Component.js getContentDensityClass func called-------------");
            
            if (!this._sContentDensityClass) {
                if (!Device.support.touch) {
                    this._sContentDensityClass = "sapUiSizeCompact";
                } else {
                    this._sContentDensityClass = "sapUiSizeCozy";
                }
            }
            return this._sContentDensityClass;
        },

        exit: function () {
            console.log("-------------Component.js exit func called-------------");

            this._helloDialog.destroy();
            delete this._helloDialog;
        },
        openHelloDialog: function () {
            console.log("-------------Component.js openHelloDialog func called-------------");

            this._helloDialog.open();
        }
    });
});