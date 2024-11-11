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

# 