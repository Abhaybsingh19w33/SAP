# Sales order cycle
## What is a sales order cycle?

Every business will have a cycle.

For example, the finance business or the finance department is responsible for looking at what the customer needs to pay (A/R) or receiving payments. So they call it report to record.

Procurement department, which is responsible for interacting with the vendors, getting the goods on time and so on, is responsible for placing the purchase order with the vendor.

Example If Walmart's procurement department were to be taken as an example, they are responsible for dealing with the vendors that supply the goods.

Like if milk needs to be put in the freezer of Walmart. The procurement department will talk to all the different milk vendors. They'll raise purchase orders.

They'll get the goods into the stock, and they'll pay the invoices, meaning pay the money to their vendors. This cycle is called procure to pay.

![alt text](image-153.png)

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

