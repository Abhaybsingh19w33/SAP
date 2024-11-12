# 63. Introduction to Pricing and Condition technique

In this chapter.

We are going to learn about pricing.

This is a very important topic.

The techniques that we are going to learn here.

They're used across a wide variety of configuration in SD.

The way we are going to discuss pricing.

Is as follows.

Number one.

The theory behind pricing.

Number two condition technique.

This is the core technique behind pricing.

And I like I said before, this particular piece of configuration is used across many other determinations

in SD.

So please focus on these areas.

Theory as well as the condition technique.

Let's start with the theory behind pricing.

What is pricing?

Pricing is the configuration in SD, the takes care of how the prices are pulled up automatically by

SAP when you create an order or when you create an invoice.

Let's take some examples.

Take Del.

You go to Dell.com and start to configure a PC.

Say the price of the PC is $500.

So based on the configuration you select.

Somebody behind the scenes in Dell must have configured the system in such a way that for this pricing

configuration, the correct price of 500 is pulled.

And let's say you go to a deal site and get a $50 coupon.

You go back to Dell and apply the coupon and you get the $50 discount.

The net now is $450, 500 -50.

Again, somebody at Dell must have configured the system in such a way that when you apply the coupon,

it automatically gives the $50 discount, say the coupon is valid for a month from Jan first to Feb

first.

Now say you are in a state where taxes are applicable.

So on top of this, when you mention your zip code, your shipping location will determine the taxes

that applies to this particular situation.

For example, if you are shipping to New Jersey, New Jersey has 9% sales tax or say, 10% tax.

That comes to $45.

What's the total now?

$495.

Again who has configured Dell's ASAP system.

When you specify New Jersey, 10% tax will be applied.

Now, I'm assuming that Dell uses SAP.

It's just an assumption.

How about fried?

Say the total weight of the PC is £10, including the packaging and whatnot.

For £10 of shipment.

There will be a certain freight charge.

The freight charge works something like this.

0 to £5.

$20.

5 to £10.

$40.

So in our case, the freight charges will be 40.

The total now comes to 535.

Again who has configured Dell's SAP system that when a way to the package is £10, the freight charges

will be 40 overall.

What are we seeing here?

Nobody is entering the price of the PC.

It comes up automatically when you enter the coupon.

The discount comes up automatically based on the zip code.

The taxes are determined automatically based on the weight.

The fight is determined automatically.

This is what happens in real time, right?

You go to Amazon.com.

Dell.com zero one.

It's all the same.

You as an SD consultant is responsible for configuring this.

What we are seeing here is the end result.

The end result of how pricing is computed in SAP.

What we are going to learn though, is how this is configured.

This is just a very, very basic scenario.

Pricing could get pretty, pretty complicated.

For example, the price of $500 could be based on what?

Many different factors.

Or even the type of discounts that are given, they could be based on coupons.

They could be based on customer groups.

For example, if you have a triple A membership, you could get 10% discount on Hertz car rentals,

right?

Our government, customers or military customers could have a special deal or discount based on the

GSA code.

General Services agreement or in some cases, the more you buy, the more you get discounts, right?

It's called scale based discount, meaning if you buy a quantity of 100, you get a discount of 10%.

If you buy 150, you get 15%.

Or sometimes the discount could be cumulative.

Since the 1st of January.

The more you buy, the deeper discounts you get.

Example as of June, you have purchased $100,000 worth of goods from the company.

Because of that, you get categorized into tiers.

Tier one gets 15%.

Tier two gets 17%.

Tier three gets 20%.

And so on.

The point being, the way discounts are given, the way pricing is done, the way taxes are computed,

the way fright is computed, the parameters based on which you compute.

This is totally dependent on the nature of the business.

It's how their marketing team comes up with pricing gimmicks.

To, of course, suit their company's requirement.

We don't have any control over that.

So how can SAP handle all these scenarios?

In fact, ASAP did not have a way to do this.

Prior to the early 90s before condition technique came into ACP.

SAP did not have a way to do this in a controlled and, you know, configurable manner.

One customer of SAP.

I hope you know this company, Unilever in London.

It has implemented pricing in a customized way using a bunch of customized Z tables and code.

Unilever being a retailer had a whole host of pricing scenarios, deals, promotions, so many different

kinds of discounts.

SAP at that point did not have a way in which all of this complexity can be built into the system.

So they developed their own customization to deal with these pricing problems.

And when SAP went in, they liked it so much that they eventually bought it back into SAP, including

all the royalties.

It was implemented in the standard SAP product and it's called condition technique.

That's what we are going to learn in this section.

And the essence of condition technique is how to configure all the complex scenarios in pricing without

having to write a single line of code.

Well, we might have to write some code here and there, depending on the nature of the problem, but

for the most part, many problems in scenarios in pricing can be solved and configured in SFP.

Just using configuration.

That's the beauty of condition technique.

# 64. Condition Technique - Field Catalog

So what is this condition technique?

Condition technique.

Consists of seven steps.

What are these?

Seven steps.

The first step is the field catalog.

Let's take a problem and discuss condition technique in parallel.

The same del same PC.

Say we are pricing the product.

Based on the material and customer group.

So the product we are going to price is Del 101 and the base price for the product as soon as the material

is created, generally a base price will be created.

It's just a fancy word for the material list price.

So this PCR material, Del 101 because so much, say $500.

There could be many variations that we have discussed the same material.

If you are selling to a corporate customer, say an investment bank like JP Morgan, it could cost 450.

If you are selling to the government, it could cost 455.

The same material to military could cause so much the same material to a distributor could cause 400.

The same material to a reseller could cost a different price.

All of this could be generalized as customer group based pricing.

Now, I hope you understand why we are giving the same material at different prices to different customer

groups.

It's all based on the market conditions, customer segmentation, targeting the needs of the customers.

For example, distributors can give a huge market to penetrate.

So you have to give it give it to them at a lower price.

Retailers are sold at a different price.

Corporate customers get a moderate price.

You cannot sell the same product for the same price in all the channels.

Yes, there are some exceptions like Apple.

It's almost the same price for a broad range of customers.

Right?

iPod is 99 on Apple.com or Amazon or any other channel, but it's more of an exception.

Most companies have different prices across different channels.

What we are going to do here is think about a customer group based pricing and configure the steps.

Well, at least in theory.

Coming back to the condition technique.

The first step is the field catalog.

What is a field catalog?

A field catalog is a set of fields that can be used to do pricing, discounts, taxes, or anything

you do in pricing.

Examples of fields could be material, material, group, customer, customer group, so on and so forth.

There are close to 200 different fields that are provided by SAP right out of the box.

In this case of Del.

This is a material.

This is a customer group.

So feel catalog is the list of fields that can be used as the base for pricing.

Now, when I mean pricing, it's a generic statement.

It could mean price.

Discount.

Tax surcharge, freight, any of these, you could base your freight, for example, on customer group.

You could be doing, um, pricing based on customer group.

You could be doing taxes based on customer group.

For example, government customers get a different tax, basically no tax right now.

You don't need to use all the 200 fields.

You just need to pick the right fields from the list of available fields, and that is the field catalog.

# 65. Condition Technique - Condition Tables

The second step condition table.

What is a condition table?

A condition table is a database table.

It comprises of one or more than one field from the field catalog.

In this case, the condition table will comprise of material and customer group.

That's it.

That's a condition table right there.

Very simple, isn't it?

The field catalog is a list of fields.

The condition table is a subset of the fields from the field catalog.

A small subset.

Which will basically comprise of the required fields for that particular scenario.

In this scenario, we're just using two fields material, customer group.

# 66. Condition Technique - Access Sequence

Step three is access sequence.

What is an access sequence?

The sequence in which the condition tables need to be accessed.

To understand this.

Let's complicate the problem.

Say there is a base price, which means the material costs $500 without any other complications.

But if you sell it to a government, it costs you so much.

If you sell it to a reseller, it's going to cost you so much.

So on and so forth.

Similarly, you could complicate it further.

The same material if you're selling to corporate through a distributor.

This is the distribution channel.

You can sell directly to a corporate.

The price is 350.

But if you are selling direct to a corporate, it's 300.

This right here is not a customer group.

This is the distribution channel enterprise structure element, not customer group.

How can we configure this?

In this case, we will be creating two condition tables.

One based on customer group and material, and the other is material plus customer group plus distribution

channel.

The distribution channel will be one of the parameters in the field catalog.

So you pick this, this and this.

You create two condition tables.

So two condition tables, one with material, customer group and second material, customer group and

distribution channel combination.

The next question becomes which one do you prefer first?

The first table or the second?

Typically the more involved the scenario is, the higher the preference.

If it fails, you default to this.

An access sequence does exactly this.

This is condition table one.

This is condition.

Table two.

Two will be given first preference.

And if two fails.

Meaning if you're not selling via a distributor or a direct, then default to one.

So an access sequence is the sequence in which the condition tables are accessed.

As an consultant, based on the business requirements, you configure the sequence in which the condition

tables would be accessed.

# 67. Condition Technique - Condition Type

Number four is condition type.

Condition type represents the type of computation.

We can do so many things based on customer, group and material.

Using the same combination, we can calculate price, we can do discounts, we can do taxes, surcharges,

any of these.

Up until step number three, we are only defining the basis.

Meaning based on what parameters.

And in what order we are going to compute something, but we never said what we are going to compute.

Are we going to compute pricing?

Are we going to compute a discount, a tax freight surcharge?

We never said that.

For example, in discounts we can have dollar discounts.

Dollar discounts mean I'm going to give you $10 discount.

So irrespective or you can give a ten percentage discount.

Both are completely different things.

Both are discounts.

All right.

But the way they are computed is different.

If you want an example, out of $500, if you give $10 discount.

Your price is 500 minus ten for 90.

If you give a 10% discount, your price is going to be 450, 500 -10% of 554 50.

Who decides if you are going to give a percentage discount or a dollar discount?

The business will decide it.

And you, the consultant, will configure it via the condition type.

Same with pricing.

You could have different kinds of pricing.

You could have pricing based on quantity pricing based on time period like $30 an hour, $10,000 a month.

Same with freight.

Most people get confused here between condition table and condition type.

What is the difference between condition table and condition type?

Condition table determines the parameters based on which we are going to compute the price.

Once the parameters are determined in the condition table.

Condition type just dictates how exactly the price is calculated.

Is it based on percentage?

Is it based on volume?

Is it based on dollar value?

Time based.

So on and so forth.

When we do a hands on, we will understand this much better.

# 68. Condition Technique - Pricing Procedure & Determination

Step number five is pricing procedure.

What is pricing procedure?

I call it the big bang.

Where all the condition types come together.

Now if you go through our scenario in a pricing procedure.

Typically pricing comes first.

After that comes discounts. 

After the tax.

After that fright.

And after that surcharge.

This is how pricing is done.

First, you have different pricing conditions.

Then you have different kinds of discounts.

Not all of them might apply, but some of them will apply and some will not.

Same with tax, freight or surcharge.

All of them will put them in a sequence.

One, two, three, four, five.

And that is a pricing procedure.

A pricing procedure is where many different pricing conditions will be put together in a sequence to

compute the final price.

Number six is pricing procedure determination.

When you go to zero one.

You just enter the order type customer and materials.

Pricing comes up automatically, right?

You don't have to pick anything related to pricing manually.

So what is the basis on which SAP picks up pricing?

The pricing procedure determination is based on three parameters.

Sales area.

Document pricing Procedure.

Customer pricing procedure.

What is this document pricing procedure?

This comes from the sales document type configuration.

And this customer pricing procedure comes from the customer master sales view.

Why is it configured like that?

Well, this is the standard way of determining a pricing procedure.

But.

Why?

Why this logic?

Why does SAP allow us to determine the pricing procedure this way?

Basically, SAP is giving us the flexibility to determine pricing based on these parameters.

For example, sales area.

That means typically by country.

So you can have different pricing procedures by country.

Us can have its own pricing procedure.

Germany can have its own.

India is different.

Japan is different.

They can have their own.

And.

You can have different pricing procedures by business process, not just by country sales area.

But I mean, business process.

We're talking about document type, you see, or.

Can have a different pricing procedure.

Rush order can have a different pricing procedure.

Cash sales can have a different pricing procedure, contract scheduling, agreements, consignments.

They can all have their own different pricing procedures.

When I say they can have it, need not always be.

A sap is just giving us the provision to have your own pricing procedures by document, by customer,

by country, by sales.

Org.

So I said document pricing procedure plays a role by based on the business process.

Similarly, customers also play a role.

Government customers, they can have their own pricing procedures.

Corporate customers, they can have their own so on and so forth.

So customer plays a role.

Business process plays a role.

Sales area plays a role.

All these three parameters put together can be used in any combination to determine your pricing procedure.

# 69. Condition Technique - Condition Records

Number seven.

Is not configuration.

It's a user step.

It's called condition record.

Everything that you do until step number six.

Is all done in Sbarro.

They're all configuration steps.

But step seven is easy access.

The business users do it themselves.

What do they do there?

They maintain the actual prices, for example, until step number six.

We never mentioned a value.

Meaning we never said the discount is going to be 6% or $60 or the pricing is going to be $400.

For example, we are only saying that price is going to be based on the customer material combination

or customer group combination.

Discounts are based on customer group material distribution channel combination.

Meaning we are only determining the basis.

We don't specify the actual value until step number six.

They configure the system, give it to the business.

They determine the actual price.

The actual discount percentage.

And they do it where in step number seven condition records.

# 70. Configuration Walk through - 1

You can configure pricing at Sbarro.

IMG.

Sales and distribution.

Basic functions.

Pricing.

Pricing control.

This is where you have all the configuration for the entire condition technique.

But I don't go there.

I use an area menu.

V oq0.

It's an old transaction, but you can do everything here that you can do in pricing control.

So either way it's fine.

You could do one of both.

So I'm going to use zero because it saves me time because, you know, we do it again and again and

again.

So instead of going to the menu path, I use this transaction and everything related to pricing is here.

So go to zero and you get a blank screen like this.

And everything you need is here.

Where?

In the menus.

The first thing that we want to do is step number one field catalog, right?

In this chapter, we're not going to solve the problems that we discussed, the Dell problem or whatever,

as a first pass.

We are just going to see the configuration.

Just an overview.

In the next chapters, when we do a hands on, we'll actually solve a problem.

We'll create a condition table, we'll create a condition type, we'll create our own access sequence.

But for now, we'll just see what these things are.

It's more or less a walkthrough of the configuration.

So to get to the field catalog, go to environment condition table.

Field catalog.

What is a field catalog?

How does it look like?

It looks like this.

See, I told you there are 200 odd fields there.

Right?

These are the fields provided by SCP.

City Company Code Country Order.

Region Sales Document Type.

Customer.

Customer Hierarchy Incoterms.

You can have your pricing discounts or taxes, anything based on these fields.

The amount of flexibility that condition technique gives you is enormous.

You just don't feel that yet.

When you start facing the scenarios in real time, you will feel the flexibility that condition technique

gives you.

Anything that's in the field catalog.

Field catalog is a list of fields that can be used as the basis for pricing.

Once again, when I mean pricing, I'm just using it as a generic word.

It could mean price discounts, taxes, surcharges or freight any of these.

The next step is the condition table.

We will not create a condition table in this chapter.

Like I said.

But we will see an existing condition table.

We'll create condition tables when we go to the hands on.

A conditioned table is a three digit numeric number.

Starting from one all the way through 9999 like 002004005.

So on until 9999.

The thing that you have to remember here is one through 600.

Are reserved for SAP.

Meaning just like the way anything starts with a through X is configured for SAP only.

So whenever you create your own order type, you use you start either with a Y or with a Z.

Right?

So that's the customer namespace.

Anything before that is SAP namespace.

Similarly, for condition tables, one through 600 is reserved for SAP.

So you cannot create condition tables in that space.

Technically you can, but you're not supposed to.

So what is your namespace?

6012999.

If you want to create your own condition table, sure.

Create it in that namespace.

Let's view a condition table.

If you take, let's say customer material combination 702 enter customer and material combination.

Where do you pull these fields from?

From the field catalog.

The section on the right here is the field catalog.

Now, when you do a hands on, when you do a hands on, we'll see how to pull these fields from the

field catalog.

But for now, just understand that the fields on the left are actually pulled from the field catalog

onto the right.

In this case, there are two fields, customer and material.

And this table.

702.

Is a combination of customer and material.

Again, when we do hands on, we'll see how to generate this table, how to view the technical details,

the description of these fields.

How to cross verify them with the actual technical names.

We'll see all of that in the next set of chapters.

Go back to the third step.

Third step is the access sequence.

Where is the access sequence?

Here.

An access sequence is a sequence in which you put your condition tables together.

An access sequence is set up hierarchically.

If you look here and expand the hierarchy, you see you select the access sequence first and then double

click on access.

And what do we have here?

We have four condition tables,

005007009 and 004.

And they're all put in a sequence.

Ten, 11, 13, 14.

So the first preference is given to this.

So if price is found for customer material, it picks this.

If not, it defaults to division customer.

If not, it defaults to priceless type currency material.

And finally, if nothing is found, defaults to material.

That's an access sequence, right?

It's a sequence in which you put your condition tables for access.

We'll look at fields and the next step in when we do the hands on because we'll have to do the field

mapping and all that stuff.

But for now, just understand that access sequence is the sequence in which you access the condition

tables.

Okay.

The next step is condition type.

A condition type represents the type of calculation, right?

For example, standard condition type is PR zero zero.

If you go to PR zero zero, look at it.

It's associated with an access sequence and it has a condition class.

The calculation type condition category.

What kind of rounding should be applied?

Whether it's a header condition or an item condition, what kind of scales should be used, if at all?

Scale is used.

Can you delete it manually?

Can you enter it manually in the pricing procedure or the sales order?

There are so many controls behind the condition type.

We don't need to go behind all the different things, but just understand that condition type represents

the type of calculation.

Basically there are five different types of condition types.

Prizes.

Discounts.

Taxes, surcharges and freight.

In case you are wondering what other modules use condition Technique.

So in case you are wondering which other modules use the condition Technique module uses the condition

technique.

It's called schema.

It's basically used for purchase price, determination, input, tax determination and all that stuff.

Even CRM module uses it.

So overall, um, as the CRM are the main modules that use the condition technique for pricing.

# 71. Configuration Walk through - 2

Step number five is the pricing procedure.

There are typically defined by country.

For example, RVA01 is a German standard pricing procedure.

If you look at the controls behind it, you see the different pricing condition types all put together

in a particular sequence.

Step number eight through 21 is pricing.

And then we have discounts, sales, promotions, price group based discounts, all different kinds

of discounts.

And the list goes on and on and on.

After that, there is surcharges if we keep scrolling down.

You'll get surcharges like incomplete pallet surcharges, mixed pallet surcharges.

And then we have freight, different kinds of freight could be there header based freight line item

level freight, so on and so forth.

Then there could be taxes.

Of course there are rebates, but we don't care much about rebates in this course.

MWC is an example of a tax condition type.

And finally a total will come up at the very bottom.

This is surprising procedure.

We'll discuss more on this later when we do a hands on in the next set of chapters.

But beyond that, don't worry too much about pricing procedure.

There's there are so many things there, like from two mandatory statistical subtotal requirements,

alternate calculation types, accrual keys, accounting keys, so many different things.

Again, focus only on the fundamentals and we'll discuss all of these things, all these different columns

in the coming chapters of this section.

Before we discuss them, though, we should get a good feel for the condition technique.

So just focus on the condition technique, the sequence and the steps and the logic.

Step number six is the determination.

So how is the determination done?

Determination is based on three parameters sales area.

Document pricing procedure.

And customer pricing procedure.

Where do you see the document pricing procedure?

If you go to any document type, the document pricing procedure is here.

If you go to or cut any document type, you can see the document pricing procedure here.

Where can you see the customer pricing procedure in the customer master?

Where exactly in the sales view?

So go to the sales view of the customer and go to the sales tab and you can find the customer pricing

procedure.

Which is just a fancy word for a single character.

It could be a one, two, three, four, five or a, A, B, C, D, or any special character.

Like an ampersand or a carrot or a dollar.

It just labels a particular customer as relevant for a particular pricing procedure so that when a pricing

procedure is determined.

This parameter from the customer master will be used.

Step number seven is the condition record and.

And like I said, it's a user transaction.

You can go to it via week 11.

The transaction code for it is week 11.

So go to week 11, specify your condition type, say PR zero zero and enter your combination.

Enter the material and say enter a price of $250 for M01.

It could be euros or dollars or whatever the currency is.

So you can create as many pieces of prices as you want.

You can keep going on and on and on based on whatever parameters you want and pricing will be created

in that order.

Where do you see the price?

So go to zero one, enter your order or whatever you want to test and then enter your material.

Say M01 and hit enter and you should see the price where did you get that price from?

Select your line item and then click on this button.

The one that looks like a nickel.

In the next chapters, we'll see how to do a detailed analysis on how these prices come up.

Which condition type was used to arrive at the price, why they have been picked up.

All those details will be seen when you click on the analysis.

But when you do a hands on the next set of chapters, we will understand how we can do this analysis

and what analysis can reveal and how to troubleshoot pricing through analysis.

# 73. Pricing Hands-on - Master Data Set-up and Scenario Walkthrough

So here is an exercise that will be solving on pricing.

It's a very small exercise, but the main focus is condition technique.

The condition technique theory that we have seen only focuses on one scenario.

The base price.

In this example, we'll see more than one price list.

And we'll see how to configure it in SAP.

Just a little more elaborate.

Nothing beyond what we have already learned in condition technique.

To work on this exercise, though, we need to create some master data.

Let's start with the first one.

Let's create a customer similar to 1400.

Why 1400?

1400 is already configured with everything you need.

Partner determination and all that configuration.

You can choose 1000 also.

So open ASAP.

Go to zero one.

Select Customer account group 0001.

So to set the company code to 1000.

Sales.

Org Distribution channel division as usual.

2010 zero zero.

Select the reference customer as, say, 1000 or 1400.

Your choice.

And of course the same set of org elements 1010 zero zero.

Let's give the customer a name test pricing and just you can fill the rest of the details.

They are not very, very important.

Now go to the company code view.

Nothing to fill here.

Now, sales area data Sales.

Shipping billing.

Enter the default tax classification.

Then partner functions have nothing to do here and save.

The customer that is created is 128.

You can see it at the bottom of the screen.

Let's note it down for reference.

Next step, create a new document pricing procedure.

How do we do that?

Go to VOC zero.

Go to the pricing procedure and document pricing procedure.

Click on Maintain.

We can either create a new one or choose an existing one.

I've already created a new one here.

It's o test DPP.

If not, we can create a new one.

Click on the new entries.

Create a new entry, say Colon.

Give it a description and save it.

Again, let's note it down for reference in our notes.

The next step is customer pricing procedure.

Where is it?

Go to pricing procedures and then customer pricing procedure.

Select it.

And then again go to new entries.

Looks like colon is already taken.

So since it's only one character, it's a little difficult to think of a new one.

Let's see.

Um, there is a slot between 6 and 8.

So let's create seven.

Go to new entries.

Seven test CP and save.

Again, note it down here.

Make sure you create this master data step by step.

Don't skip these steps.

It's time taking.

I understand.

But it will definitely help you solve the scenario much faster than if you are trying to do this without

creating your own master data.

Now other configuration.

Why am I asking you to create a new sales document type so that you don't mess up with or or cute?

These are standard document types.

In this case, creating a new document type takes a lot of time.

You already know the process for it, right?

As long as it's not a standard document type.

Just choose any document type that you've been using.

I'm choosing Z one.

Make a note of it.

You don't need the second step.

Creation of the item category at this point.

As long as you're using ten or a copy of ten, that should work fine.

If you want to do some other manipulation, though.

Like what?

Make the item category not relevant for pricing and see the effect of it.

Then I suggest you create your own item category.

And how do you create your own item category?

Go to ov7.

If you don't remember the transaction code, just go to SPRO.

IMG Sales and Distribution Sales.

Sales.

Documents.

Sales Document item.

Define item categories.

Go there, select ten, make a copy of it, call it Z, Anything.

This is going to take some time because any time a new item category is created, you know, the corresponding

copy controls behind them will also be copied.

I'm going to leave that transaction for now, but I'm going to make a note of it.

ZST1.

That's my item category.

The next step is item category determination.

So Z one plus norm is ZST1.

Save it.

This is the item category that we just created.

Right?

And this is for the document type.

We just created the C one.

Why are we doing this?

When we create an order for a material M0 one or a material like that.

Which has an item category group of norm.

So the norm here represents an item category group, right?

If you have questions, go back to item category nodes.

Our custom item category XSD one should be determined.

All right.

Now, let's start with our business scenario A, B, C, computers.

Wants to price its desktop range of products.

Belonging to some material group.

And here is the logic.

First price should be checked for customer material combination.

So this is the first priority.

In business terms.

It's also called a customer specific price list.

If you want to imagine why this would happen, think of a scenario like this.

All elementary schools in Pennsylvania will buy from ABC computers.

The government has negotiated a contract with ABC computers that way.

And that's a big contract for ABC computers, right?

ABC computers would be more than willing to give a special prize for this deal for all these elementary

schools.

So if a desktop costs $500, ABC computers would be willing to sell it at, say, $80 or $70 to the

schools.

Why?

Because it's a big market and the sales volume alone will justify the margins.

This is an example of customer based pricing, meaning we are creating a price list specifically for

one customer.

The next priority is customer group based pricing.

Not all customers are as big as the US Department of Education, right?

So not every customer can be given a separate price list.

For example, corporate customers can be in all corporate customers.

You know, not one per GE, General Electric or not one per J.P. Morgan.

What are we doing here?

We are categorizing customers as belonging to a particular group, in this case corporate customers.

And how do you categorize customers?

One criteria is customer group.

It's a field in the customer master.

So that could be one parameter based on which you create a price list.

It's called customer based pricing.

So how are these prices determined?

Mean M0 one will be given at $400 to a corporate customer.

350 for online customers, 450 for retail customers.

Why?

Well, there would be a variety of parameters based on which the business will will determine a particular

price.

For example, online customers will be given a lower price, say $350.

Why?

Because the storage costs are lower.

The marketing costs are lower.

Think about retail.

The cost of maintaining a PC on the shelf is very high, right?

Unless the customer sees it on the shelf, he doesn't buy it.

So what prize to give to each customer group is based on a variety of parameters.

Now, coming back to the scenario, if such a prize is also not found.

Then default to the base price.

What is a base price list?

Material.

M01 costs $500.

Material M02 cost $600.

So irrespective of any parameter that affects the price like customer group, customer specific.

Or country or region.

So here is an example of a base price list material.

M01 costs $100.

Material.

M02 costs 120.

That's it.

No other parameter comes into play.

Similarly, this is a customer specific price list.

The same material M01 for customer 1400 is going to cost $90.

And then we have customer group specific price list.

The same material for customer group zero one costs $95.

So let's start the configuration.

# 