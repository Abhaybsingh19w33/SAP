sap.ui.define([
    "sap/ui/core/UIComponent",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/resource/ResourceModel"
], function (UIComponent, JSONModel, ResourceModel) {
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
        }
    });
});