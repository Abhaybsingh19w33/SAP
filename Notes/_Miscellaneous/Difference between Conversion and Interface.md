DIFFERENCE BETWEEN CONVERSION AND INTERFACE:

A Conversion means data that is converted from one format to another format and from one system to another.

So when you first implement SAP, you are actually replacing some of your legacy systems, but you are not completely trashing the data. You still need some of that data from the systems that are being replaced. So you pull the data out of your legacy systems and put them on some files. You then want to load that data into your new SAP system.

That is when you write some programs which will read that data and load it into SAP. Imagine you had a home grown purchasing system. You are now replacing all that with SAP. But until SAP goes live, you want to keep using your home grown purchasing system.

So during go live, you want to transfer the POs from your legacy system to SAP. Now a PO in your legacy system may not have the same fields as a PO in SAP. So you convert the data.

Ex: BDC,LSMW

Interfacing is connecting two or more different entities. In our case, it is connecting one or more systems with SAP. Now extending our previous example, you are replacing some legacy applications but there are some applications that you don't want to replace yet.

You need to somehow pass data back and forth between SAP and these remaining systems. Data may be going one way or the other way or both ways. You will still need to do some data transformations/translations etc to make the data understandable to the receiving system.

This will continue as long as you want to keep the systems running alongside SAP.

Ex: idoc,bapi

In short, conversions are written to load data into SAP onetime. These are typically file based.

Interfaces are written to exchange/update/send/receive data between SAP and other systems on an ongoing basis. These can be in many forms, file based, idoc based, real time(business connector, XI etc are useful in this), xml, and the list goes on.


--------------------------------------------------------------------------------------------

Interface: it is a program that performs communication with External system from SAP.

There are two types of interfaces:

1. Inbound Interface: External system sends the data to SAP

2. Outbound Interface: SAP sends the data to External system.

Let's take a scenario:

There are two Systems SAP ERP and Seibel CRM

Scenario1: Whenever an Order is created in Seibel CRM system it has to be transferred to SAP where the Order confirmation, Delivery and Billing will be performed. This can be enabled by using IDOC as inbound interface.

Scenario2: Whenever a New customer is Created in SAP ERP this customer data has to be transferred to Seibel CRM using Outbound IDOC / RFC.

Basically interfaces are implemented using RFC, BAPI, ALE/IDOC.

INTERFACE programs are the ones which are run at regular intervals, say weekly, monthly or even daily. Here the legacy system continues to co-exist along with SAP system, the legacy system might be useful for certain functionalities but the data might have to run thru SAP transactions for complex data maintenance at regular intervals.

Interface Program

http://help.sap.com/saphelp_erp2005/helpdata/en/64/be5b4150b38147e10000000a1550b0/frameset.htm

Conversion:

Migration of data from Legacy system before GO Live (One time data transfer).

So Conversions are always INBOUND interfaces.

Conversions are performed using Batch input(BDC), LSMW and BAPI.

CONVERSION programs are the ones which have one time usage, usually when a legacy system is being replaced by a system like SAP, then the data has to be mapped from the legacy system to SAP system. Here the data to be converted is given on a flat file & is uploaded to SAP tables mostly using LSMW only. Conversions programs are BDC,BAPI and LSMW programs in which you upload all the related tables from the flat files.Those are one time programs.

Interface programs are those programs in which you fetch the data from the application server and process on theose data.These are helpful when you have to run any program in the backgroup when the presentation server is not working.

Conversion Program

http://help.sap.com/saphelp_erp2005/helpdata/en/d3/a65a14e96911d1b401006094b944c8/frameset.htm

In Simple

CONVERSIONS : Converting Legacy System DATA into a flat file

INTERFACES : Converting Flat File into SAP

--------------------------------------------------------------------------------------------

A Conversion means data that is converted from one format to another format and from one system to another.

So when you first implement SAP, you are actually replacing some of your legacy systems, but you are not completely trashing the data. You still need some of that data from the systems that are being replaced. So you pull the data out of your legacy systems and put them on some files. You then want to load that data into your new SAP system.

That is when you write some programs which will read that data and load it into SAP. Imagine you had a home grown purchasing system. You are now replacing all that with SAP. But until SAP goes live, you want to keep using your home grown purchasing system.

So during go live, you want to transfer the POs from your legacy system to SAP. Now a PO in your legacy system may not have the same fields as a PO in SAP. So you convert the data.

Ex: BDC,LSMW

Interfacing is connecting two or more different entities. In our case, it is connecting one or more systems with SAP. Now extending our previous example, you are replacing some legacy applications but there are some applications that you don't want to replace yet.


You need to somehow pass data back and forth between SAP

and these remaining systems. Data may be going one way or the other way or both ways. You will still need to do some data transformations/translations etc to make the data understandable to the receiving system.

This will continue as long as you want to keep the systems running alongside SAP.

Ex: idoc,bapi

In short, conversions are written to load data into SAP onetime. These are typically file based.

Interfaces are written to exchange/update/send/receive data between SAP and other systems on an ongoing basis. These can be in many forms, file based, idoc based, real time(business connector, XI etc are useful in this), xml, and the list goes on.

-----------------------------------------------------------------------------------------


CONVERSION: Legacy system to flat file.

INTERFACE: Flat file to SAP system.

Conversion means data that is converted from one format to another format and from one system to another.

So when you first implement SAP, you are actually replacing some of your legacy systems, but you are not completely trashing the data. You still need some of that data from the systems that are being replaced. So you pull the data out of your legacy systems and put them on some files. You then want to load that data into your new SAP system.

That is when you write some programs which will read that data and load it into SAP. Imagine you had a home grown purchasing system. You are now replacing all that with SAP. But until SAP goes live, you want to keep using your home grown purchasing system.

So during go live, you want to transfer the POs from your legacy system to SAP. Now a PO in your legacy system may not have the same fields as a PO in SAP. So you convert the data.

Ex: BDC,LSMW

Interfacing is connecting two or more different entities. In our case, it is connecting one or more systems with SAP. Now extending our previous example, you are replacing some legacy applications but there are some applications that you don't want to replace yet.

You need to somehow pass data back and forth between SAP and these remaining systems. Data may be going one way or the other way or both ways. You will still need to do some data transformations/translations etc to make the data understandable to the receiving system.

This will continue as long as you want to keep the systems running alongside SAP.

Ex: idoc,bapi

In short, conversions are written to load data into SAP onetime. These are typically file based.

Interfaces are written to exchange/update/send/receive data between SAP and other systems on an ongoing basis. These can be in many forms, file based, idoc based, real time(business connector, XI etc are useful in this), xml, and the list goes on.

