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

# 53. 3rd Party Scenario

What is the next control we talked about?

Order type.

Item Category and account Assignment Category.

We don't have to understand about configuring these entries.

But what we have to understand here is the order type here.

It's not a sales order.

It's a purchase order type.

That's why I said we don't configure it.

Consultants configure it.

We just use it.

But what exactly is the business scenario here?

This scenario is called third party drop ship.

What is the third party dropship scenario?

Let's take an example.

There is an order coming in.

In the US company code and that product is not here.

What do you do?

You just say to the customer that the product is not there and we'll get for you somehow in, say,

ten days.

But the customer needs it right away.

What do you do in that case?

You don't want to lose the customer, right?

You just say, give me three days.

Say I'll deliver it somehow.

Say, today is the third.

And you promised delivery by the sixth.

But you don't have the material.

What do you do?

How do you get it?

Since you are in that industry, you would be knowing a lot of vendors that make the same kind of product.

So will immediately make a bunch of phone calls to these vendors.

Say one of these vendors respond and says that he can ship it to you right away.

You don't want that.

Instead, you ask the vendor to ship the goods directly to some other address.

We don't say that it's our customer.

We just say ship it to this address.

So you take the address from the customer master.

Pass it on to the vendor.

And this guy will ship it directly to the customer.

Look at what is happening here.

This vendor is what we are calling as the third party.

And he is dropping the shipment directly to the customer.

That's why the term third party dropship.

Or you can just call it dropship.

Now, what is the change to the order to cash cycle?

Here the one that we typically know.

For this order.

From our company's perspective, there is or.

There is lf there is F2.

This is our standard cycle, right?

Order will be created for line item ten material M0 one.

Is there a delivery happening?

No.

Directly.

We are going to build the customer who is going to do the delivery.

The vendor will ship the goods directly to the customer.

But we don't care about it as long as it reaches the customer.

We are not bothered about how the goods reaches the customer.

So how is this scenario configured?

Very simple.

Add the line item level instead of ten.

You have to put s t.

A.

S.

This item category is used for third party dropship.

Pass item category will automatically determine a different scheduling category.

Not CP but CS.

And how is CSS configured?

CSS does not have a movement type.

That means for this schedule and category, no movement type is relevant.

So you cannot really do a PGI in the delivery.

But there is something else here that is relevant and that's the order type.

So let's create an order.

Customer 1000 M01.

Quantity one.

Change the item category from ten to Tess and save it.

Let's open the order now and see what's happened.

I'm opening the order again.

Going to line item ten, going to the schedule line because of tasks.

Our schedule in category has been changed.

It's CSS now.

And CSS has triggered what's called as a purchase requisition.

What is a purchase requisition?

It's also called Prec for short.

A purchase requisition is a request to raise a purchase order.

So the purchase requisition will be converted to a purchase order.

By who?

Either the MRP process or the purchasing department.

The pile will be raised with the vendor.

And the vendor will just drop ship the goods to the customer.

That's the configuration behind the third party dropship.

Now, this pool that's created here.

What is created?

So a purchase order will also have a purchase order type.

Just like the way you have a sales order type or or Z or similarly you have a purchase order type.

That purchase order type is defined here in the order type field of the scheduling category.

So NB is actually a purchase order type, not a sales order type.

It's a purchase order type.

Now, don't get confused with the wording here.

Order type.

It's a purchase order type.

What item category to use.

What account assignment category to use will be borrowed from the consultant and plugged in here.

Period.

So we don't worry about how they are configured.

We just borrow them from the consultant and plug them in.

Maybe he doesn't give you B.

He gives you Z and B just use it.

# 54 54. Availability and Transfer of Requirements

The next piece of control in the scheduling category is availability.

Availability is a much broader topic.

But you should just understand some of the basics now.

Availability is the process of checking if the goods are available to be delivered.

That part should be pretty easy to understand, right?

Now, why would anyone check this off?

This availability flag.

Simple in cases like CSS third party.

Availability is not relevant.

We know that we don't have that material, so there's no point in doing an availability check.

This is just one example of a scenario where availability check is turned off.

Other examples are service.

You don't do availability check for service.

Example is a warranty product or even a service product.

There is no point in doing availability on service products.

We'll see.

One more example when we talk about an example at the very end of this section.

But we don't need to understand anything more about availability at this point.

All you need to understand here is that availability check can be turned on or off at the schedule line

category level.

The next piece of configuration is this guy here.

Requirement slash assembly.

Don't worry about assembly.

Let's just look at a requirement.

What is the requirement?

The word requirement here is a shortcut for a much bigger term.

T o r.

It stands for transfer of requirements.

What is the requirement?

Why is it transferred?

Where is it transferred to?

To understand this, we have to understand some of the basics of MRP.

MRP is a very big concept.

Consultant studied.

So we're not worried too much about MRP.

But to get a full picture, we have to understand a little bit about MRP.

MRP stands for material requirement.

Planning.

What materials need to be prepared.

How much of the material needs to be prepared?

Why it needs to be prepared.

These are the questions that works with.

Why does any company prepare or manufacture materials?

Because there is a demand for it.

The word demand can also be called as a requirement.

So these requirements need to be documented.

Where does the requirement for a material come from?

Sales.

Some customer is asking for a particular material via a particular sales order, so as soon as a sales

order is saved, the requirement get transferred to MRP.

That's one input.

Another input for MRP is historic sales.

Inputs from historic sales also go to MRP.

For example, let's say Apple is launching iPhone five.

When the launching iPhone five, how many of those should be manufactured per month?

They should have some kind of an estimate, right?

They just can't manufacture 10 million iPhones at the same time.

They cannot afford to manufacture just a thousand of them.

So how do we get to that reasonable number that they should manufacture?

Simple.

They get it from history.

Historic sales.

Okay, So iPhone four is how many did we manufacture for the launch?

We manufactured, say, 3 million.

So add buffer to it, say 25%, maybe manufactured, 3.5 million or 4 million for the launch.

But going forward on a day to day basis, how many should be manufactured per month?

Maybe not 4 million, maybe 1 million a month.

But we cannot just keep manufacturing 1 million a month, right.

We have to also consider the current demand.

And that input comes from the current sales.

So in the last month there was a total of 0.75 million in sales.

Then are we right in manufacturing a million per month?

Let's see for one more month.

So the next one there is only 0.65 million.

Whoa.

Something is wrong.

Maybe we need to cut down on the production.

Go back to 0.9 million.

Probably.

The next month, the sales rose to 0.9 million.

Maybe it's a holiday season.

The point being the process has to consider inputs from a variety of different sources to really understand

how much can be manufactured or even procured.

The key inputs being historic sales.

And current sales.

Now that's about the inputs.

What about the outputs?

What are the outputs of MRP?

Mainly two outputs.

Purchase, requisition and planned orders.

It can generate purchase orders.

It can only generate purchase requisitions.

Pyrex or purchase requisitions are a precursor to purchase order.

They have to be manually or automatically converted to purchase order.

Who does that?

Typically somebody from the purchasing department.

Once a purchase order is ready, it will be sent to the vendor.

And the vendor will procure the material for us.

Now, what's a planned order?

A planned order.

Similar to a purchase requisition is a precursor to production order.

What is a production order?

A production order is an instruction to the shop floor to manufacture goods.

If we are Honda, the car manufacturer, and if we have a planned order, it means we plan to manufacture,

say, a Honda Accord with these particular specifications.

And that will be converted to a production order by somebody in the production department who understands

their system well.

So so overall, you understand the inputs to the MRP and you also understand the outputs to MRP.

Now, what is a transfer of requirement?

Every sales order transfers requirements to MRP.

The user who created the order would not know anything about it.

As soon as the sales order is saved, a requirement will be transferred to MRP.

If you want to really see the requirement that's transferred, I'll give you an example.

Let's take a standard order, some quantity.

Say M01, say 27.

Save it.

And the order number is 13404.

Now go to the transaction.

MD04.

That's where you can see the requirements that have been transferred to MRP.

Now, remember, these requirements have just been transferred to MRP.

MRP has not yet taken any action on it.

Just a raw list of requirements.

When the process runs, it will look at all the requirements, analyze them, summarize them, compare

with historic requirements, basically do a whole bunch of logic.

We're not bothered about that.

But just remember that the list of sales requirements that we have transferred to MRP can be seen in

MD04.

Here you can see which element has triggered each of these rows.

Is it a delivery?

Is it a purchase order and how much did each element transfer?

This keeps scrolling down.

Here is your order.

13404.

Line item ten.

Has triggered a quantity of 27.

That's why I entered an easy to remember number 27.

Instead of 1 or 10.

So we can easily track it here.

Now the process knows that there is an order for M0, one for a quantity of 27.

And what action he takes, we don't care.

Our duty as an SD consultant is to ensure that the sales requirements are transferred to MRP.

This happens behind the scenes without the intervention of the user.

Because we have turned on the requirements flag here in the schedule line category.

Just turning it on is enough to transfer the requirement to.

There are other pieces of configuration that control how it should be transferred.

You know, if there should be transferred individually or collectively, so on and so forth.

We're not worried about it at this point.

So for now, just understand four things.

What is the requirement?

Why requirements need to be transferred to.

How requirements are transferred to MRP.

How to view the requirements transfer to MRP.

That's it.