# Building OData Services [5] : Working With OData URIs

To work with OData it is very important to understand the URI options that can be used.

Summary of all URI Options
To demonstrate the options, Northwind service is used. This service was first introduced in OData Overview post where we looked at the metadata.

URL for the service : https://services.odata.org/V2/Northwind/Northwind.svc/

The below additions should be added after https://services.odata.org/V2/Northwind/Northwind.svc.

| Option | URI | Description |
| :-: | :--  | :-: |
| Metadata | /$metadata	| Shows metadata for the service
| Entity Set | /Customers /Order_Details | Get all records for the entity | 
| Entity Set Count | /Customers/$count /Order_Details/$count |Get count of records in a entity set |
| Single Entity	| /Customers('ALFKI')  /Order_Details(OrderID=10248,ProductID=11) | Get single entity record based on entity keys.For single key, it is not mandatory to mention the key name
| Association |/Customers('ALFKI')/Orders /Order_Details(OrderID=10248,ProductID=11)/Product |	Displays associated entity sets recordsNote , separated keys
| In-lining |	/Customers('ALFKI')?$expand=Orders | Shows data for principal entity and associated entity together
| Filter |	/Customers?$filter=City eq 'London' and Country eq 'UK'	| Used to filter the entity set records based on any property
| Search String | /Customers?search='109′ | Pass the search string which can be used to filter the data |
| Select |/Customers?$select=ContactName,City,Country | Select only specific fields |
| Filter and Select | /Customers?$filter=City eq 'London' &$select=ContactName,City,Country | To combine multiple options & can be used
| Top and Skip | /Customers?$top=2&$skip=5	| Top tells how many records to fetchSkip tells how many records to skip from the first recordTogether these help with displaying contents page by page
| Sorting |	/Customers?$orderby=Country,City /Customers?$orderby=Country desc,City asc | Sorts the result by properties in Ascending (asc) or descending (desc) order. default is ascending
| Function Import | /GetFlightNumbers?CarrierID='AA' | GetCarrierFlights is name of the function import and Carrid is the importing parameter. ***This is an example and does not work with Northwind service.
| $format=json | /Customers?$format=json |To get the data in json format

Now, let us look at each URL more closely.

## Metadata
### $metadata
Shows metadata for the service. From the metadata you can understand the structure of the service. Metadata is a large document with information on all the Entity Types, Entity Sets, Associations etc.

![alt text](/OData/Discovering%20ABAP/Images/image-81.png)

![alt text](/OData/Discovering%20ABAP/Images/image-82.png)

![alt text](/OData/Discovering%20ABAP/Images/image-83.png)

## Entity Set
Get all records for the entity.

## /Customers

![alt text](/OData/Discovering%20ABAP/Images/image-84.png)

Another URL that can be checked is – https://services.odata.org/V2/Northwind/Northwind.svc/Orders/

## Entity Set Count
### /Customers/$count

This gives number of records in entity set.

![alt text](/OData/Discovering%20ABAP/Images/image-85.png)

## Single Entity
### /Customers('ALFKI')

As this Entity Type has single field as a key, it is not needed to mention the key name.

![alt text](/OData/Discovering%20ABAP/Images/image-86.png)

### /Order_Details(OrderID=10248,ProductID=11)

Here, we need to mention the key names and values separated by comma (,) .

![alt text](/OData/Discovering%20ABAP/Images/image-87.png)

## Association
### /Customers('ALFKI')/Orders

This means get all Orders for Customer entity with key 'ALFKI'. This is one to many association.

![alt text](/OData/Discovering%20ABAP/Images/image-88.png)

### /Order_Details(OrderID=10248,ProductID=11)/Product

This is one to one association where Product details for a product from the selected Order_Detail entity are shown.

![alt text](/OData/Discovering%20ABAP/Images/image-89.png)

Similarly rest of the URLs can be tested.

## Function Import
### /GetFlightNumbers?CarrierID='AA'
This is not available in Northwind service. This is an example created to depict how the function import is called. Here, GetFlightNumbers is the name of the Function Import and 'AA' is passed to the parameter CarrierID.

![alt text](/OData/Discovering%20ABAP/Images/image-90.png)