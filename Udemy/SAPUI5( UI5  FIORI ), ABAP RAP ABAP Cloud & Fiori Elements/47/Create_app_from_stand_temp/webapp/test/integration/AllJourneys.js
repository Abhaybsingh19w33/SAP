/*global QUnit*/

jQuery.sap.require("sap.ui.qunit.qunit-css");
jQuery.sap.require("sap.ui.thirdparty.qunit");
jQuery.sap.require("sap.ui.qunit.qunit-junit");
QUnit.config.autostart = false;

// We cannot provide stable mock data out of the template.
// If you introduce mock data, by adding .json files in your webapp/localService/mockdata folder you have to provide the following minimum data:
// * At least 3 ProductSet in the list
// * All 3 ProductSet have at least one ToSalesOrderLineItems

sap.ui.require([
	"sap/ui/test/Opa5",
	"bb/b/test/integration/pages/Common",
	"sap/ui/test/opaQunit",
	"bb/b/test/integration/pages/App",
	"bb/b/test/integration/pages/Browser",
	"bb/b/test/integration/pages/Master",
	"bb/b/test/integration/pages/Detail",
	"bb/b/test/integration/pages/NotFound"
], function (Opa5, Common) {
	"use strict";
	Opa5.extendConfig({
		arrangements: new Common(),
		viewNamespace: "bb.b.view."
	});

	sap.ui.require([
		"bb/b/test/integration/MasterJourney",
		"bb/b/test/integration/NavigationJourney",
		"bb/b/test/integration/NotFoundJourney",
		"bb/b/test/integration/BusyJourney"
	], function () {
		QUnit.start();
	});
});