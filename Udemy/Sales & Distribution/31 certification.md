In this chapter, we will discuss the topics for SAP SD certification.

The first topic is master data.

So master data.

Master data comprises of customer master.

Parts of the material master.

Like the general view.

Sales View.

Accounting View.

And of course, things like condition records.

This is all master data.

Right.

We have not gone to customization yet.

But this is general master data.

What?

Different fields are important?

What is the significance of each of these fields?

So on and so forth.

So this topic is around.

10% of the total number of questions.

So master data is around 10%.

The second topic is enterprise structure.

Do you know what's there in the enterprise structure?

Right.

The sales or distribution channel division, company code, plant storage, location, shipping point,

so on and so forth.

So this is roughly 5%, not more than that.

And the third topic, probably the biggest topic.

Is the sales processes.

And.

Sales.

Customizing.

So what is included in this section?

So we start with.

Sales document customization.

So basically we ovate.

You customize or create or and then you tweak the controls inside it.

What kind of controls?

Document Category number ranges messages for quotation price controls.

There are roughly 10 or 20 different fields that are important at least 5 to 7 very important fields.

And then sales item category.

Customizing This is VOV7 ten tap TC.

You customize it, right?

So what do you have in customizing?

How the item category is relevant for delivery, how the item category is relevant for billing, how

the item category is relevant for bomb explosion, so on and so forth.

That is item category customization.

And then we have schedule line category VOV6 schedule line Category Controls Word Schedule Line Category

controls.

Blocking the delivery.

Relevance for ATP.

So on and so forth.

And then we have item category determination.

This is VOV4.

This is where you determine the item category.

Determination of item category is based on what?

Four different parameters.

Right?

Sales document type.

Item category group higher level item usage.

Then schedule line category determination.

This is VOV5.

So these are the document types, item categories, schedule lines and their determination.

Then we have document flow.

So there are different kinds of document flow, right?

A transaction that controls document flow between sales document and another, say, quotation and an

order is VTR and then between sales and delivery.

Delivery and billing.

Billing and billing.

Billing to sales Document like credit.

Debit.

Memo creation.

So all of that I'm classifying as vtcs.

So this is the set of transactions.

Where copy controls and document flow is configured.

So you have to go inside that and then figure out all the different kinds of controls, like how the

line number is being copied.

Copy control routines.

There are so many things inside copy controls, right?

So document flow basically refers to the copy control configuration.

And then we have incompletion log.

Incompletion is where you control.

What are the different fields.

That dictate whether the document is complete or not.

For example, if you don't enter the purchase order number in a sales document, say sales order.

Is the document complete?

Well, you can decide it.

You can control it.

That's done Using the incompletion procedure and the log of incomplete items in a sales document or

sales order is called a completion log.

And then we have partner.

Determination.

V o p.

A n.

So anytime I put something in square brackets, it typically represents a transaction, right?

Partner determination controls.

Partners that can be entered or automatically determined at the header level and line item level.

It could be at the sales document level, delivery document level or billing document level and how

partners are copied.

When you reference one document with reference to the other, like delivery with reference to a sales

order, what are all the partners that are getting copied?

Quotation to order.

Same thing.

So that is partner determination.

And then we have contracts.

Scheduling agreements.

Collectively, these are called outline agreements.

These are long term sales documents or negotiated instruments where the customer typically gets deeper

discounts.

So in contracts and scheduling agreements, you basically control what are the different types of contracts

like, for example, quantity, contract value, contract.

And in scheduling agreement, what are the different kinds of scheduling agreements?

What is the difference between a contract and a scheduling agreement?

What are the basic document types that are used for contracts and scheduling agreements?

So that is contracts, scheduling agreements.

And then we have material determination.

When a material is entered.

If the material is not available, it can be substituted with another material automatically, or if

a material is being phased out, it can automatically be replaced by another material.

This is called material determination.

It follows a simple condition technique based modeling.

And then we have listing and exclusion.

Why do you do listing and exclusion?

You are allowing the customer to order everything except for a certain set of materials that is exclusion.

How do you control the configuration that is listing and exclusion?

And then we have cash sales.

Document type CSS.

And we have bill of materials.

In bill of materials.

You should understand how to create a bomb.

What kinds of bombs are there?

Sales.

Bomb production.

Bomb.

Universal bomb.

What's the difference between them?

So when do you use each of these kinds of bombs?

How bomb is exploded in the item category.

So and what controls in the item?

Category control?

What kind of bomb explosion happens?

So this topic that comprises of all the things that we have just discussed is probably the most important

topic because it has so many items and it's roughly.

25%.

So that includes.

All of this stuff, what's listed here in this page and on the next page.

And then we'll move on to shipping.

Shipping.

Is the fourth topic.

So what is there in shipping?

So shipping generally means things that are relevant in the delivery.

So you have delivery.

Document type.

So lf is the standard delivery.

Document type.

Right.

And then we have our return delivery.

These are the two main document types that you need to be aware of.

And what kind of structure does it have?

What is there in the header?

What is there in the line items?

What kind of configuration controls it has, things like number ranges, storage, location, determination,

so on and so forth.

And then.

We have scheduling.

What is scheduling?

Why do you do scheduling?

Why does why does SAP do scheduling?

What is the difference between forward scheduling and backward scheduling?

What is the default scheduling mechanism?

SAP uses first.

Then we have picking and packing.

Packing is very light, but picking is important.

So make sure you understand what picking is.

Understand what is short picking.

Understand how picking can be done.

Straight picking.

Warehouse management based picking.

So on and so forth.

And then.

After picking.

What do you do?

You issue goods and in case of returns.

You do goods, receipts.

Understand the relevance of goods issue.

The accounting entries that happen behind the scenes in case of a goods issue.

And similarly, what happens with goods receipts.

And then stock transfers.

Stock transfer is transferring stock from one plant to another.

This is a cross functional area.

SD.

So you don't have to go too much into this.

Just understand the basic concepts and the document types that are used, so on and so forth.

And again, this is a very important topic, shipping.

So shipping is somewhere.

At 15%.

All right.

After shipping comes billing.

So what do you do in billing?

So what kinds of billing are there?

Delivery.

Relevant billing.

Or order relevant billing.

What is the difference between them?

What are the document types used for each of them?

And then we have credit and debit memos.

The different document types used for each.

And then we have the actual billing process itself.

You can create a billing document as an individual process.

Or you can do it in a collective billing process.

So this is V of zero one.

This is V of zero four.

What is the difference between them?

When do you use each of these and what happens specifically in collective billing?

And then we have invoice splitting.

What is invoice splitting?

Why do you do invoice splitting?

What are the criteria typically that can be used for invoice splitting?

What is the structure that is used in invoice splitting?

And then we have invoice lists.

What is an invoice list?

What are the different controls in the invoice list?

One comes from the customer master and then you have configuration for.

And how invoice lists are created.

And what happens to the accounting entries when invoice lists are created?

And then we have building plans.

There are two types of billing plans.

Periodic Billing.

Milestone Billing.

Milestone billing is typically something that we don't do a lot in SD unless it comes from the project

systems module.

But just understand the difference between the two and focus more on periodic billing.

And then finally we have account determination.

So there are 2 or 3 different types of account determinations.

Revenue account.

Determination.

Recon Account.

Determination.

Cash Account Determination.

The ones that are relevant for us is revenue account and recon account determination.

So collectively, billing is probably around 15 to 20%.

So that is topic number five.

And topic number six is pricing.

What is the most important thing in pricing?

Condition technique.

So what do you have in condition?

Technique.

The basics of condition, technique like condition, table access.

Sequence.

Condition type.

Pricing procedure.

Pricing procedure, determination and how all these things are related.

And then we have specific controls in the pricing procedure and condition type like requirement routines,

alternate calculation routine.

Manual controls versus automatic manual condition types.

Subtotals.

Condition category.

So these are the things that you have to understand in condition technique.

And then you have some off topics like sales deals and promotions.

And rebates.

You don't have to really focus a lot on rebates because it's a very big topic.

So just to understand the basics of rebates.

You don't even have to go into the depth of configuration.

Why rebates are used.

And maybe do a procedure for rebates, sales deals and promotions also is not too complicated.

Just understand the difference between a deal and a promotion.

And why do you use sales deals?

What is the significance of sales deals and the business case for sales deals?

So this is around 12%.

And then we have cross-functional customization.

What do you have here?

This is going to be a bit of a rehash.

On what we have seen in the sales document type customization.

The first very first or the third section.

So we have things like text determination.

An output determination.

And then the PDF forms.

You don't have to really go into PDF forms, but just to understand that how PDF forms are triggered

and then in reports how transaction variants are set up.

The Duellists like delivery.

Duellist Billing Duellist.

What are the transactions for each of them?

And then user exits.

Boris then.

And there is another topic called availability check.

It's a separate topic in itself, but I'm just listing it here because it's a very small topic, right?

Availability Check.

And between all of this, this comprises of around 12%, again, 10 to 12% of the total.

And then the final topic is the basics.

Of Netweaver.

The basic system.

Basics of ERP.

And the basics of solution manager.

So this is less than 8%.

Not very important.

So you can easily score points here because you don't have to really learn configuration.

Just the basics of netweaver.

Basics of ERP and basics of solution.

Manager Just learn the theory and that's it.