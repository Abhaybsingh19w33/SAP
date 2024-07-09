/*global QUnit*/

jQuery.sap.require("sap.ui.qunit.qunit-css");
jQuery.sap.require("sap.ui.thirdparty.qunit");
jQuery.sap.require("sap.ui.qunit.qunit-junit");
QUnit.config.autostart = false;

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
		"bb/b/test/integration/NavigationJourneyPhone",
		"bb/b/test/integration/NotFoundJourneyPhone",
		"bb/b/test/integration/BusyJourneyPhone"
	], function () {
		QUnit.start();
	});
});