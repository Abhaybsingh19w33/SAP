sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zynyrapbook/test/integration/FirstJourney',
		'zynyrapbook/test/integration/pages/ZC_YNY_RAP_BOOK_T2List',
		'zynyrapbook/test/integration/pages/ZC_YNY_RAP_BOOK_T2ObjectPage'
    ],
    function(JourneyRunner, opaJourney, ZC_YNY_RAP_BOOK_T2List, ZC_YNY_RAP_BOOK_T2ObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zynyrapbook') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZC_YNY_RAP_BOOK_T2List: ZC_YNY_RAP_BOOK_T2List,
					onTheZC_YNY_RAP_BOOK_T2ObjectPage: ZC_YNY_RAP_BOOK_T2ObjectPage
                }
            },
            opaJourney.run
        );
    }
);