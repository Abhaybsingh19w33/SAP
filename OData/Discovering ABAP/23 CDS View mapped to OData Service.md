# Building OData Services [23] : CDS View mapped to OData Service

CDS Views or CDS Entities can be exposed as OData Services in following ways

1. The Reference Data Source option in SEGW.
2. Annotation OData.Publish
3. RAP Model

In this post, you will learn to map a CDS View to an OData service using The Reference Data Source option in SEGW.

You will need to create a CDS view for this tutorial. Follow below tutorials

1. [Install Eclipse for ABAP Development](https://discoveringabap.com/2021/09/16/install-eclipse-for-abap-development/)

2. [Working With Eclipse [1] : Open ABAP Perspective & Create A Project](https://discoveringabap.com/2021/10/01/working-with-eclipse-1-open-abap-perspective-create-a-project/)

3. [Introduction to CDS Views](https://discoveringabap.com/2021/10/05/exploring-abap-on-hana-1-introduction-to-cds-views/)

## Create a CDS View

![alt text](/OData/Discovering%20ABAP/Images/image-355.png)

### Create New Project and Map CDS
1. Create a project in SEGW.

![alt text](/OData/Discovering%20ABAP/Images/image-356.png)

2. Right-click on Data Model and choose Reference > Data Source

![alt text](/OData/Discovering%20ABAP/Images/image-357.png)

3. Provide CDS View /CDS Entity Name, Click Next

![alt text](/OData/Discovering%20ABAP/Images/image-358.png)

4. CDS Entity Exposed is listed, click Finish

![alt text](/OData/Discovering%20ABAP/Images/image-359.png)

5. Data Source Reference node will show the mapped CDS

![alt text](/OData/Discovering%20ABAP/Images/image-360.png)

<b>
Note that there can be only one reference per project.
</b>

![alt text](/OData/Discovering%20ABAP/Images/image-361.png)

6. Generate the project

![alt text](/OData/Discovering%20ABAP/Images/image-362.png)
![alt text](/OData/Discovering%20ABAP/Images/image-363.png)
![alt text](/OData/Discovering%20ABAP/Images/image-364.png)

7. Register the service

![alt text](/OData/Discovering%20ABAP/Images/image-365.png)
![alt text](/OData/Discovering%20ABAP/Images/image-366.png)
![alt text](/OData/Discovering%20ABAP/Images/image-367.png)

### Testing the Service
Start Gateway client.

![alt text](/OData/Discovering%20ABAP/Images/image-368.png)

```
HTTP Method : GET
URI : /sap/opu/odata/SAP/ZJP_CDS_SIMPLE_SRV/ZJP_SO_DATA?$format=json
```

![alt text](/OData/Discovering%20ABAP/Images/image-369.png)

```
HTTP Method : GET
URI : /sap/opu/odata/SAP/ZJP_CDS_SIMPLE_SRV/ZJP_SO_DATA('109')?$format=json
```

![alt text](/OData/Discovering%20ABAP/Images/image-370.png)

The Services Based on CDS View / Entities will only have read capability as CDS by itself does not have a CREATE/UPDATE/DELETE functionality.

If we try to force a create operation, it fails with the below error –

![alt text](/OData/Discovering%20ABAP/Images/image-371.png)