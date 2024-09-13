sap.ui.define([
    "sap/ui/core/ComponentContainer"
], function (ComponentContainer) {
    // "use strict";

    console.log("-------------Index.js called-------------");

    new ComponentContainer({
        name: "sap.ui.demo.walkthrough",
        settings: {
            id: "walkthrough"
        },
        async: true
    }).placeAt("content")
    
    console.log("-------------Index.js ComponentController called-------------");
});