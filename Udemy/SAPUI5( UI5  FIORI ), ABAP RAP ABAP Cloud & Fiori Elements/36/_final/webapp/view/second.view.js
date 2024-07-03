sap.ui.jsview("satya.prasad.mvcapp.view.second", {
	getControllerName: function () {
		return "satya.prasad.mvcapp.controller.second";
	},
	createContent: function (oController) {
		var oObjectHeader = new sap.m.ObjectHeader({
			title: "{Name}",
			number: "{ID}",
			attributes: [
				new sap.m.ObjectAttribute({
					text: "{Address/Country}"
				})
			]
		});

		var oDetailPage = new sap.m.Page(
			{
				title: "Details",
				showNavButton: true,
				navButtonPress: [oController.onNavPress, oController],
				content: [oObjectHeader]
			});
		return oDetailPage;
	}
});