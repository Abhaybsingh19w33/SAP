sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent"
], function (Controller, UIComponent) {
    "use strict"
    return Controller.extend("sap.ui.demo.walkthrough.controller.Detail", {
        onInit: function () {

            console.log("-------------Detail.controller.js onInit func called-------------");

            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.getRoute("detail").attachPatternMatched(this._onObjectMatched, this);
        },
        _onObjectMatched: function (oEvent) {

            console.log("-------------Detail.controller.js _onObjectMatched func called-------------");

            this.getView().bindElement({
                path: "/" + window.decodeURIComponent(oEvent.getParameter("arguments").invoicePath),
                model: "invoice"
            })
        }
    })
})