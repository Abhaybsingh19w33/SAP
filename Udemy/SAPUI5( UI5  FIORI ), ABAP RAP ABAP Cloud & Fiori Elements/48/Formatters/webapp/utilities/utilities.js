sap.ui.define([],function(){
	"use strict";
	return {
		formatterFunction:function(WeightMeasure,WeightUnit){
			if(WeightMeasure>5){
				return "Success";
			}else{
				return "Error";
			}
		}
	};
});