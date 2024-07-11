sap.ui.define(["sap/ui/core/mvc/Controller", "sap/ui/core/routing/History", "sap/m/MessageToast", "satya/prasad/mvcapp/utilities/utilities", "sap/ui/model/Filter",
	"sap/ui/model/FilterOperator"],
	function (Controller, History,
		MessageToast, utilities, Filter, FilterOperator) {
		"use strict";
		return Controller.extend("satya.prasad.mvcapp.controller.List", {
			variable: utilities,
			onSearch: function (oEvent) {
				var sQuery = oEvent.getParameter("query");
				var oTable = this.getView().byId("idTable");
				var oBinding = oTable.getBinding("items");
				var aFilter = [];

				aFilter.push(new Filter(
					[new Filter("ProductID", FilterOperator.Contains, sQuery), new Filter("Category", FilterOperator.Contains, sQuery)],
					false
				));

				oBinding.filter(aFilter);
			}
		});

	});