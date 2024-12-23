# Building OData Services [9] : Testing CRUD-Q operations from Gateway Client

![alt text](/OData/Discovering%20ABAP/Images/image-107.png)

## 1. Open SAP Gateway client

### Option 1

Expand the Service Maintenance node and double-click on the item GW_HUB to see the Service Registration Details. Here, ensure that the highlighted row is selected. Then click on the SAP Gateway client.

![alt text](/OData/Discovering%20ABAP/Images/image-108.png)

Click Yes on the popup.

![alt text](/OData/Discovering%20ABAP/Images/image-109.png)

The SAP Gateway client will open with the service URI.

![alt text](/OData/Discovering%20ABAP/Images/image-110.png)

### Option 2

Start transaction /n/IWFND/MAINT_SERVICE. Click on Filter.

![alt text](/OData/Discovering%20ABAP/Images/image-111.png)

Enter the Technical Service Name or part of the name with * and hit Enter.

![alt text](/OData/Discovering%20ABAP/Images/image-112.png)

Click on the required service, then click on SAP Gateway Client.

![alt text](/OData/Discovering%20ABAP/Images/image-114.png)

The SAP Gateway client will open with the service URI.

![alt text](/OData/Discovering%20ABAP/Images/image-113.png)

### Option 3

Start transaction /n/IWFND/GW_CLIENT. The Gateway client will open with URI that was used in the earlier session.

![alt text](/OData/Discovering%20ABAP/Images/image-115.png)

Here, update the URI with /sap/opu/odata/sap/<service_name>/?$format=xml and you reach the same point as in options 1 and 2.

![alt text](/OData/Discovering%20ABAP/Images/image-116.png)

### URI Option
Once this screen is reached, explore the buttons Entity Sets and Add URI Option.

![alt text](/OData/Discovering%20ABAP/Images/image-117.png)

#### 1. QUERY

Add Entity Set for Carrier in the URI using the button Entity Sets. Add format JSON using the Add URI Option button. Keep the HTTP method as GET and press Execute.

Request

![alt text](/OData/Discovering%20ABAP/Images/image-118.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-119.png)

#### 2. READ

Observe the Result from the Query operation. Each result set has the URI associated. Use this URI to get individual records i.e. READ operation.

![alt text](/OData/Discovering%20ABAP/Images/image-120.png)

Request

![alt text](/OData/Discovering%20ABAP/Images/image-121.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-122.png)

#### 3. ASSOCIATION

Observer the URI from READ or QUERY where the Association name is mentioned with _deferred status.

![alt text](/OData/Discovering%20ABAP/Images/image-123.png)

Use this URI, and add $format=json at the end.

Request

![alt text](/OData/Discovering%20ABAP/Images/image-124.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-125.png)

In case you get any errors, add a unit for Distance Field and remove the field FLTIME as it gives conversion issues. Regenerate and try again.

![alt text](/OData/Discovering%20ABAP/Images/image-126.png)

The below options can also be tried in case you get cache-related issues after changes.

![alt text](/OData/Discovering%20ABAP/Images/image-127.png)

The CREATE, UPDATE and DELETE operations are implemented for CarrierSet only.

![alt text](/OData/Discovering%20ABAP/Images/image-128.png)

#### 4. CREATE

First, perform a READ operation on the same entity set i.e. CarrierSet

Once the result is displayed, click on the Use as Request button to copy the response into the request payload.

![alt text](/OData/Discovering%20ABAP/Images/image-129.png)

The request part would appear as below.

![alt text](/OData/Discovering%20ABAP/Images/image-130.png)

Keep only the required JSON payload for the entity.

![alt text](/OData/Discovering%20ABAP/Images/image-131.png)

Now, make the below changes and Execute

- Change HTTP Method to POST
- Change Request URI to have only the entity set name
- Change the field values in the payload

Request

![alt text](/OData/Discovering%20ABAP/Images/image-132.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-133.png)

SCARR table entry is created.

![alt text](/OData/Discovering%20ABAP/Images/image-134.png)

#### 5. UPDATE

Notice that the CREATE payload did not have the URL field. So let us add a URL field in the service.

![alt text](/OData/Discovering%20ABAP/Images/image-135.png)

Use READ request to get details for Carrier 'AI'. Copy the request using the button 'Use as Request'.

![alt text](/OData/Discovering%20ABAP/Images/image-136.png)

Now, make the below changes and Execute

- Change HTTP Method to PUT
- Change Request URI to remove format option as the UPDATE operation does not return any result
- Change the field values in the payload to add the URL field value

Request

![alt text](/OData/Discovering%20ABAP/Images/image-137.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-138.png)

Updated entry from SCARR

![alt text](/OData/Discovering%20ABAP/Images/image-139.png)

#### 6. DELETE

Delete does not need a payload. Use URI similar to READ and HTTP method DELETE.

Request

![alt text](/OData/Discovering%20ABAP/Images/image-140.png)

Response

![alt text](/OData/Discovering%20ABAP/Images/image-155.png)

SCARR table entry is deleted.

![alt text](/OData/Discovering%20ABAP/Images/image-142.png)

This covers the basic CRUD-Q operations testing. More scenarios like Deep Inserts and multi-level associations will be covered in upcoming posts along with the testing.