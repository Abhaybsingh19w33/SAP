# 49. What is Schedule Line Category

In this chapter, we will talk about schedule line categories.

What is a scheduling?

We've talked about document types like or Z or Q in which control how the document in general behaves.

You can also call it as controlling the header.

Because most of the properties that the document type controls are in the header.

Now, what controls the line item?

Item category.

Example ten tap tad one is for the standard item.

Category one is for bill of materials, one is for service and so on.

So they control how the line item behaves.

So we have the header here.

We have the line item here.

And then what's left out?

Schedule lines.

These are the three main components of the sales order.

Go back to the sales order deep dive chapters if you need a refresher on this.

Now.

CP CN These are some examples of schedule lines.

We are going to talk about them going forward, but they control how the schedule line behaves.

Let me give you a quick refresher on schedule lines.

What is a schedule line?

A schedule line in plain English.

Is a schedule of delivery.

Let's talk about a business scenario.

Here is a customer.

He goes to Dell.com and is looking at configuring a computer.

If he selects a part that is not readily available, there will be a warning message that says that

the shipment is going to be delayed by, say, two weeks.

Why does that happen?

Because the part is not readily available.

Maybe Dell procures it from another vendor and it's going to take two weeks.

In the case of Dell, it's not very relevant, but typically in B2B businesses.

The customer most of the time asks for a date.

The date when the goods needs to be delivered by.

That date is called the requested delivery date.

So today is the 3rd of October and the customer is asking for the goods by the 10th of October.

So today is when the order is happening in VS zero one.

The customer places an order of type or line item ten material M01 Quantity one.

So we have the header controlled by the document type or.

And the line item controlled by the item category.

And if you go to the line item, you have a section called Schedule lines.

There is a separate tab called schedule lines.

And there you'd have information on the schedule of delivery.

Say the quantity of the line item level is 15.

And what is the date the customer asked for?

It's the 10th of October and the quantity requested by the customer is 15.

And then there is another column called Quantity Confirmed.

So can the company deliver the quantity that the customer has asked for by the 10th of October?

What does it depend on?

Of course, the available stock quantity.

How much stock do we have on hand as of that date?

There is a separate topic on it called scheduling and availability check, but we are going to learn

about it in a much later chapter.

For now, let's say that we don't have the quantity of 15 in stock.

By the 10th of October.

So SAP puts a quantity of zero.

In the confirmed quantity column.

Say we can deliver the goods by the 20th of October.

So we put a confirmed quantity of 15 in a new schedule line row for the 20th of October.

So anybody can understand by just looking at the schedule lines.

The customer originally asked for a quantity of 15.

By the 10th of October, and the quantity could not be confirmed by the 10th.

Because we see a zero there.

However, on the 20th of October, the quantity confirmed is set to 15.

So let's not worry about how we arrive at the date, the 20th October date.

That the system has confirmed the goods for.

We would not be able to understand it until we cover the availability, check and scheduling chapter

like I discussed before.

But for now, just understand that the schedule line is where the confirmed quantity and the dates are

available.

Now that we know how the schedule lines are created.

We can understand the schedule category better because that's what controls.

How the schedule behaves.

# 50. Schedule Line Category Controls

Now that we know how the schedule lines are created, we now need to understand schedule and categories

better.

Because this is what controls how the schedule line behaves.

Typical examples of scheduling categories are CN.

CP.

CS Like how an item category is 3 to 4 characters.

Schedule line category is two characters.

Now, what is a schedule and category?

What is the purpose of it?

Let's talk about the controls behind the scheduling category.

Scheduling category is not as big as the item category in terms of the complexity.

It just has five important controls.

Let me quickly log on and I'll show you all the five controls.

So before I go further, I have to tell you that there is a quick shortcut to remember the transactions

for configuring the sales document types, item categories and schedule line categories.

What is the transaction code for sales document type config?

We v8.

What is the transaction code for item categories.

We always seven.

And of course the transaction code for scheduling categories is VOV6.

In case you are curious about the other important shortcuts, we OV4 is for item category determination.

And VOV5 is for schedule and category determination.

You don't need to really remember these transactions, though.

Nobody is going to ask you in any of the interviews or otherwise.

You can very well use the Sbarro menu path to get to these.

But since you're going to use these transactions so often, these shortcuts will just save you some

time.

Coming back to the controls.

Go to V0 v6 in SAP.

Uh, select something like CP and double click it.

So what are the important controls here?

Number one delivery block.

Number two movement type.

Three is order type and item category.

Number four is requirements and number five is availability.

Let's talk about these one by one.

# 51. Delivery Block

The first control is the delivery block.

Where else in the configuration have we seen delivery blocks?

In the document type, there is a block.

What does this do?

Blocks the delivery of the entire order.

In the item category.

Is there a delivery block?

No, there is no delivery block in the item category.

So what does the delivery block or the scheduling category do?

Blocks the delivery of the line item.

This is a little tricky.

One would naturally tend to think that there will be a delivery block at the item category and it would

block the delivery of the line item.

But now.

Blocking of the delivery of the line item level is controlled at the schedule line.

Category level.

Just go pick the type of delivery block and the line item would automatically be blocked for delivery.

# 52. Movement Type

The next one is movement type.

This is not SD configuration, so you don't have to really configure new movement types or learn the

configuration of the movement type.

So who does this configuration?

Consultants.

But we should understand what a movement type is.

Why?

Because we have to configure it here in the scheduling category.

So what is a movement type?

A movement type represents a change in value from a company's perspective.

Yeah, I know it sounds too generic, but what the hell does it really mean?

I'll give you some examples.

A change in value could happen because of a variety of reasons.

For example, take an order and its delivery.

The goods are picked, packed, loaded, and the truck is gone.

But from the system's perspective, the stock is still available until you do what, a PGA?

When you do a PGI, what happens?

The accounting is affected.

How is it affected?

What are the accounts?

Cost of goods sold.

Inventory.

Inventory goes down.

Cost of goods sold goes up.

I'm calling this a change in value.

Up until that point, there is no change in value.

It is picked.

It is packed.

It is loaded.

There are a lot of things happening physically to that material, but that does not matter.

Is there a change in value?

No change in value.

It's still the same material.

Same value.

By value, I mean value from a company's perspective.

It is worth the same.

From the accounting perspective.

But when you do a PGI, that's when we are instructing the system, Hey, the goods are gone.

They're no longer ours.

The value of the goods that the system evaluated as inventory is now sales value.

That's why we use the term cost of goods sold.

They're sold.

This is an example that's very intuitive for us because we understand the sales cycle already.

Let's take another example, say meat processing facility.

In a factory like that, food could be rotten, right?

And you have to throw it away.

Some of these examples of food companies are Cisco, Cisco or Tyson Foods.

Um, say there is some chicken laying in a bunch of Tyson food trucks.

And it's got an expiry date, say, three days from now.

There is a heavy storm in New York and trucks are not able to move.

So what do you do with the chicken?

Sell it.

No, you throw it in garbage.

Say this chicken is worth $1 million.

So the value of the chicken changed from $1 million to garbage.

And what's the value of the garbage?

Yeah.

Zero.

So we can.

We can throw a rotten piece of chicken in our house.

Okay.

But for a company to throw $1 million worth of chicken as garbage.

Has to, of course, happen with proper accounting.

And how do they account for it?

There will be a special movement type, say five, 60 or 580.

It's typically a three digit number.

And what happens when you use this movement type to to to garbage the $1 million worth of chicken.

The inventory goes down and typically a wastage account will go up.

Why not the cost of goods sold?

Because we have not sold the chicken.

We wasted it.

So the wastage account goes up in this case instead of the cost of goods sold.

Now, you might have another question.

Why don't we just debit and credit the accounts?

These accounts, instead of introducing a new concept called movement type?

And using it to again do the same thing, debit and credit the accounts because the person in the warehouse

is doing this activity.

The activity of throwing the chicken into the garbage.

He doesn't know accounting.

He doesn't know what's an inventory account, what's a cost of goods, sold, account and all that.

He is not from an accounting background, so he's not bothered about accounting.

So this is the missing link between accounting and warehouse activities.

So all the person in the warehouse has to know is the right code.

So this three digit code, that's the missing link between movement type and the account, the movement

type effects.

This might be an extreme example.

Let's take another more, you know, a simpler example.

So think of the Philips or the Samsung warehouse.

Say there are plasma TVs.

Very delicate stuff.

Say somebody is transporting them from one bin to another in a forklift, and suddenly, due to a human

error, the plasma TV gets dropped onto the floor.

Once a plasma TV.

Once a plasma TV is dropped.

It's as good as garbage.

So that particular one, plasma TV, which costs, say, $1,000, has to go to garbage.

So what should the warehouse manager do?

It's a human error.

Just use a certain movement type to junk the plasma TV.

What is really happening behind the scenes.

This movement type will be configured by consultants in such a way that whenever somebody uses this

movement type.

These accounts will be affected.

Inventory goes down, the garbage account or wastage account goes up.

So all the warehouse folks need to know is what code to use for wastage and what code to use for cost

of goods sold, etcetera.

We have just seen these two examples.

Now let's take another example.

Say an intercompany example.

Think of a plant in the US, another in Canada.

If there is a request for goods from Canada and say the weather in Canada is so bad that the factory

could not make it, the plant in US can supply that material.

Right?

Simple scenario.

So goods are transferred from the US plant to Canada plant.

It's the same Tyson Foods company.

But the company codes are different because it's different countries.

You cannot have the same company code in two different countries.

It's legally two different companies.

So one in the US and one in Canada, purely from a legal perspective.

So these plants need to have their respective accounting.

This scenario is called inter company stock transfer.

So in this case, is it as simple as just sending the goods because it's the same company?

No.

There needs to be a PGI here, a PGR that happens here.

An invoice is raised from this company to this, and this company could have to pay for it.

It's like a regular sale.

The only difference is it just doesn't happen at a list price.

It happens at cost.

Price.

That's the only difference.

That's why you always maintain the cost price in the material master.

Now coming back to the movement type here, what movement type will be used?

Some three digit movement type will be used.

What are the accounts affected?

Inventory goes down.

Okay.

Does the cost of goods sold go up?

No.

There is a special account intercompany account.

Why?

Because this scenario is not really a sale.

It's an intra company transfer of goods.

So it's not the cost of goods sold.

Instead, it's the cost of goods transferred.

So there are many other movement types.

But for now, just remember these three scenarios.

There are around 900 plus movement types that SAP delivers right out of the box.

Not all of them are relevant for us.

But you understand the picture, right?

Whenever there is a change in the value of goods, it needs to be documented in the system and accounted

for using the GL accounts as usual.

And the key for this is the movement type.

Long story.

Right now we understand movement types, but does this have anything to do with scheduling category?

Why associate the movement type to the schedule line category?

So take an order or it has a line item and say it has a line item, Category ten and it has a schedule

and category CP to CP.

Say we have assigned a movement type 601.

Now let's try and deliver this order.

Where is the 601 used?

We know that the movement type is associated with the schedule and category, but where is it used?

Let's do a quick hands on.

I'm creating an order.

A simple standard order.

What is the schedule line?

CP?

How did I go here?

Go to the line item and click on this button or you can just double click on the line item and go to

the schedule lines tab.

As simple as that.

Now let's try and deliver this to the picking.

I know I'm doing a lot of steps here, but these are steps that you already know how to do the picking,

how to do the transfer order and all that.

Why are we doing a transfer order again?

Because this line item is relevant for transfer order.

Saving the transfer order and opening the delivery again in change mode or display mode.

And you can see that the goods have already been picked.

Now all you have to do is do a PGI.

PGI is done.

Now let's again go back to the delivery and change your display mode and look at the document flow.

This is the goods issue document.

Select that row and click on display document.

Look at the movement type here.

It's 601.

You understand the link now?

We have created an order with a standard schedule line that has a movement type of 601.

And we have delivered it and PGI did.

And the PGI uses this movement type.

This is where the movement type that you have configured in the schedule line fits in.

The movement type that you have configured in the schedule line is used when the corresponding delivery

is PG ide.

Why?

Because that's where the change of value is happening.

# 