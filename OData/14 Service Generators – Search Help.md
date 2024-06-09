# Building OData Services [14] : Service Generators – Search Help

In this post, you will learn about the Service Generators i.e. Creating a Service using existing objects like Search Help, BAPI, or BOR Objects. To manage the length of the post, this is split into 2 parts.

- How to create OData Service using Search Help i.e. Import Search Help in SEGW
- How to create OData Service using BAPI / BOR object i.e. Import BAPIs in SEGW

## Create Project

In SEGW Transaction, use Create Project button to create a project.

![alt text](image-202.png)

Provide Project Name, Description, and Package.

![alt text](image-203.png)

Right-click on Data Model and choose Import to see the import options. Here, RFC/BOR Interface and Search Help options are available.

![alt text](image-204.png)

## Search Help

Search-help is imported to provide data for front-end F4 helps. This is pretty much stating the obvious. However, it is worth mentioning that we can only implement Read and Query operations using the Search Help Import.

Chose the Search Help option.

![alt text](image-205.png)

For demo, search help H_T002 is used which provides Language codes and descriptions. Provide Entity Type Name and Search Help to be imported. Keep the default options checked. Click Next.

![alt text](image-206.png)

Select the required fields i.e. SPRAS and SPTXT. Click Next.

![alt text](image-207.png)

Select SPRAS as the key field. click Finish.

![alt text](image-208.png)

Expand the Service Implementation Node. Here, the Read and Qeury Operations for the Set. Note that even though a different name is specified for the Entity Type, it gets created with the Search-Help name after removing all _ characters from the Search-Help name.

![alt text](image-209.png)

Double-click on the Mapping and observe the same.

Read

![alt text](image-210.png)

Qeury

![alt text](image-211.png)

Generate the Project and Register the Service.

![alt text](image-212.png)

Generation result.

![alt text](image-213.png)

Expand Node Service Maintenance, Double-click on GW_HUB/First node, and Click on Register. For Central Hub deployment use transaction /n/iwfnd/maint_service.

![alt text](image-214.png)

![alt text](image-215.png)

![alt text](image-216.png)

Click on SAP Gateway Client.

![alt text](image-217.png)

Test the service.

![alt text](image-218.png)

Now, test the operations.

Query
```
URI: /sap/opu/odata/SAP/ZJP_DEMO_GENERATORS_SRV/HT002Set?$format=json
```

![alt text](image-219.png)

Query options like filters are automatically handled. However, sort is not handled.
```
/sap/opu/odata/SAP/ZJP_DEMO_GENERATORS_SRV/HT002Set?$filter=Spras eq 'SR'&$format=json
```
![alt text](image-220.png)

Read
```
/sap/opu/odata/SAP/ZJP_DEMO_GENERATORS_SRV/HT002Set('EN')?$format=json
```

![alt text](image-221.png)

This way, without a code line, search-help import can be used to provide data for entities required only as reference data, options for drop-down-list, or F4/Search help pop-ups in frontend.