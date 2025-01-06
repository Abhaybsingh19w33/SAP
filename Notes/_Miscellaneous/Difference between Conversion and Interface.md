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