# Sales order cycle
## What is a sales order cycle?

Every business will have a cycle.

For example, the finance business or the finance department is responsible for looking at what the customer needs to pay (A/R) or receiving payments. So they call it report to record.

Procurement department, which is responsible for interacting with the vendors, getting the goods on time and so on, is responsible for placing the purchase order with the vendor.

Example If Walmart's procurement department were to be taken as an example, they are responsible for dealing with the vendors that supply the goods.

Like if milk needs to be put in the freezer of Walmart. The procurement department will talk to all the different milk vendors. They'll raise purchase orders.

They'll get the goods into the stock, and they'll pay the invoices, meaning pay the money to their vendors. This cycle is called procure to pay.

Procure to pay or P2P. So similarly, there are different business cycles followed by the different departments.

The sales department also follows a cycle. It's called the sales order cycle.

## What is the sales order cycle comprising of? (B2B scenario)

The sales order cycle is best understood with an example. We'll take two companies.

One company say a computer manufacturing company, say HP or Dell or whatever. And this is the company which is selling. So, we are looking at things from a HP's perspective.

Who is buying? 

=> Anybody could be buying from you or could be buying from Dell or HP.

Let's take the scenario of HP selling computers to a customer, say Walmart. So, Walmart is our customer. And the companies selling computers to Walmart.

So, Walmart is looking for computers. So, Walmart is inquiring about the different rates of HP, Dell and all the different computer manufacturers.
Now, since we are looking at it from HP's perspective, Walmart is going to send what is called as an RFI or request for information or inquiry RFI.
 
![alt text](image.png)

### What is an RFI?
=> An RFI is, quite simply, a request for a whole bunch of products. And what are the prices and when we can deliver them by.

So now, from HP's perspective, as soon as they receive this request from Walmart, they're going to say, okay, who is the customer? - Customer is Walmart.

What is the date that we have received this? - Jan, first, 2014 and some other details and then we'll start with the products.
What is it that Walmart is looking for? - They'll specify that in the request. They'll say, I want a particular model of desktop model one.

And how many quantity? - Say 1000.

They want it for a bunch of stores and maybe some laptops, a particular model, maybe 2000 of them and so on.

So, this information is captured in a document from HP's perspective. And this document is just a fancy word. You don't need to use that or think in terms of a document. It's just a collection of some data. So, SAP typically calls it a document.

So, this document is called an inquiry, which is a document created in SAP by HP based on the customer's RFI.
So, customer has asked for desktops, laptops, a certain quantity, and their prices. And HP has created a record in the system and says, okay, you have asked for this, this and this, and the prices are going to be dollar 500 per piece or dollar 800 per piece or whatever HP decides the rate to be.

And as soon as this inquiry is saved in the system, you get an inquiry number in the system that generates its, let's say, 110120, just a number, a sequential number.

HP has created this unique reference called an inquiry document, and this will be sent over to Walmart as a response to their inquiry saying, you know what?

Thank you, Walmart for inquiring with us. We have created an inquiry. Your reference number is 110120. And here are the products that you have inquired for. And these are the prices. And we can provide these quantities by so and so dates.

Finance is responsible for
-	Customers need to pay – A/R
-	Receiving payments
These are called report to record.

Procurement department is responsible for (interacting with Vendors, get goods on time)
-	Placing PO for Vendors
-	Get the goods
-	Pay the invoices
This cycle is called procure to pay (P2P)

Sales department (Sales order cycle)
Example (B2B Scenario)
HP / Dell – Selling computers to Walmart
1)	Walmart – inquire for the computers (RFI – Request for Information or Inquiry)
2)	Seller – for Customer on Date, product, quantity, price
3)	A document will be created and sent to Walmart

![alt text](image-1.png)

## Quotation
Now Walmart will apply for quotation
Quotation is a formal documents, with terms and conditions, price, quantities, deliverables, adhered to legally.

Validity Dates – the period for which quotations can be applied. 

Difference between inquiry(informal) and quotation(formal)
![alt text](image-12.png)

Create inquiry in system
Tcode – VA11

![alt text](image-2.png)
![alt text](image-3.png)
![alt text](image-4.png)
![alt text](image-5.png)
![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)
![alt text](image-10.png)
![alt text](image-11.png)

Save

## Quotation
![alt text](image-13.png)
 
From initial point of view, inquiry is the current doc, and quotation becomes the subsequent doc
From quotation point of view, inquiry becomes the previous doc, and quotation becomes the current doc.

We can create quotation by 2 ways
1)	Creation with reference from inquiry doc (rather than creating another copy of item details, we can use this data from quotation)
2)	Create standalone doc 

TCode – VA21 – To create the quotation

![alt text](image-14.png)
![alt text](image-15.png)
![alt text](image-16.png)
![alt text](image-17.png)
![alt text](image-18.png)
![alt text](image-19.png)
 
With the item selection – we can select the only item from inquiry to create quotation
 
![alt text](image-20.png)
![alt text](image-21.png)
![alt text](image-22.png)
![alt text](image-23.png)
 
Here we have not filled the valid from and valid to date, we can save and later enter that data also
 
![alt text](image-24.png)

Save

## Sales Order

![alt text](image-25.png)
![alt text](image-26.png)
![alt text](image-27.png)
 
Tcode – VA01 – To create Sales Order

![alt text](image-28.png)
![alt text](image-29.png)
![alt text](image-30.png)
![alt text](image-31.png)
![alt text](image-32.png)
 
Here delivery date is on 31 jan, but we are proposal delivery date is 13 feb
Click ok

![alt text](image-33.png)
 
Enter the po number(anything)

![alt text](image-34.png)
![alt text](image-35.png)

If we want to check how was the doc created
 
![alt text](image-36.png)
![alt text](image-37.png)
![alt text](image-38.png)
![alt text](image-39.png)

## Delivery

![alt text](image-40.png)

This document is created after SO, there can be multiple delivery documents for one SO.
For example feb delivery is created, then another could be created for march also.

![alt text](image-41.png)

The picking process involves taking goods from a storage location an staging the right quantity in a picking area where the goods will be prepared for shipping

![alt text](image-42.png)
 
Packing – if it is need for products to be packed
PGI – POST GOODS ISSUE – After the Goods have left the inventory, the account have to be maintained.

![alt text](image-43.png)
 
Open SO in change mode, then from menu select deliver button for delivery

![alt text](image-44.png)
![alt text](image-45.png)

Here delivery is trying to be create for feb month

![alt text](image-46.png) 
![alt text](image-47.png)

Here system is confirming the quantity to be delivered in 13 feb when it is actually available

![alt text](image-48.png)
 
Again go back and press deliver button in menu
 
![alt text](image-49.png)
![alt text](image-50.png)
 
Here we are future dating this, we are providing it future date to process the delivery

![alt text](image-51.png)

Here it is asking for picked quantity, if somehow there are not enough goods avl, we can give that picked quantity of the goods here

Save

![alt text](image-52.png)
 
To do PGI click on that button
 
![alt text](image-53.png)

Now delivery is completed

![alt text](image-54.png)
![alt text](image-55.png)
![alt text](image-56.png)
![alt text](image-57.png)
![alt text](image-58.png)
![alt text](image-59.png)
![alt text](image-60.png)
 
## Billing – Invoices

![alt text](image-61.png)
![alt text](image-62.png)
![alt text](image-63.png)
![alt text](image-64.png)
![alt text](image-65.png)
![alt text](image-66.png)
![alt text](image-67.png)
![alt text](image-68.png)
![alt text](image-69.png)
![alt text](image-70.png)

## Master Data
 
![alt text](image-71.png)
![alt text](image-72.png)
![alt text](image-73.png)
![alt text](image-74.png)
![alt text](image-75.png)
![alt text](image-76.png)

## Customer master
 
![alt text](image-77.png)
![alt text](image-78.png)
![alt text](image-79.png)
![alt text](image-80.png)
![alt text](image-81.png)
![alt text](image-82.png)

Tcode – VD01

![alt text](image-83.png)
![alt text](image-84.png)
![alt text](image-85.png)
![alt text](image-86.png)
![alt text](image-87.png)
![alt text](image-88.png)
![alt text](image-89.png)
![alt text](image-90.png)

CLICK ON THE SALES AREA DATA
 
![alt text](image-91.png)
![alt text](image-92.png)
![alt text](image-93.png)
![alt text](image-94.png)

Delivery priority as name suggest

![alt text](image-95.png)
 
Order combination – If the date and place of delivery is same it can combine both line items of different order in single delivery
Complete delivery -  no partial delivery will be accepted
 
![alt text](image-96.png)

Tolerance – if customer is okay with delivery of little less or more quantity than the ordered quantity. The customer will be billed for delivery quantity. And if there is remaining quantity another order needs to be placed.
 
![alt text](image-97.png)

InvoicingDates – this will invoice the customer over a period link weekly, monthly, etc

InvoicingLIstDates – this will combine all the invoices of a period link weekly or monthly  into one document
 
![alt text](image-98.png)

Tax classification – how to tax the customer – need to ask FICO consultant for this info

Save the sales view

![alt text](image-99.png)
 
Tcode -FD01
 
![alt text](image-100.png)
![alt text](image-101.png)
![alt text](image-102.png)
![alt text](image-103.png)

Now extending the view

VD02

![alt text](image-104.png)
 
Here customer data is extended for Germany company code – 1000
To extend it for USA – 3000

![alt text](image-105.png)

Here address is already present in master data so it does not need to fill it again
We just have to enter the shipping and billing data here according to USA

![alt text](image-106.png)
![alt text](image-107.png)
![alt text](image-108.png)
 
Now creating new customer with reference
 
![alt text](image-109.png)
![alt text](image-110.png)
![alt text](image-111.png)

Tcode -VD02

![alt text](image-112.png)

MADE CHANGES HERE
 
![alt text](image-113.png)
![alt text](image-114.png)
![alt text](image-115.png)

Double click on it

![alt text](image-116.png)
![alt text](image-117.png)
 
Go to general data for this.
We can customize this using CMOD 

![alt text](image-118.png)

## Material Master

MM01

![alt text](image-119.png) 
![alt text](image-120.png)
![alt text](image-121.png)
![alt text](image-122.png)
![alt text](image-123.png)
![alt text](image-124.png)
![alt text](image-125.png)
![alt text](image-126.png)

Older material number – refers to the same material but from older system
 
![alt text](image-127.png)
![alt text](image-128.png)
![alt text](image-129.png)
![alt text](image-130.png)
 
Here we can categories the same materials on different basis size, processor, type etc.
 
![alt text](image-131.png)
![alt text](image-132.png)

Hierarchy could be made like 5 – 5 – 8 structure, this is 3 level or it can be made by dividing differently 5- 3 - 3 - 3 – 4 it 5 levels
 
![alt text](image-133.png)
![alt text](image-134.png)
![alt text](image-135.png)
![alt text](image-136.png)

Sales Order Deep Dive
  
  
   
 
 
 
 
 
 
 
 
CO OP -BUYER – HELP TO GET THE BETTER DEAL
 
 
 
 
  
 
  
 
Tcode- vl02n
 
 
 
 
VF01
    
 
 
 
 
 
    
 
               
Enterprise Structure
   
Company code + Sales Org
Sales Area = ( S Org + D chnl + Div)
Sales Area <- Sales Office <- Sales Group <- People

Company can have multiple plant, but plants can not have multiple company code.
Plant can have multiple storage location for purposes like returns, defects, etc.
Storage location can have multiple ware house.
Plant <- Storage Location <- Warehouse
Plant needs to be mapped with Company code.
Plant  + ( Sales Org + D chnl )
Configuration
 
 
Create sales organization
 
      
 
       
Save

Create distribution channel
 
    
Create division
 
 
   
Create sales office
 
  
Sales group
  
Create plant
   
 
 
Create storage location
  
 
 
 
Warehouse
 
 
  
 
Shipping point
 
  
 
Assign company code to sales org  
Assign dist chnl to sales org
 
  
Assign divisions to sales org
 
  
Sales area
 
  
 
Assign sales office to sales area  
 
 
Assign sales group to sales office
 
  
Assign sales org, dist chnl, plant
 
 
 
Assign warehouse to plant/storage location
 
 
 
Assign Shipping point to plant
  
 
 
Common Distribution Channels and Divisions
Issue here is we have to create the customer for every sales area combination – this will be redundant data or unnecessary to create multiple times.
 
Here we will create a single record and for other combinations we will say them to take data from 10 as reference.
 
 
As long as you have referenced the dist chnl to another dist chnl, you can not create the master data for it or the refereced divisions.

Same with condition records
   
Enterprise Structure
Why we need this?
	Reporting
o	Internal
o	External (Comp Code) 
	Operational
o	Sales Org
o	Purchase Org
o	Plant
 
Business Processes
 
           
   
Document Type
    
Business Processes types
	Sales
	Delivery
	Billing
They can be further categorized
	Sales
o	Inquiry
o	Quotation
o	Order
o	Consignment
o	Contract
	Delivery
o	Reg Deliveries
o	Expedited Delivery
o	Returns
	Billing
o	Std Invoice
o	Credit
o	Debit
o	Corrections
 

 
 
 
 
 
Copy to create your own doc type
 
   
Reference mandatory – will force user to input the quotation number
 
Check division – will check if the material is from same division as sales order.
 
Check po no – this will check of the duplicate PO exists
 
Quotation Messages – 
 
 
Shipping
 
Del relevant billing type – this will create billing if only the delivery doc is generated, and delivery is completed
Order relevant billing type - this will create billing if only the order doc is generated
 
Inter company billing type - this will allow us to deliver the order from different company code, not from the company code they ordered. This might be the case when user needs to get the delivery fast, so it happens to be faster from different company code. 
 
Billing block 
Rush Order – RO - where delivery doc created instantly after creating the order doc
Item Category
BOM
   
Tcode – CS01 – To create BOM
     
Item category controls
   
 
Billing relevance
At header level or part level
At header level – this PC costs 650, includes the following components
At part level – this pc cost $, monitor $, CPU $, etc
 
Here mouse pad (MP) can be free of charge, so no billing required for that
Pricing Relevance
Same at header level or component level
At header level- we will show the total price
At component level – show price individually
 
Here it is component level
Here mouse pad (MP) can be free of charge, so no pricing required for that
Delivery Relevance & Schedule Line Relevance
It is divided in Order and Quotation
 
PC - Del is relevant in Order, but not for quotation
PC – Sche line is relevant in Orde and also in quotation
 
Here Ext – extended warranty – is not a tangible product, it cannot be delivered, so schedule line cannot for order is not created

You cannot do a delivery unless, you have schedule lines.
If you have schedule line that does not mean you have to do delivery.
Item Category control
 
 
Schedule Line Category
 
Drop Shipment – here the stock does not come to inventory, it directly gets delivered to customer location. 
There is no delivery doc created for this. After Order doc directly Invoice doc is ceated.
TAS – item category
This will trigger the schedule line category CS, which has not movement type, so it’s has no PGI.
 
Availability and transfer of Requirements
 
No Avl check on service products.
Avl check can be turned on or turned off in schedule line category level.
 
MRP- Material Requirement Planning
 
BOM gets flatten out in this delivery doc.
Delivery group – groups the BOM in a group so that all the components in BOM go together
 

 
 
 
 
Billing 
 
Profarma Invoice- When goods cross a border this invoice is needed, without tax, not posted to accounts, the price of free goods needs to be mentioned
 
Regular invoice – also tax invoice, commercial invoice, posted to accounts, here the cost of free goods need not to be mentioned
 
Credit – over charge a customer
Debit – under charge a customer
Return 
 
 
To reverse it logically, cancel the invoice, or give debit, credit invoice
 
 
A customer can have multiple invoices, to simplify these.

