sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'zynyrapbook',
            componentId: 'ZC_YNY_RAP_BOOK_T2ObjectPage',
            contextPath: '/ZC_YNY_RAP_BOOK_T2'
        },
        CustomPageDefinitions
    );
});