sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'zynyrapbook',
            componentId: 'ZC_YNY_RAP_BOOK_T2List',
            contextPath: '/ZC_YNY_RAP_BOOK_T2'
        },
        CustomPageDefinitions
    );
});