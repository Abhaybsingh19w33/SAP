# 84. Account Determination - Theory

Now we are going to talk about account determination.

There are 3 or 4 different kinds of account determination.

But the ones that are important for us as consultants are number one revenue account determination.

And number two, recon account determination.

Recon stands for reconciliation.

Do you happen to remember where we have seen recon account when we create the customer master?

We put a recon account in the accounting view of the customer.

Account determination falls under the SD fi integration area.

Credit management is another area that falls under SDF integration.

Both these areas are typically configured by both SD and Fe consultants together, but most of us are

not from a finance background.

So before we jump into the configuration behind account determination, let's understand the basics

of accounting.

We're going to understand some basics like what is a credit, what is a debit?

What is a recon account?

This is not really necessary for an SD consultant.

But I believe these basics are really necessary to do a good handshake with your consultant.

This is a cross functional area, right?

So if you understand the basics of accounting.

It will help you explain what you need from the consultant.

So before we understand any of these terms.

We have to first understand dual entry accounting.

This is the standard accounting practice for all big companies.

So what do we need to know about dual entry accounting?

For every transaction that affects accounts.

There will be a credit and a debit.

A set of credits and debits, in fact.

And the amount of credit.

And the total amount of debit will be equal.

Credit is posted as negative and debit is posted as positive.

Let's post a simple transaction.

Say a PGI.

PGI involves two accounts.

Cost of goods sold or Cogs account.

That is credited.

And the inventory is debited.

Is this correct?

I'm not sure.

I think Cogs account is debited and inventory is is credited.

In fact, I don't even know which one is a credit and which one is a debit.

But that does not matter, really.

SAP automatically takes care of it.

The only point that we have to understand here is every transaction involves an equal amount of credits

and debits.

How about posting an invoice?

We know it affects the counting, right?

Say this invoice consists of line item ten M0 one.

A price of $100.

And then a regular simple pricing stuff.

Say a discount of $10 that comes to 90, a price of $5, 95 tax of 10%, 9.5.

So the total comes to around 104.5.

Simple example of pricing, right?

In this case.

How are the accounts affected?

I said equal amounts of credits and equal amounts of debits.

Right?

The revenue that needs to be collected from the customer will go in as a credit.

What is the revenue here?

This.

Is the revenue $110 go here and then freight is receivable.

So $5 go here.

Tax is also a receivable.

So 9.5 goes here.

And then the total of 104.5.

Then the customer needs to pay goes as a debit.

So what is the total credits now?

114.511 4.5.

The total of the debits is also 104.5.

You see, this is what I meant by equal amounts of credits and debits.

That's the only take away from this.

The rest of the credits and debits.

Negative.

Positive.

What goes where?

Don't worry.

For every transaction, there is an equal amount of credits and debits.

What are all the areas that accounting is affected in our s-d cycle?

So let's take the order to cash cycle.

We have our quotation.

Order delivery and invoicing in this cycle.

Let's see where accounting is affected.

Is it affected here?

The quotation level?

No.

Accounts are not posted to end quotation.

Well, in the order pricing and all that stuff does happen.

But are the accounts affected here?

No.

Same as quotation.

No difference.

Does this affect accounting?

Yes.

So when exactly does it get affected?

Not during the delivery creation, not during picking, not during packing, but during the PGI.

What are the accounts that are affected?

Just two accounts.

Cost of goods sold.

Cogs and inventory accounts.

Again, you don't need to know which account is credited, which account is debited.

That's not your job.

As long as you understand at least the basic accounts that are affected, you are good to go.

At the time of invoicing after we post the invoice to accounts.

Discounting it affected.

Of course.

Yes.

Accounts are affected.

Right.

So what are the accounts?

Customer account revenue account.

Sales deduction.

Account Tax account.

Freight account.

Again, there will be a bunch of debits and credits.

For example, revenue is a credit sales deduction is a debit.

Again, we don't care about debits and credits.

SAP will automatically take care of it based on the document type.

By the way, why is it based on the document type?

Because if we do the same transaction for a credit memo.

The same revenue account is debited.

You understand why?

Because in case of a credit memo, we need to give money back to the customer.

Right.

So automatically the entries will be reversed again.

SAP will automatically take care of that for you.

You don't have to worry about that.

Overall, though, just remember the basic accounts at a very high level.

Cost of goods sold inventory during.

And a whole bunch of other accounts like revenue, customer recon, tax, freight, etcetera during

invoicing.

So that finishes the accounting basics for us.

But what role do we play as an ISD consultant?

The accounting that happens during PGI are responsible for it.

As an consultant.

Well, yes and no.

Yes, because we initiated No, because we don't actually map the account.

How do we initiate it?

Via the movement type.

Remember the schedule chapter.

We said the scheduling category will be linked to a movement type and movement.

Type will be associated with a set of accounts, schedule and category, the movement type movement.

Type two accounts.

Who configures the movement type to the corresponding accounts.

It's both and consultants together, but not us.

So it's out of our way.

So this interface when an invoice posts accounts, we are responsible for this.

When we as the consultants talk about account determination, we're talking about this interface here.

So this is the background of account determination in.

How exactly we do it is what we're going to talk about in the next set of chapters.

# 85. Account Determination - Scenario & Master Data

Determination is configured entirely using the condition technique.

So if you have not finished condition technique in pricing, please go back and finish it.

But if you have already finished condition technique.

Account determination is going to be a walk in the park.

All you have to understand is the concepts.

If you finished the previous chapter, you're almost good to go.

All right, so let's go to SPRO, IMG Sales and distribution.

Basic functions.

Account assignment.

You can see different kinds of account determinations here.

Right.

We're only interested in just two of them.

What are they?

Revenue account and reconciliation account.

The way you configure either of these is exactly the same.

No difference.

You see the sequence of steps similar?

The only difference is you are doing revenue accounts here.

And you are doing a recon account here.

If you understand what a recon account is, you really don't need to focus much on recon account determination.

If you understand revenue account determination, you understand recon account determination as well.

So you don't need to spend any time on recon account, determination, configuration.

Just focus on revenue account determination.

So let's start with revenue account determination.

The first step is to check the master data.

What kind of master data are we talking about?

It says something about account groups.

When did we see these?

For example.

Customer account group.

Let me guess.

Naturally in the customer master.

Right.

Same with the material account group.

In the material master.

Let's go look at it real quick.

Go to zero to enter Customer.

Some customer say 21.

Our favorite sales area.

1010 zero zero.

Go to Sales View Billing tab.

This is the account group.

We didn't specify anything here.

It's blank.

Does this mean we cannot use this customer to create invoices?

No, of course not.

This is just one parameter.

And in account determination.

This parameter is optional.

You can choose it or not.

It's your choice.

What are the choices here?

Say this is a domestic customer.

21 set it is zero one.

How about material account assignment group?

Go to zero two.

Enter a material.

Go to the sales view.

And where is the account assignment group?

Here.

The way we set these parameters.

Meaning customer account assignment group or material account assignment group is based on the requirements

of the accounting department.

This is very important.

We don't determine which accounts the revenue needs to go to or the tax needs to go to.

So who gives us the requirements?

The accounting department.

They give us the requirements, we just can't figure them.

Let's take an example.

Take a company like Dell.

They sell a wide range of products, right?

Hardware.

Software.

Accessories.

And they sell it to a wide range of customers as well.

US customers.

The rest of the world.

Customers.

Military customers.

Government customers.

So how is this all tracked?

From an accounting perspective.

I mean, the accounting department typically divides revenue into different buckets.

For example, all hardware sales for US customers needs to go into this account.

Eight.

Da da da da da.

One zero.

Think of this account as a bucket.

Essentially what we are trying to do in revenue account determination is categorizing revenue into buckets.

The accounting department gives us the buckets.

We just, you know, take a pipe and fill it.

That's it.

And all of this should happen automatically behind the scenes.

The user who is creating the invoice does not have any idea where the revenue is flowing.

They don't need to know it.

It's our job to make it happen automatically based on the requirements of the accounting department.

But in order to configure this to happen automatically, we have to first categorize the customers and

materials as belonging to certain categories.

And the master data that we talked about, customer account, group, material account group, these

are just ways to tag customers or materials as belonging to certain groups.

And what is the sole purpose of these groups?

To affect accounting.

Now, you might have another question.

Why create these new set of fields?

If you have gone through the customer and material master classes, you know, fields like customer

group, material group?

Why not just use those?

Simple sales requirements are different from finance requirements.

Example.

Sales can have their own way of grouping customers.

To give discounts.

Set price lists.

Cetera.

ET cetera.

So we have seen one example in pricing, right, using the customer group.

An accounting can have their own requirements.

Example, they might want all US revenues for hardware to go into one account, irrespective of if the

customer is a corporate customer or a government customer, or if the product that they are selling

is a PC or a laptop.

Sometimes these groups can be the same when mean these groups sales related customer tags like customer

group material groups or accounting related tags like customer account group or material account group.

But that depends on the business requirement.

But what SAP is giving us here is a different way to categorize master data.

Meaning customer, master and material master.

From a sales perspective and accounting perspective.

Well, like I said, this is optional, though.

You don't have to use these fields to do account determination.

You could do it without as well.

Just like pricing field catalog has so many fields to choose from.

200 of them.

But do you need to use all of them?

No, of course not.

Same thing with your account Determination field catalog.

It has a bunch of fields like customer account, assignment group, material, account, assignment,

group, order region, so on and so forth.

But you don't have to use all of them.

These are just some examples.

And like I said, the requirements come from the fee consultant.

So when finance decides the buckets into which the revenue needs to flow into, why are we involved?

Meaning consultants.

That is because the flow happens from SD.

This is the source.

So we have to configure SD in such a way that the revenue flows into the right buckets based on the

requirements of Phi.

If you take the same Dell example, say laptops and desktops go into separate accounts.

Sure.

Now, does it always happen like that?

Maybe not.

Say they are running a promotion.

In this case.

The accounting does not want the laptop sales to sit in this account.

Instead into this account.

800020.

The same thing with desktops.

This is standard sale.

This is promo sales.

How do you solve this requirement?

The first question that you ask is how do you identify a promo sale?

Say anything with a Z or or Zstd standard.

Anything that is similar to a standard order.

A standard sales.

Right.

I'm just hypothesizing.

Promo sales could also be the same, but the cost.

But the customer could be using a promo code.

So if you see a promo code, take the revenue to a different account and if not, take the revenue to

the original account.

Next question.

How do you identify the promo code?

Different ways depends on the depends on how promotions are implemented.

Ultimately, though, maybe some parameter in pricing would affect your promotions, right?

Maybe a certain parameter in pricing.

Say a special customer group is used, maybe a special coupon code is used somewhere that somehow we

configure to flow into the field catalog.

And create condition tables based on that field.

And create condition records based on that condition table.

So what we are saying is creating data in such a way that under these circumstances the revenue needs

to go into these accounts as opposed to these accounts.

Promo code is just one example.

You could have other examples, say customer group.

If you take the same example, think of two customer groups.

Domestic and international.

Domestic should go here.

International should go here.

Either way, our job is to identify the right set of parameters, make sure they are available in the

condition record and use condition technique to configure the scenario.

In the next chapter, we'll do the configuration in Sbarro.

#