# Building OData Services [4] : Register and Test OData Service

The project looks like below.

![alt text](/OData/Discovering%20ABAP/Images/image-61.png)

## Maintain/Register the Service – Central Hub Deployement
Use transaction code /IWFND/MAINT_SERVICE in Gateway system.

- For embedded Gateway then its the development system itself where you developed the SEGW project
- For a separate gateway system log into the Gateway system

Click on Add Service.

![alt text](/OData/Discovering%20ABAP/Images/image-62.png)

Enter system alias and service search string, then click Get Services. From the displayed list, select your service and click on Add Selected Services.

![alt text](/OData/Discovering%20ABAP/Images/image-63.png)

Service gets added. Use local package to save the service.

![alt text](/OData/Discovering%20ABAP/Images/image-64.png)

With this the service is created and can be seen as below. Use filter in case you see lot of other services. Here, it is important to have the System Alias.

![alt text](/OData/Discovering%20ABAP/Images/image-65.png)

## Maintain/Register the Service – Embeded Deployement

Expand the Service Maintanence node and double click on the node below.

![alt text](/OData/Discovering%20ABAP/Images/image-66.png)

Click on Register.

![alt text](/OData/Discovering%20ABAP/Images/image-67.png)

Select the system Alias.

![alt text](/OData/Discovering%20ABAP/Images/image-68.png)

Provide package, click okay. Select TR is asked and service will be registered.

![alt text](/OData/Discovering%20ABAP/Images/image-69.png)

## Testing the Service

To test a service right after its created, you can go to the SAP Gateway Client button. Alternatively you can use t-code /IWFND/GW_CLIENT to test the service.

![alt text](/OData/Discovering%20ABAP/Images/image-70.png)

Both the ways will open the SAP Gateway Client tool.

![alt text](/OData/Discovering%20ABAP/Images/image-71.png)

From here, simply execute the default service URL : /sap/opu/odata/sap/ZJP_DEMO_SRV/?$format=xml.

The response ~status_code 200 tells you that the service test is successful.

![alt text](/OData/Discovering%20ABAP/Images/image-72.png)

To test the EntitySets EntitySets button can be used. Add URI options can be used to select options like $metadata, $skip, $top etc.

![alt text](/OData/Discovering%20ABAP/Images/image-73.png)

Now, let us test the 3 methods that we implemented.

- Carrier – Get Entity
- FlightSchedule – Get Entity Set

URI details will be a separate article, but for now use /sap/opu/odata/sap/ZJP_DEMO_SRV/CarrierSet('DL') to get Entity for Carrier = 'DL'.

![alt text](/OData/Discovering%20ABAP/Images/image-74.png)

Similarly use below to get Associated Flight Schedules.

![alt text](/OData/Discovering%20ABAP/Images/image-76.png)

ToFlightSchedule is the Navigation Property we created.

![alt text](/OData/Discovering%20ABAP/Images/image-77.png)

Execute.

![alt text](/OData/Discovering%20ABAP/Images/image-78.png)

## How to debug OData Service?

For debugging, put an External BreakPoint in the code of the method that you want to debug. Usually, it will be method from class ending with DPC_EXT i.e. Data Provider Extension Class.

![alt text](/OData/Discovering%20ABAP/Images/image-79.png)

Now, trigger the service from Gateway Client tool, and the debugger will be triggered.

![alt text](/OData/Discovering%20ABAP/Images/image-80.png)

Usually, the debugging will be triggered a service call from SAPUI5 application. The process remains the same.