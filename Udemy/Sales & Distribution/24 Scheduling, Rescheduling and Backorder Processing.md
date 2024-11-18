# 114. Scheduling + notes

Okay.

This topic is about scheduling.

Now, don't confuse this with rescheduling.

Rescheduling is its own topic.

And it has got its own significance.

Although some of the topics in scheduling and rescheduling overlap.

This is a different topic.

And rescheduling is a different topic.

So what is scheduling?

On how many types of scheduling are there.

And what does SAP follow?

And where are the different parameters set?

So if we're going to talk about these things.

In this session.

Let's take a simple order.

Say a customer, 1400 comes in.

And he orders a material M0 one.

Say some quantity.

100.

Apart from pricing and other checks that happen at the line item.

One of them.

Is called.

Availability check.

Weather availability check should happen or not is controlled at many levels.

So one of the levels in the material master.

Where a field controls whether availability checks should happen or not.

The second level of control is scheduling.

So these are the two major triggering points.

One is the parameter of the material master level.

And the second is the parameter of the scheduling category.

So some examples of materials that do not require availability, check or service items.

Or materials with fixed capacity.

Now, in the first case, there is no availability check because it's service.

In the second case.

There is no availability check because there is a fixed demand and supply.

The customer knows what he's going to get.

And the manufacturer knows what he's going to manufacture.

Well, this is a very rare scenario.

It happens in certain cases, but we're not going to bother about that.

Again, service is another scenario where the availability check need not happen because for service

there is no physical deliverables, right?

So there is no need for availability check.

So once the system has decided that the availability check at the line item has to happen.

Well, there are two ways in which availability check can be done, or rather we can put it in this

way.

Once the system determines.

That the availability check at the line item needs to be done.

Then the system verifies if there is stock.

But let's not go into too much details of the availability check of the system in terms of how it checks

and stuff like that.

Say a quantity of 100 is required.

Okay.

So the first thing is do we have the quantity in the plant or warehouse?

If it is there in the warehouse, then the system commits to a date.

This date could be based on a variety of parameters.

We're not going to bother too much about the parameters at this point.

In this section.

But we're only going to focus on if a date is committed to or not.

Meaning let's say today is October 31st.

So if you place this order for a quantity of 100.

On October 31st.

Even though the stock is available.

The system might say, I'm going to deliver this product to the customer by November 10th.

We have the stock available.

Why is the system proposing a date of November 10th, although today is October 31st.

This is one of the key things that we'll see as we proceed further.

The next scenario is, let's say the stock is not available.

What happens in this case.

In this case, the system looks at what's called as a strategy in the material master.

This comes from the Material Master.

So what is strategy?

In very simple words.

Strategy.

Says if you are procuring it or producing it.

In the material master, there is a field called procurement type.

This field dictates whether procurement is external or internal.

If it is internal, that means it's manufactured.

Then we need how much time is required to manufacture or produce the goods.

That's called the production time.

Or production lead time.

The time it takes to produce that material is the production lead time.

So again, we'll look at more details of the production timeline and so on.

Now, the third scenario is external procurement.

So either we produce the goods in-house or we procure them from vendor in case the goods are procured

from vendor.

So either we produce the goods in-house or we procure them from the vendor.

So in case we produce sorry, In case we procure the goods from the vendor.

Then the vendor takes some time to deliver the goods, right?

And that time.

It's called the procurement lead time.

So these are some of the lead times that need to be considered under scheduling.

Now let's go into the details of how the system calculates this different lead times and where they

are stored.

So how are these dates determined?

In scheduling.

In order to arrive at the final delivery date.

So based on different scenarios, either internal or external.

There are five lead times that need to be considered.

What are these lead times?

Transit time.

Loading time.

Picking time.

Packing time and transportation lead time.

So these five lead times or processing times are required to arrive at the delivery date.

So how do you maintain them?

Well, history.

You look at the history, say historically it took two days to load a particular quantity.

So to load this amount of quantity or to load goods in this plant, this is the amount of duration that

is required.

So you look at history to arrive at what these lead times are in a more accurate way.

So let's say the plant is in Chicago.

On the customer is a New York.

So the warehouse manager or the delivery manager or the person who looks at the delivery.

Might know how long it takes to transport goods from Chicago to New York.

And that's what I meant by history.

So depending on the history, these times are calculated and then recalculated again and then put back

in the system so that the system is made aware of how long each of these lead times are in different

situations.

Like how long it takes to load the goods.

How long it takes to deliver the goods.

All this is based on history and experience.

Now, let's start from the beginning.

Starting with order intake.

Let's say August 1st.

August 1st, the customer has placed an order for a material of quantity.

Five.

We'll say within five days the material will be available.

It need not always be five.

It can be zero also.

It will be zero in case the materials are readily available in stock.

Right?

The goods are not available.

Then there is a week of time to procure the goods based on availability, and that's the lead time.

We'll discuss that in a different session.

But once the material is available on August 6th.

At that point, the scheduling starts.

So we talked about picking time.

How long it takes to pick the goods.

Packing time.

How long it takes to pack the goods.

So if we consider each as a milestone, the first milestone, second milestone, third.

Fourth.

Fifth milestone.

If we add picking and packing to the first milestone, then you arrive at the third milestone.

If we add the transportation lead time, that's the time taken to get the truck ready.

Just to get ready not to load.

Because for an order you might require five trucks and five trucks might not be readily available.

Right.

So the transportation lead time is the time it takes to get the truck ready.

So when you add the transportation lead time to this milestone, you get the loading date.

So the material is available, the transport has been planned and now comes the loading time.

What is the date on which you start the loading?

Let's say it takes one day lead time to load the material that is from August 9th to August 10th.

So August 10th is your goods issue date.

That's the next milestone.

So let's let's say it takes five days for the goods to reach from the warehouse to the customer.

On the delivery date.

So if you start on August 1st, add five days to make the material available.

Add three days for getting the truck ready.

One day for picking and packing, whichever is greater.

The system picks the greater one and determines the loading date.

And finally, the goods issue date we come at by adding the loading date.

To the goods issue date and after the goods are issued, there is a transit time, right?

The time it takes for the goods to reach the customer.

And once you add that as well, you determine the delivery date.

So you add all these dates together and finally you get an actual delivery date.

So to determine the actual delivery date in between, we have so many dates, right?

We add picking and packing together to get the goods issue date.

So on and so forth.

So this is how the system determines the actual delivery date.

There are different dates, right?

For example, picking and packing is one date.

If we go to the shipping point configuration, we can maintain the picking and packing and loading time.

Next.

Where is the transportation lead time.

You can go to the root determination in Sbarro sales and distribution, basic functions, root determination.

If you go to the definition of root, we see the transportation lead time there.

Next is Factory calendar.

What is a factory calendar?

The factory calendar is used to identify the holidays.

And working days of a logistics provider.

So if you're providing transportation, you need to know the holidays and working days to calculate

the lead time or the transportation lead time.

That is the total time that determines the transportation time.

You have to include holidays, right?

That has to be part of your planning.

Similar to the transportation lead time.

There is also something called as transit time.

So if you want to identify that, look at the scheduling line in the order.

And select the shipping tab.

We can see all the different dates and times like picking time, loading time, transportation, time,

goods, issue time.

All these milestones are here.

Now let's talk about the different kinds of scheduling or different types of scheduling.

What are they?

There are two types of scheduling.

Backward scheduling and forward scheduling.

Now what is backward scheduling and forward scheduling and when do we use each of these?

Let's say the customer, um, requires the goods by 31st August.

So this is our starting point.

31st August.

And from that point on, we calculate backward.

That is backward scheduling.

So from August 31st, the transit time, let's say the transit time is five days.

So August 31st, minus five days is 25 or 20 sixth, which is the goods issue date.

So goods has to be issued on the 25th or the 26th because it takes five days of transit time to reach

the customer.

So on 26th August, we need to issue the goods.

So the goods issue is to happen on the 26th.

Then probably we have to have one day for loading, right?

Assume there is a loading time of one day.

So subtract one day that takes you back to 25th of August.

That will be the loading date.

So 25th of August is the loading date.

One day for loading 26th and 26th plus transit time.

Five days is 31st August.

Right.

So you are going back step by step, using the different times to arrive at the different milestones.

So the transportation lead time is five days.

Subtract that you go to 20th of August.

And finally you have the material availability date.

Okay.

Now the system has to make a decision by subtracting the different dates.

You subtract all of this, so on and so forth.

And at this time, the system has to make a decision.

If the material is not available on that date.

That is the 20th of August.

Then the system switches to forward scheduling.

So by default, the system does the backward scheduling.

And when it arrives at the availability date.

If the goods are not available by that date, the system switches to forward scheduling.

Forward scheduling.

What is forward scheduling?

Now in backward scheduling, we start with the target date.

When does the customer needs the goods by?

In forward scheduling.

We start with the availability date.

So we have to anyway deliver the goods, right?

So the goods are not available on this date.

So first determine when the goods are available by.

So if the ordering date is 5th January, let's say it takes five days for the goods to be available.

So five 5th January plus five days is 10th, January is the availability date.

Picking time is, let's say two days.

So 10th January plus two days, 12th January, and then the transportation time, so on and so forth,

loading time of five days and ten days for delivery.

So the delivery date is 30th January.

That is for scheduling.

So from the ordering date of fifth, you add the different lead times.

Starting with availability.

Picking, packing, transportation, lead time, loading time, transit time.

You arrive at a final date.

That's called forward scheduling.

So by default, this is probably a simple interview question.

What is backward scheduling, what is forward scheduling, and what's the default setting in SAP?

So by default.

The system does backward scheduling first.

Depending upon the customer delivery date.

Now, if the availability fails, that's when the system switches to forward scheduling.

# 115. What is a Backorder ?

In this section, we are going to discuss two topics backorder processing and rescheduling.

So what is a back order?

Let's say the customer has placed an order for a quantity of ten to be delivered within a week.

Say we don't have that stock.

We have the stock available in the second week.

What happens now?

A new delivery date will be calculated.

Say two weeks from now when the goods will be available.

And the new schedule line will be created for the second week.

An order where the delivery date specified by the customer could not be met.

Instead, the system proposes a new date.

What is the big deal?

Well in order to understand what the big deal is about.

We have to understand a couple of things.

First off, what is a requirement?

Then mean requirements.

I'm talking about sales requirements.

And then we have to understand how we can view the requirements in.

And finally, is there a way to manually manipulate these requirements?

So let's create an order.

And see an example all the way from the beginning.

Order type or.

Sales area.

1010 zero zero.

Some customer and some material.

Let's put a weird quantity.

Say 53.

Just so that we can refer back to it and remember that number later when we see the requirement list.

Now go to schedule lines and check that the schedule line is confirmed.

It is confirmed.

So go back now and save the order.

What is the order number?

13603.

Go to transaction MD 04MD04.

What is the material?

Material.

M0 one.

And what's the plan?

We have placed the order for.

1200.

The list that you see here, the big list, it is the list of all the elements associated with this

material for the plant.

1200.

In this case, it's a list of order numbers.

Do you see them?

Order number.

Line item.

Any order for a physical.

Goods will transfer the requirements to MRP.

What does the requirement look like?

This is what the requirement looks like.

There is a requirement for this material.

On this date.

And against what?

This order number and of course, this line item.

And how much is that for?

When you double click each of these line items.

You see the type of requirement?

Do you see that?

Sale from stock.

Now.

What was the original order?

13603.

Keep scrolling through these requirements and you should be able to see it.

You see, this is the one.

13603.

And what's the quantity?

53.

Line number 100.

This is an example of a requirement.

MRP would work on requirements from this list.

This entire list that you see here.

Is all the list of requirements for this material.

M01.

We are only talking about one material.

So far has not been run for this material.

So that's why you see such a huge list.

All the orders created for zero one.

Once MRP has picked up a requirement and processed it.

It would be gone from this list.

We're not worried about running.

Why?

Because it's not an easy thing.

If you are learning or especially production planning, that's when you would learn more about how to

run it, run it for single material, multiple material.

ET cetera.

ET cetera.

All we have to do as consultants is to understand that there is a process called MRP.

And it would work on requirements from MD zero for the requirement list.

And this is how a sales requirement would look like.

Now, what if some of the quantity is not available?

That's when the system goes on a back order, right?

That was the very first thing that we understood.

When some or all of the quantity that is scheduled for a later date than what the customer has asked

for, that's called a back order.

There are situations where this process would require manual intervention.

We will talk about them now.

One situation could be like this.

Say there is a stock of 100.

Of material M01.

So there is an order 13603 for a quantity of 53.

As soon as this order is placed.

The first thing is the requirement is passed on to MRP and you can view it in md0 for.

The second thing is, out of the available stock of 100, the quantity of 53 will be reserved.

Stock is reserved.

So subtract 53 and the available stock now becomes 47.

To this quantity.

47 now is also called unrestricted stock.

Meaning something that's readily available for the next customer.

# 116. What is Rescheduling ?

Now think about scenarios like this.

Another order 13064.

Previously it was six three.

Now it is six four.

Comes in.

For a quantity of, say, 100.

And what happens now?

There is only a quantity of 47 that's available, right?

So SAP will split up this 100 in the second order.

Into two schedule lines.

Number one, confirming a quantity of 47 because that's already readily available as unrestricted stock.

The second line item or second schedule line item will be created for 53, 100 -47.

And that is for a future date.

Remember our definition.

This type of order is called a back order when some or all of the quantity is not available.

And the system will push the delivery dates to a future date when the stock will become available.

That's called our back order.

So far, so good.

Order is saved.

Save This order is created on November 25th.

On November 26th say some unexpected stock has come in from a vendor, say quantity of 100.

Now on November 26th.

Another order.

13605.

This is the third order.

Okay.

603604605.

The third order is created for a quantity of ten.

What happens now?

Now, some unexpected stock has come in, right?

So no stock has suddenly become available.

Now what happens to the previous order?

The current order will get resolved because there is stock available.

The third order, 13605 will get reserved.

But what about the order created on November 25th, the previous day?

That we have put on back order because the quantity was not available.

Because the quantity was not available the previous day, so it had to go on back order.

The question now is, should this order be given preference here?

Like first come, first serve in in a supermarket queue.

Or will this order?

The order created the next day take over?

What is the system reaction?

Well, it does not bother about the previous day's order.

The cap only looks forward.

Meaning if fresh stock has come in, that is not expected.

Then it will allocate it to future orders only.

By default, it will not bother to look back at all the previous back ordered sales orders.

Remember, this is only the case for unexpected inbound deliveries.

If the same delivery, the delivery that happened on 26th is expected, it would already have been confirmed

for the previous order.

Meaning.

SAP can only play fair.

It does play fair.

But it has to have a knowledge of the incoming stock from the vendor.

If it is unexpected, it doesn't know what to do.

If it is expected it plays fair and allocates it on a first come, first serve basis.

But you might say that's not fair, right?

I agree.

I totally agree.

Irrespective of whether stock is expected or unexpected.

We kind of expect to rejig its requirements and allocate stock based on a first come, first serve basis.

Right.

First come.

First serve basis.

Right.

Can this be achieved?

Yes, this can be achieved.

There is a batch process called rescheduling.

The transaction for this is v underscore v two.

Typically you don't need to worry about the transaction for this because it's always scheduled as a

batch process.

You have a variety of parameters to run this transaction.

Like material.

Plant.

Stock type.

ET cetera.

ET cetera.

The details are not very important here.

What I want you to do is understand.

Just understand the concept behind rescheduling and why rescheduling is used.

The business scenario when rescheduling is used.

Every night rescheduling will be run.

And what does rescheduling do?

When the stock situation changes, it shuffles and sorts the stock with just one goal.

What is it?

Doing justice to older orders, the ones that stood first in the queue.

This is rescheduling.

Now, you might have a question here.

Why am I stressing the fact that this is a batch process?

You can very well run this as a typical transaction, right?

Just to run it.

V underscore V to execute it.

Can you do that?

Technically, you can.

But you don't want to do it.

Why is that?

So what does rescheduling do?

It goes through all the back orders as of a date.

Picks all the orders that have been confirmed after that date.

Check if any new stock that is unexpected has come in and reshuffles them to ensure that older orders

are given preference.

Right.

So imagine a company doing 1000 orders a day.

That's a very modest number.

But still.

Rescheduling on such a small number is a massive load on the system.

Now imagine what it has to go through.

It has to go through a whole bunch of transactions.

And apply all the intelligent logic to come to the conclusion.

What conclusion?

That these older orders need to be confirmed first.

And these newer orders need to be back ordered.

Based on the new stock situation.

Now, you don't want to run this during the day because it places such a huge load on the system.

There's a lot of computation that has to happen.

So depending on the volume, the system might become unresponsive.

So you don't want the users to suffer because of rescheduling.

That's why this is typically done at night as a batch process.

So that was rescheduling.

# 117. How to do Backorder Processing ?

There is another process called backorder processing back order processing.

This one is more of an ad hoc manual step.

Whereby you go and specifically allocate stock to one order allocated to another.

The transaction for this is who we underscore are a.

All you have to do is select the material for which you want to manually do the allocation.

Then select your sales document.

When you do that as a big user, the list of all the bark orders against your selection criteria.

Select the line item you're interested in.

Click on backorders.

What it does is actually open in zero for.

I'll show you the entries in blue.

For example, there is order and order be.

Order B has a confirmed quantity of Tim.

But Order A. was issued yesterday.

And say the same quantity 10 was backordered because stock was not available as of yesterday.

Rescheduling typically correct this problem, so if order be the new order was wrongly allocated to

stock, but say, for example, if you're not satisfied with the way rescheduling was run.

Or for some reason, you want to manually adjust the stock allocation.

Like in this case, I look at the quantity of men from order be to order a.

You go to wielders Corradi, select your material.

So let both these orders are in order and then execute.

We'll take you to Embley 04 and then highlight what disorders, not when you select that element, click

on Change Confirmation.

Which order would you select?

Order be allocated and order is not right.

This is what you want to change, so you first select Order B because that's the one that has been confirmed

and click on change confirmation.

OK.

And then you can change the confirmed quantity.

For example, you take Urbik and it has an allocated quantity of paint, you can reduce the quantity

to any number you like.

How do you do that?

You put a new confirmed quantity in this field.

Say, for example, you want to reduce the allocation from 10 to five.

Once you release the quantity of fire from B, it will go to the general pool.

Once it goes into the general pool.

Then you have to open the other order, Audrey.

And allocate that stock based on the quantity available in the general.

There are so many options available in the back of the processing screen.

I don't want you to really focus on all options, you just focus on one thing.

Stock allocated are confirmed for one order.

Can we be allocated and brought back to unrestricted stock?

Or stock available in nondestructive stock can be reallocated to a sales order that's backordered.

# 118. Summary of Backorder Processing and Rescheduling

Overall, though.

Understand the basics of these two processes.

BackOrder processing and rescheduling.

Understand the differences between them.

Understand when each of them should be used.

This scheduling is an automatic nightly batch process.

That automatically allocates and deallocates stock from orders based on priority.

Back order processing is an ad hoc manual process.

It can also allocate and deallocate stock from sales orders based on the available quantity.

For example, you want to allocate more stock to Walmart or Walmart's orders than some other customer

X, y, z.

Customer.

Take all the orders for the other customer.

Deallocate however much you want to reassign to Walmart.

And this puts the stock back into the general unrestricted pool.

Then pull up the Walmart orders.

The unallocated orders.

They can now be allocated more stock based on the new availability situation after the reshuffle of

orders from the other customer.

Once again, don't focus too much on the steps listed here.

Just focus on the concepts.

What each of these processes does.

Which one is a manual process and which one is a batch process.

And what happens in either of these processes.

It's a very mechanical business process.

Only the users who work on this on a daily basis would understand this business process better.

Even the users would take some time to understand how to really reshuffle stock and all the business

processes that we have discussed just now.

And to get accustomed to these transactions and screens.

It takes some time.

The users typically understand the stock situation better.

They would have a better idea basically on how to play with stock like this.

Since you're just starting off in SD.

Don't worry about actually doing them in the system.

Just focus on the concepts.

And that is more than enough.