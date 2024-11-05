#  56. Delivery Document Types and Item Categories

Alright.

What is a delivery document type?

Just like the way we have a sales document type, say, or so on and so forth, then deliver this order.

If there are deliverable items, of course.

You create your order quotation zero 1 or 21 and you deliver the document in Vl 01N.

And this is a separate class of document.

It's not the same as a sales document.

Luckily, there are not so many delivery document types.

Remember there are many sales document types or quotation consignments.

Contracts.

ET cetera.

ET cetera.

But in delivery, there are just two important document types.

One is Elf, which is for outbound delivery and for returns.

We have LR.

This one is for inbound delivery.

You don't need to go beyond this.

Just remember these two delivery document types.

One is Lf and the other one is LR.

Irrespective of what your sales type is, the order scheduling agreement contracts.

You can still use Elf and LR.

These two document types can capture everything that you need in a delivery document type.

In an order.

The document type controls of the document behaves right and at the line item level there is item category.

Say ten or tap or taps.

These are sales item categories.

Similarly, there are item categories at the delivery level as well.

And luckily they also have the same names to tap tous.

ET cetera.

ET cetera.

Same names as the corresponding sales item categories.

These are sales item categories.

Whereas these are delivery item categories.

Sales item categories have a bunch of controls behind them, like we have seen in the previous chapters.

The delivery item category, on the other hand, is much simpler.

Utmost, 2 to 3 controls that are really important.

Let's quickly go in and see the controls behind the delivery item category.

Go to SPRO IMG for delivery related configuration.

Don't go to the sales and distribution section.

Instead, go to logistics execution.

This is where some of you could get confused.

You know, you could be looking all around in SPRO and you might not find this.

So make sure you go to logistics execution for all delivery related configuration.

Sticks, execution.

Shipping deliveries.

We have the delivery document type and delivery item categories here.

Let's go to define delivery types.

Remember we said the most important delivery document types are Lf and LR.

Go ahead, pick Lf and go inside.

What are the main controls here?

I will highlight all the important controls, but again, not all the controls are important at this

point, but these are eventually important.

The first one is category.

This is similar to the sales document category.

What role does it play?

It defines how the document behaves.

For example, in sales, a quotation behaves one way.

An order behaves in a different way.

Right.

Similarly, Standard outbound document has a document category of J.

And standard inbound returns will have a different document category.

Well, we don't care about the document category itself, but it plays a role.

So you might have a question here.

If we just use two of them, why does SAP provide so many here?

We have 92 of them.

The reason is deliveries are not just used for sales.

They could be used for other processes as well.

Like.

Think of inter-company stock transfer.

Well, it is related to sales, but it's really an inventory process.

Sales just happens to trigger it.

Anything where a recorded goods movement needs to happen.

You need a delivery for that.

We just happened to use a delivery document type for inbound and outbound orders.

Overall, though, we have very little use for the delivery document type compared to other logistics

operations.

I mean, yeah, we need to use it, but compared to other logistics operations, our use of delivery

type is limited.

That's why deliveries are part of logistics execution rather than sales.

Okay.

That was the document category.

The next item is number ranges.

This part is easy, right?

We have internal number ranges, external number ranges and item number increment.

We have already seen them in the sales document type configuration.

Right.

In sales there used to be a sub item increment here.

You don't see that here.

Why?

We talked about subitem increments in the context of bombs.

Bill of materials.

There's something you have to understand here.

A bomb only exists at the sales document level.

So when it comes to the delivery, what happens?

What happens to the bomb?

The bomb becomes flat.

It loses its hierarchy, the parent child relationship.

But look at the problem here.

If there is a PC, say, with three parts in it, CPU monitor, keyboard ten, 20, 30, 40, so on.

20, 30 and 40 being the components will be part of ten.

That's how we define a bomb, right?

And that's how it fits into a sales order header.

One line and then components.

They are all linked together.

Marker 19.

Now how do we see it?

In a delivery?

In a delivery, what happens is the bomb gets flattened.

Out.

Into what?

Into a delivery group.

And that's defined in the item category level.

If you remember the sales item category controls, there's a field called application scope and structure

scope.

And right next to it, there's a field called Delivery Group.

So all the components of the bomb get flattened out.

And how is the delivery group used?

It just groups the components of the bomb together.

Why?

So that the components of the PC like the monitor, keyboard, CPU all go together.

The delivery group is how the delivery document ensures that all the parts of the Bom go together.

That's why you don't have a subitem increment.

The third field is order required.

This is always set to X for inbound delivery or outbound delivery.

Why is it set to X?

These document types.

Lf l r are only created with reference to a sales document.

You can't create them alone like standalone.

For example, if you go to VL01N and try and create a delivery of type lf without an order reference.

It's not possible to see the difference with order reference without order reference.

For all sales deliveries, beat returns or outbound.

We always need a sales document reference, meaning they should always be a demand document, which

is a sales order or a return order that triggers delivery.

Logistics cannot act on its own.

That's the summary of it.

In sales.

It's a sales order in returns, it's a return order.

So always ensure that this flag is turned on for elephant LR.

This ensures that somebody in the warehouse will not be able to create a delivery or an outbound delivery,

or even a return without an actual demand document.

The sales order.

You can only create an outbound delivery with reference to a sales order.

Similarly, if we have a return document, meaning somebody authorized a return, then you can create

a return delivery.

These two documents should never be created without a reference sales document.

That's what this field stands for.

The rest of them are not very important.

Output.

Determination.

Procedure.

Text.

Determination.

Procedure.

Root Determination.

Partner determination.

These are important, but like I said, not at this point.

So overall in delivery document type, there are three important controls.

Document category number ranges and order required.

We will now move on to delivery item categories.

Where is delivery item?

Categories.

Right beneath the dock type.

Once again, SAP makes our life easy.

They have the same names as the sales item categories.

The controls are a little different.

So if you go inside, can you see it's not as big as a sales item category?

It's pretty small.

Once again, what are the important controls here?

Document category.

Then we have relevance for picking and storage location relation for related fields.

And then text determination procedure.

That's it.

Very simple.

Right?

You already know what the document category is, and it defines the way an item category behaves for

ten, j for ten N, it's something else.

We don't care.

Relevancy for picking what is this field?

Let me give you a simple scenario.

You'll understand this field very easily.

You'd be tempted to think that every delivery item should be relevant for picking.

Why would we even do a delivery without picking?

Right.

Why would you want that item to be there when you are delivering something?

You would naturally tend to think that all the items are physical deliverables and hence, of course

they would require some kind of picking.

It could be picking manually or it could be picking via transfer order in the warehouse.

So if you make an item not relevant for picking meaning, check this off.

What happens is when you have this order ten line item, M0 one, quantity one, and you're trying to

create a delivery here, this order comes through line item ten, M0 one and and in the delivery there

is a delivery quantity of one and picking quantity, it will either be grayed out in case the item is

relevant for warehouse management or it will be just blank.

Until you go pick a quantity of one manually, put it in or use a transfer order.

Now, if you set this item category to be not relevant for picking, this entire field will be grayed

out and you cannot pick a quantity either manually or via the transfer order.

Once again come back to the same question.

What is the point in having this in the delivery?

One of the prime use cases for this is a bomb.

Think of the bomb top level component.

Let me start over again.

We'll take just three lines.

Line item ten PC 101 20.

Monitor 30 is a keyboard.

Higher level item is ten and all the quantities are one each.

Now let's deliver this.

When you deliver this line item.

Should this line item also be delivered?

Remember, it's a dummy part.

A phantom part.

It's not relevant for picking.

There is no part called a PC 101.

It's the monitor keyboard and the components that make up for that imaginary PC.

But should it be part of the delivery?

That's the next question.

The answer is yes, it should.

Let me tell you why.

Say we take a case where this does not come into the delivery.

This line item, the second and the third line items, the monitor keyboard and any of the components

come in.

So you've got a monitor, you got a keyboard.

And this line PC does not come in.

So you pick this, you pick this and you do the billing.

What do you have in the bill?

Monitor and a keyboard.

This is a delivery relevant billing meaning invoice is created with reference to the delivery and delivery

is created with reference to the order.

When you create the billing with reference to the delivery, only the monitor and the keyboard comes

through.

Now the customer will be confused.

He doesn't understand that this is part of a PC.

You see, he has ordered for a PC and he got the components monitor keyboard.

Where's the PC?

Well, he's under the PC, right?

That doesn't sound logical to the customer.

Right.

If you go order something from Dell and, you know, he sends an invoice saying, Hey, we got a keyboard,

you got a monitor.

Well, there should be something that binds all these things together.

That's exactly the problem that we're trying to solve here by making the top level part also flow into

the delivery.

But it's a phantom part.

But since it's a phantom part, we make it not relevant for picking.

That way the top level part PC.

Would just act as a placeholder just to hold the components, monitor and keyboard.

And finally, when you create the bill, it would make sense to the customer.

Oh, okay.

The monitor and the keyboard are part of the PC.

Great.

So that field relevant for delivery will be turned off.

When picking does not need to happen, but the item is relevant for delivery to make logical sense in

the final invoice.

Storage location is not required at this point.

Storage location is not required at this point.

There is a concept called storage location determination.

Some items are not relevant for storage location.

If you take the same example, the PC top level part is not relevant for storage location.

Right?

Why?

Because it's not stored in the first place.

It's a phantom part.

It's a dummy part.

It's a placeholder.

Or you can think of other examples like service parts.

Take warranty.

Three year additional service.

None of these types of materials require a storage location.

Why?

They're not stored, really?

It's not relevant for storage.

They don't need storage in cases like this.

You can just turn them off.

How about item categories like Tad or tasks?

Tad is one is a third party and another is service.

Can you see them here?

No.

Why that theory is service to us is third party.

Both of these items are not relevant for delivery.

You can't deliver service.

You your company cannot deliver a third party service.

Third party.

An order is delivered by the vendor.

So either way, there is no delivery.

That's why you don't see them as delivery item categories in this list.

They're all billed as order relevant items.

That's what you need to know about delivery document types and delivery item categories.

There is also a delivery item category determination.

It's exactly the same as a sales item category determination.

No difference whatsoever.

If you go to the configuration, you can see the four parameters.

Delivery document type item category group usage and higher level item category.

So that.

# 57. Billing - Business Scenarios

Now close the logistics section and move on to sales and distribution and billing section.

Billing is a little more involved.

Let's start billing.

Billing billing also has a document type, just like sales document types.

Delivery document types.

We have billing document types.

So what are the most important billing document types?

F two.

F5F8L2G2.

And I think we have an E as well.

Let me go inside.

Yep.

We have an RV.

These are the most important billing document types.

F2 standard invoice, just like the way we have standard order as or right.

Standard delivery xf f2 is the standard invoice.

F five and F eight are called pro-forma invoices.

If five is order relevant, pro forma.

If eight is a delivery relevant pro forma.

We'll go through the list and then when we create some of these invoices.

After that we have L2, which is a debit memo G two credit memo and Re is credit for returns.

We'll see all of these when we do a hands on.

Let's see how they are related to the sales document types and delivery document types.

Here is the big picture or delivered using.

Build using F2.

With reference to.

We can also create a pro forma invoice.

F eight.

And with reference to this order, we can have an F five order relevant for my voice.

We understand.

F2 right?

It's a standard invoice.

If we create a standard order, create a delivery for it, standard delivery, you can create a standard

invoice as well.

Now, what is this?

F five or F eight?

Both are pro forma invoices.

So what's a pro forma invoice when goods cross an international border?

A pro forma invoice is required.

To declare the value of the goods.

So here is an order.

The customer is in Canada and the company is in us.

And when you create the delivery.

Lf the goods should go from the factory in the US to the customer in Canada.

Inside us.

If you're selling it to somebody, it's no big deal.

Just ship it to a PGI.

But if your goods are crossing the border, meaning the customer is not in the same country as the plant,

say you have a truckload of computers, 100 computers crossing the international border from the US

to Canada at the US Canada border.

The truck would have to pass through customs.

Right.

So whenever goods are crossing an international border, the value of the goods have to be declared.

This is called Customs Declaration.

And what is the purpose of it?

From a customs perspective, the main purpose is to ensure that the customs duty is paid.

How much duty needs to be paid?

Well, apart from the type of goods.

One of the main parameters is the value of the goods.

Say 100 computers is priced at $50,000.

That's the declared customs value.

And for that, according to Canadian regulation, you would have to pay a customs duty.

So this truck, which is crossing the border, will carry a pro forma invoice which contains the value

of the goods crossing the border.

Marker 44.

This is typically created with reference to the delivery.

One question that you might have here is why don't we create the invoice?

That's the next logical step.

Anyway, right after delivery, you create the invoice.

So why don't we just create it instead of another invoice called the pro forma invoice?

Here is why.

When the truck leaves the plant, only the delivery is created.

At that point, the billing document is not created yet.

It will only be created overnight when the billing due list runs.

The customs officer does not care about this, right?

When they see the truck, they want to see the value of the goods being declared.

Marker 55 So an invoice can be generated called a pro forma invoice, which can be created with reference

to the delivery even before the PGA is done.

And that invoice will look just like a regular invoice.

It's slightly different.

We'll talk about it.

So this pro forma invoice will be printed that was created with reference to the delivery and sent along

with the truck and the authorities will use that value as a reference for customs duty.

This is one of the prime reasons why a pro forma invoice is used.

The customer does not care about the pro forma invoice.

The customer only cares about the regular invoice.

So the regular invoice is called tax invoice or commercial invoice as opposed to pro forma invoice,

which is more or less, you know, dummy duplicate document.

The only purpose of it is to declare value to customs.

So it's not relevant for tax.

It's more or less like like an FYI, for your information.

It doesn't have any tax implications.

That's why it's not called a tax invoice.

A commercial invoice or a tax invoice gets posted to accounts.

So your F credit or debit memo, these are all commercial invoices or tax invoices.

Just another name.

They get posted to accounts, and that's what the customer sees on his invoice.

A pro forma invoice does not get posted to accounts.

See this is posted to accounts and pro forma invoice, on the other hand, is not posted to accounts.

This is a major difference between the standard commercial invoice and pro forma invoice.

Pro forma invoices are not posted to accounts.

Standard invoices are posted to accounts.

Another difference is pro forma invoice is flexible.

You can adjust it any way you like it.

Let me give you an example.

For example, in this order, say the customer is ordering line item ten pieces, quantity of 100.

And line item 20, you're giving, say, 100 printers for free.

One PC, one printer.

The price of this is $500.

So the total comes to 50 K multiplied by 100.

Right.

The price of the printers is zero.

Because you are giving printers free to the customers through PCs.

So although there is a price associated with printers, let's say $100, we are giving it free to the

customer.

So the tax invoice or the commercial invoice, your regular F2 will only reflect 50 K the value of the

PCs.

The customer is happy with it.

We are also happy with it because we are doing a sale.

So who is the unhappy guy here?

This guy.

Customs Office.

He's not happy with it.

To him, the printers represent some value.

It doesn't matter if you're giving it to him for free.

He doesn't care.

As long as the goods have some value.

You'd have to pay customs duty if applicable.

So what do you do in this case?

Well, you tweak the prices in the proforma invoice.

This is a simple example of the flexibility provided by the proforma invoice.

So you modify the prices in the proforma invoice like this 50 K for PCs and for printers.

You put a value, say ten k.

So what's the total?

60 k.

So depending on the type of goods you'd have to pay duties for 60 K, not 50 k.

Since, you know, pricing is not affected in pro forma invoice, it doesn't affect the customer.

You can put any price you want.

That's the flexibility I'm talking about.

So this is a pro forma invoice F five and F eight.

Now, what about L2 and G2?

Let's say there is an order.

You deliver the order.

They build the order.

This is posted to accounts.

Say the customer has been overcharged.

Happens, right?

Human error instead of 10%, you have charged 12%.

Could happen.

Right.

So you have charged 2% extra.

See the customer complaints or we have found out that we have charged 2% more.

How do we return the 2% extra that we have charged to the customer?

We do it using a credit memo request with reference to the invoice.

We create a credit memo request.

How do you do it?

Just like how you create a regular order using A01.

So instead of.

Or you c r.

This does not have delivery, right?

And when you build it, the corresponding billing document type is G two.

Sales document.

Here is a credit memo request.

And this is a credit memo.

When the credit memo posts to accounts, it posts a credit of 2% or 50 K.

Right.

That comes to $1,000.

Similarly, sometimes you might be undercharging them, in which case you'd be creating a debit memo

request.

And when you bill it, you create a debit memo sales document.

Here is a debit memo request.

And this is a debit memo.

And debit memo is posted to accounts with just debits the customer with 10,000 with $1,000.

Another case is when the customer does not like the product.

You must return it.

Or maybe he wants to return a part of the product.

Say out of 100 computers, one is broken.

The customer wishes to return it.

What does he do?

Picks up the phone calls customer care.

Right.

And asks for return.

The customer care says, okay, give me your original invoice number, sir.

So we'll take that as a reference.

Create a return document.

Again, how do you do it?

Just go to zero one and instead of or use a return document type r, e and with reference to r e, we'll

create a return delivery l r.

Right.

And after that, we'll build the return delivery.

And what's the document type?

Billing Document.

Type R e.

And that will be posted to accounts as a credit.

This is called credit for returns.

This is very different from the standard credit memo process.

The credit memo is purely a financial transaction.

A written document includes both.

It has logistics because there is a delivery associated with ItrillionIGHT.

So it's got logistics.

And of course there is a credit that we are doing to the customer.

So there's a finance piece also marker 56.

So let's try to create an example in the system.

Go to an order first, we'll use a standard set of customers and materials.

Again, the final intent here this hands on is to see the document flow.

Okay, so let's deliver this.

We'll start with the original order or deliver it bullet and say to some of the subsequent transactions,

credits, debits or returns.

Okay.

Change the delivery date.

Picking is not enabled.

Why?

Because of warehouse management.

We know that, right?

So go ahead.

Create a transfer order.

Enter and save the transfer order.

Once it saved you, go back and change the delivery vehicle zero to N and you do a PGI.

Delivery is done.

Now, how do we build this?

We have zero one.

If you want to use the menu path, you can go to logistics, sales and distribution, billing, billing,

document or transaction code.

We have zero one.

Automatically, the last created delivery will come up here.

Remember, this is just one way to do the billing.

What's the other way?

Billing due list.

You can use V of zero four for that.

Here is the billing document that's created.

What's the billing document type?

F2.

Let's save it.

The billing documents should be posted.

Now you can go to the subsequent documents.

But remember, you can only do it when the postings have happened.

If for some reason the posting does not happen, you cannot do any subsequent transactions.

When I talk about subsequent transactions, I mean, you know, anything like return credits, debits,

anything that you do with reference to that invoice.

We'll see this case.

No accounting document generated.

The invoice is created, but it's not posted to accounts.

Why?

Well, we don't know.

You would have to investigate why this happened.

So go to change.

Your invoice number is already available.

Now click on the green flag.

This is how you post an invoice to accounts.

Just open the invoice in change mode and hit on the green flag.

That will post it to accounts.

What do you see here?

Posting period 005 2012 is not open.

This is a finance setter.

Your SEO consultant will fix this error for you so you don't have to worry about this problem.

For now, I know how to fix it, so I'll fix that for you.

Just go to OOB 52, select your company code or Fiscal year variant 1000.

Select all these rows and set the ending period to sometime in the future.

Again, don't worry about this transaction.

This is not important for us.

I am playing the role of a finance consultant here.

In case you get this problem in your test systems, just follow this step.

Go to OOB 52 and you can fix the problem.

Okay.

The invoice is posted to accounts now.

How do you know if the invoice is posted to accounts?

Go to the document flow.

And here you have the accounting document.

To see the different accounts.

Select it and click on the display dock.

Thousand is customer backer and he uses €1,022.

The revenue is a credit of €8.59.

And the tax is a credit of €163.

These are called GL accounts or general ledger accounts.

In the SDF interface section.

We'll talk about account determination, and in that chapter we'll understand some of the basics of

accounting and we'll talk about all this stuff.

General ledger debits, credits, what they are and as far as we need to understand.

Let's say the invoice number is 10000 78.

And we want to create a credit memo.

What is a tax in this invoice?

Go to the first item.

Go to conditions.

And what's the tax percentage here?

19%.

Say the correct tax is 17% instead of 19.

So we have to return the 2% tax back to the customer.

Let's say 2% of the tax value here of what, 163.

Right.

Is, let's say, you know, €20, you know, just some number.

Go back, take this document number, go back, go to sales, start with an order.

But instead of or do a CR, this is a credit memo request.

Easy to remember, right?

CR credit memo request debit memo request.

We want to give money back to the customer and click on create with reference.

Now, this is important.

Why?

Like we discussed earlier, we want to create a credit memo always with reference to the original invoice.

Always.

Marker 67 When we discuss copy controls in the next set of chapters, we'll talk more about this, you

know, create with reference thing.

Okay.

Go to create with reference, select the billing tab.

Paste the invoice number.

So it's copying data from the original invoice F2.

Into the new credit memo.

Stuff like customer details.

Line items.

Quantities.

All this stuff will be copied.

ASAP will automatically put a credit memo on a billing block.

That's a standard default behavior.

See, I didn't do anything.

The reason is the credit memo is issued when money needs to be paid back to the customer.

Right.

So SAP automatically places a block.

Why?

So that somebody who is authorized will go review it and manually remove the block.

This ensures.

That somebody explicitly looks at it.

Let's remove the block.

Just blank it out.

Go into the pricing for this.

What do we want to do?

Give $20 back.

Right.

So put 20 or 18 or whatever value.

So the net value, including the tax here, will come up to some $20.

Now we need to do a delivery.

No, we directly do a billing document.

This is a credit memo request, right?

There's no logistics involved.

We are not returning goods or, you know, sending back goods.

It's purely a financial transaction.

Just giving money back against what?

That material that invoice number.

So we directly do billing and the sales document is incomplete.

Go to edit and you know what?

You have to fill an order reason.

Where did you see the order Reason.

Go to the sales tab and put an order.

Reason.

Why are we putting an order?

Reason?

For tracking.

By the way, these are customizable.

You can make your own order.

Just put some reason there and then do billing.

So it's €18 plus tax and quite similar to this, we can create a debit memo also.

How do you do that?

Go to zero one and use order type R, click on create with reference similar to the way I've created

your credit memo.

Right?

Always with reference.

Enter the original invoice number and click copy.

Now remove this block.

Blink block.

Go inside the line item.

Change the value to whatever you want.

Then make sure you select an auto region and try to do the billing.

You see, this time it's a debit memo.

Previously it was G2, now it's L2 Debit memo.

And click on Save.

Similarly, you can create a returns document.

Say the customer wishes to return the goods.

So go to zero one.

Enter document type.

Which one are we?

That's the sales document type.

Again, create with reference.

Put the original invoice number.

The customer gave us over the phone.

Say.

And click copy.

Oops.

It doesn't work.

Why?

You see, we have the invoice number, right?

But we have put it in the wrong tab.

We are creating a return order with reference to the original billing document.

Right.

So use the billing tab.

We have used the order tab here.

So go to the billing tab, put the invoice number and click on copy.

SAP will copy the products.

Then he might not, you know, want to return everything.

Say, out of these 100 PCs, he might want to only return one because that's the only defective PC.

Right.

So you can put a quantity of one.

Now remove the block.

Put an order reason.

Maybe the customer says the PC is broken.

That's why he's returning it.

So put that order reason, say material ruined.

And so he gets the full price back.

Right now, just $20 the entire price.

So we don't need to touch pricing.

So for that entire quantity of one, the pricing is entirely copied over.

Now, can we build this directly?

No.

The customer has to first return the product, right?

It's a logistics transaction.

It's not like a credit memo or a debit memo, which is purely financial.

And as usual, to do the return delivery for the product, in this case, we need to do picking.

No, we're not going to pick the goods.

In fact, we're going to do the opposite, which is put away.

All we need to do in the return delivery is just click on the post goods receipt.

And finally we build the product.

This time the customer does not need to pay us, but instead we are going to pay the customer.

All right.

So let's look at the document flow of whatever has happened until now.

Go back to the standard order.

All the way.

And click on the document flow.

First we created an order and then a delivery and billing.

After which there were some pricing discrepancies.

For which we created the debit memo or a credit memo, depending on whatever is the requirement.

And when one of the products did not work, we did return.

For which we did a return delivery and then a return for goods invoice.

If you look at this accounting document, which is the accounting document for the original invoice.

And click on display.

You see the customer is debited.

Now go back and look at the credit memo.

You see the same value is a negative.

So in the original invoice, the customer is debited.

And in the credit memo, the customer is credited.

That's what we want to do, right?

So how do you know in which case it's negative and which case It's positive?

Well, the simple answer is we don't care.

ASAP will automatically take care of the postings, negative or positive.

And what does it depend on?

You know, what's the what's the deciding factor?

It's a document category.

Your debit memo request belong to a different document category.

Credit memo belongs to a different category.

Invoice belongs to a different category.

Credit for returns could belong to a different category.

Pro forma could belong to a different category.

What we need to understand is in this case, the accounts got balanced out in the original invoice.

It was positive in the returns.

It's a negative.

Makes sense, right?

# 58. Billing - Configuration

Let's come back to the billing document types.

We have seen some billing document types, right?

Standard billing, debit memo, credit memo, so on and so forth.

Now, where is the configuration for this?

As usual, go to SPRO, IMG sales and distribution billing billing document types.

Now click on Define Billing document types.

And here they are.

Pro forma invoice for order.

Pro forma invoice for delivery.

Standard invoice.

If you go down below, there's a debit memo request to credit memo, G2, so on and so forth.

Go inside F2 and here you'll see all the controls.

These are the controls behind the billing document type as usual.

Let's go through the most important ones.

Number ranges.

Number two, document category.

Number three posting block.

I will discuss about this in a bit.

Number four invoice list type.

Number five.

Relevant for Rebate.

Number six.

Invoice Cancellation.

Seven.

Account Determination.

Eight.

Document Pricing Procedure.

Again, not all the things are important at this point.

Let's just discuss a couple of things today.

First one number ranges.

You know what they are, right?

Next one document category.

What does it do?

Define the DNA.

Number three posting block.

What is this posting block is used to block the invoice from posting to accounts.

Let's see the effect of it on an invoice.

Try.

Let's not change F2 because it's a standard document, right?

Instead, make a copy of F2 and then create z F2 to anything any Z document.

Say, Oops, it looks like it's already taken, so let's try ZF eight eight, six.

Okay, this works.

Save it in this document type ZF eight eight.

Let's put a posting block.

Let's go back.

Now let's go back.

Create an order, deliver it and invoice it.

Let me quickly go create an order and delivery.

I think you know how this is done anyway, so I'm going to fast forward this and come to the invoice

creation step.

We have to do something different here.

We hit enter, then the default invoice document type F2 will be created.

That's not what we want.

We don't want F2, right?

We want Xf 88.

So select that in the dropdown and hit enter.

The invoice document type that's created here is Xf 88.

And save it.

What does it say here?

It says no accounting document generated below, isn't it?

Now go to zero two in change mode and click on the green flag.

It's posted now.

So previously when we created invoices, we never had to explicitly click on this button to post to

accounts unless there was a problem with accounting the billing document always used to post automatically.

In this case, we had to explicitly post the invoice even though there were no issues.

Why did this happen?

Because we have configured Xf 88 to stop automatic account postings.

So whenever a billing document is configured with a posting block, every time a document is created,

you have to use this flag to post it to accounts.

Why do we do that?

Meaning what kind of business scenario would call for it?

You know, checking this flag on one of the thumb rules with invoices is once.

An invoice is posted.

It's irreversible.

Meaning you can delete the document.

Well, there are some ways to logically reverse the invoice, but you cannot delete the document.

So how can you reverse an invoice?

Well, there are two options.

First option is to cancel the invoice.

And you use a document type S1 or S2 for that.

And the second option is to use a credit or debit, depending on your requirement.

That's the reason why we have the cancellation document here.

Number six.

We'll see how to cancel an invoice.

How do you do that?

Go to billing.

Put your invoice number.

And in the menu, click on Cancel.

And hit enter, then save.

What did we do here?

Open the billing document in zero two.

Click on cancel in the menu.

And save.

What's the cancellation document?

This

19000038083.

Go to display and look at the document flow.

You see the original document and the cancelled document as well.

If you look at the accounting flow associated with the cancellation document, it will be very simple.

It's exactly opposite to the original accounting document.

It just offsets all the credits and debits in the original document.

For example, you see, this is a credit against this customer.

It's negative.

If you look at the original accounting document, it will be a debit.

Once again.

How did we cancel this invoice?

Like so.

Open the billing document in change mode.

We have to go to the menu billing document and cancel.

This is one way you can reverse the billing.

You already know the other ways.

Credit memos and debit memos.

So with that context.

Let's ask the question again.

Why would you want to stop posting to accounts automatically?

For example, a company like Siemens is selling power, Transformers or something very big, let's say,

to a power generating company.

Say the entire order is just one transformer or a couple of lines worth $10 million.

That's a big order, right?

You don't want to make mistakes in such a big order.

Typically for such big orders, there will be dedicated builders.

They look at the invoice ten times, 20 times.

Check if all the line items are correct.

The prices are right, the taxes are right.

Why?

Because like I said, you cannot delete an invoice.

You have posted two accounts.

So once the invoice is checked for accuracy, somebody else will double check it.

Save it.

And do what?

And explicitly.

Posted to accounts.

Next topic.

Invoice list.

Let's talk about the business scenario.

Say on May 1st.

There is an order.

Order will be delivered and billed on the 10th.

On the second, there is another order.

Third, there is another order.

Fifth, another order, so on and so forth.

Each time there is an order.

It will have its own invoice.

See on 11th, 15th, 20th, so on and so forth.

Bottom line is the customer will receive as many invoices as there are orders.

Simple.

And each of these invoices will be posted to accounts.

And when an invoice is posted to accounts, the accounting document will contain a reference number.

Which will typically be the invoice number.

Say this invoice is 9000012, and this invoice number will come as a reference number in the accounting

document.

When the customer pays.

Here is our customer.

What's the invoice?

900012.

Say the customer pays an amount of $10,000.

The customer will pay it against this reference number 900012.

And the finance department receives the payment.

They take the cash or cheque that comes in.

And apply to the accounting document.

So incoming payment.

Will be applied to the accounting document.

Of course, against the reference number.

That's the key.

The reference number holds the key to clear these payments.

The customer will receive the invoice, which says 90012.

He'll give us he'll get it as he will get it from us via email or phone or fax, and he'll pay against

the invoice.

And in the accounting document we put the invoice number as reference and that reference will be used

to clear the incoming payment against the accounting document.

This is how it happens in finance.

Now let's come back to invoice lists.

Now.

What is the problem that we're trying to solve here?

Too many invoices.

That is the problem.

There are simply too many invoices.

Some customers don't like it.

It's too much for them.

Let's just say every month.

Send me one consolidated invoice.

You can generate as many invoices as you want, but just don't send it to the customer.

The end of the month or end of the quarter or end of the week, depending on how frequently the customer

wants it.

Generate one consolidated invoice.

How does this happen?

Say invoice one.

Invoice two.

Invoice three.

At the end of the month, consolidate all of them.

These are all f twos.

Any different kind of billing document L twos G-2s.

Rhys returns.

Because all along the month you could be generating standard orders, debit memos, credit memos, returns,

all different kinds of transactions.

At the end of the month consolidate into what is called as an invoice list.

Which will basically contain a huge list of items from these billing documents.

All right.

So the first one will have two items.

Say those two items will come and sit here.

The second invoice will have four items.

These four items will come and sit here.

So on and so forth.

So this is a huge list of line items from the original invoice that sit in this document called the

Invoice List.

Okay.

So far, so good.

So what's the problem here?

Why did we talk about the reference number?

Here's the trick.

The original is created and posted to accounts.

Original meaning Original accounting document.

So it contains the invoice number as the reference.

This means the LR invoice list does not need to create separate accounting entry.

Why?

Because they're already posted to.

This is more or less like a consolidation.

A listing.

That's it.

You're not going to post it to accounts.

So what is an invoice list do?

When you create a layer, it will create another invoice document.

It's called an invoice list document.

And here is the magic that he does.

He will go and change the reference numbers.

Let's say 900019.

And this is 900020.

So on and so forth.

Each of them will generate their own accounting document, Right?

SAP will go look at all the accounting document numbers one, two, three, four, five.

And against each of these accounting documents, it will go into the document and changes something.

What is it?

Yeah.

Reference number.

It changes the reference number in each of these invoice accounting documents.

To what?

To the invoice list.

Document number.

Now what happens?

Say the payment comes in.

The customer pays a lump sum against the invoice list.

Say the first order is $1,000.

The second invoice is 1000, and third is 1100.

So on and so forth.

The these individual invoices.

Of course, will not be sent to the customer.

Right.

The customer has offered a lump sum invoice.

A consolidated invoice now with the number 900058.

That's created at the end of the month.

Say, this is the invoice list.

It will be sent to the customer at the end of the month.

The customer will receive it and pay against the invoice list number.

See, the total for the entire month is 30,000.

So the customer pays 30,000 against 900058.

What's the problem here?

When the accounting department tries to apply the payment, $30,000 against the accounting documents.

The accounting documents, that's important.

The accounting department works with the accounting documents, not with the invoices.

Which accounting document?

The one associated with the invoice list.

No.

Invoice list does not post to accounts because they have already been posted in the original invoice.

So which accounting document?

When the invoice list is created?

Remember we said it will go and change this individual accounting entries to 585858.

Now it's easy.

Payments will be made against these accounting documents.

That's the logic behind invoice lists.

Way to create invoice lists is via VF 21 or you can use the menu invoice list.

We have 21.

Use billing document type LR You specify all the billing documents against which you need to create

an LR.

Or you can use the due list as usual.

Go to four.

Just put a date here and sales area say 1010 zero zero and payer.

Payer of say 1000 or 1020.

So this will pull up all the invoices created for the payer.

1000.

Right now there aren't any, but they would come up here if there were.

Now, not all customers require invoice lists.

Right.

How do you mark customers that require invoice lists?

Go to the sales view billing tab.

Look at the invoice list dates.

Which is the calendar based on which you can generate invoice lists.

If you fill in this field, that means the customer is relevant for invoice lists.

If you don't fill this field, invoice lists will not be generated.

So the pair should be marked as relevant for invoice lists.

Remember, it's not the sole tool, it's the payer.

Okay, so let's recap what we have learned.

We have seen how to create invoices, credit memos, debit memos, pro-forma invoices and credits for

returns.

Point number two, we have also understood why they are created.

Point number three, we have seen which of these have accounting documents and which of them do not

have accounting documents.

Number four.

We have invoice cancellations.

And we have seen what happens when you cancel invoices and how to cancel invoices.

Number five.

We have seen what invoice lists are, why they are used and how they are created.

And point number six, we have seen reference numbers in the accounting document and what role they

play in customer.

#