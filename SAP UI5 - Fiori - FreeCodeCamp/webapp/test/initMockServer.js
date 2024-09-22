sap.ui.define([
    "../localService/mockserver"
], function (mockserver) {
    "use strict";

    console.log("-------------initMockServer.js called-------------");

    // initialise the mock server
    mockserver.init();
    // initialise the embedded component o nthe HTML page
    sap.ui.require(["sap/ui/core/ComponentSupport"])
})