# 45. Bill of Material - BOM

Today we are going to talk about bombs or bill of materials.

What is a bill of material?

The name might sound a little weird, but the definition is quite simple.

A bill of material consists of one top level material.

In this case, we are talking about a PC, which is essentially line item ten and all its components

put together.

So 20 is the monitor, 30 is the CPU, the memory, extended warranty, anything else that you give

free along with it, say a printer, mouse pad, mouse speakers, so on and so forth.

I've picked up a couple of items here, like the monitor, the CPU memory printers, mousepad just to

make sure we have a minimum bill of material that is really workable without getting confused.

We're going to build this bill of material in the system and then use it in a sales order and see the

different ways in which we can use this bill of material.

But that's the topic for the next session.

In this session, we are going to concentrate on the bill of material.

We know what is a bill of material.

So let's start building a bill of material in the system.

The before we go there, probably you already understand the uses of the bill of material.

PC is a very good example of a bill of material where you go to a website, say, Dell or HP, and then

order a PC and choose the components.

So the top level part in this case is the PC.

And the components are your choices in building that PC.

Say for example, you choose two into two GB memory.

You choose two speakers.

You choose an extended warranty.

You choose a CPU with a particular type of processor, so on and so forth.

This concept extends in many different industries.

Say you choose a car, a Mercedes car with a sunroof as an option or a moonroof as an option.

Alloy wheels, heated seats, leather seats, so on and so forth.

Wherever you have a material that contains a bunch of components, either something you can choose with,

or it could be a case where the components come standard.

For example, if you buy a pre-built or a pre-configured server or a laptop, say PC 101 in this case.

So this PC 101, let's say, is a pre-configured system with a fixed monitor of a fixed size and a CPU

which contains so much of memory and one extended warranty as part of the package, one printer given

free as part of the package and then one mouse pad.

Now, this is not a choice but a set of components that the we wish to give the user as part of this

material.

So this PC 101 is the top level material or top level part.

And all of them are called components.

Components.

Components could vary in quantity.

As you can see, this PC contains two memory cards.

And that's part of the package.

So a bill of material contains components.

Along with the respective quantities.

So if you wish to supply two printers along with this bill of this PC, you could as well specify the

quantity of two here.

Okay, Now, before we build the bill of materials in the system, we have to build the materials that

comprises of this bill of materials.

This is going to be a tedious exercise where we are going to build like seven different materials.

I'm going to start off by showing you a couple of them.

Say, I'll build one PC and then the rest of the steps are almost similar.

And then I'm not going to show them wherever things are different.

Say, for example, this extended service warranty is going to be created using a different material

type.

And I'm going to emphasize wherever things become different.

All right.

So first things I'm going to show you how to create this PC as a material in the material master in

SAP.

And the rest of them will almost be very similar with very, very minimal differences.

And then we're going to concentrate on building the bill of materials.

So step number one is creating these seven materials.

Starting off with the top level part PC dash 101.

All right.

So the transaction, as you know, is zero one.

PC Dash 101 Select retail and select finished goods.

Now you can do finished goods.

You can do non stock items, but that's a topic for another day.

Let's choose first, which is finished materials because it's simple and we're already aware of what

material type.

Choose that, then choose basic data.

One sales org 123 MRP one General Data storage one accounting one.

So if you remember from our material master class, these are the minimum values that are required in

order for you to create a material and use it in the full OTC cycle.

Now that we have selected the views, let's click okay.

And let's choose the plant as 1200 and the storage location as 0001.

Sales org is the usual 1010 and you can as well choose 3000 and the respective plants.

If you are comfortable with the 3010 zero zero sales or you can even do it in your own sales org.

Now that we have done the enterprise structure class, I'm choosing 1000 because this is something that

we are all very familiar with.

All right.

Click okay and start to enter the description.

Okay.

This is a PC model 101.

Prebuilt configuration.

Okay.

The unit of measure is, let's say each or PC, whatever you like.

Let's select a material group if required of PCs, but it's really up to you.

You don't need to choose it if you want.

You can put some weights volumes but not really required.

Enter.

Enter a tax classification of one and over here.

As of now, we are choosing Norm, but we are going to come back to it and change it.

Keep moving along.

Wherever.

Data is required.

Keep filling them up.

Choose an MRP type of end.

This way you don't have to fill up a lot of stuff.

MRP views, as you know, is something that is not in our domain.

It's in the m, M and P domain.

So we don't care.

Keep moving on.

All right, valuation class is 7920 and just put a standard cost of whatever you like and click save.

Okay, So this is done.

And similarly, we're going to do the rest of the materials, which are the components.

And since the exercise is going to be almost the same, I'm going to skip all the steps, but I will

create them in the system.

And then.

We'll continue with the demonstration of bill of material.

All right.

So here we have created all the different materials that we have initially started out to create.

And let me create another page here.

Okay.

And then I'm going to paste whatever I've created here.

So these are the different materials that we have created.

CPU.

The Extended service Warranty.

Memory Monitor.

Mouse Pad.

The top level PC pad and printer.

Now, apart from this material extended 101 which is created with a material type of the iron, the

rest of them are all created with a material type f, e r t, which is finished material.

If you want to quickly see all the material types I've used, there we go.

So all of them have been created with the material type first, with the exception of service, which

is dim.

All right.

If you want to quickly see the materials that have been created and the respective material types just

go to zero three, for example, and type in, uh, let's say Ext 101, which is the extended warranty

material of type service.

Just go to basic data and then click on this I button information and then you'll see the material type

that it has been created with.

In this case it is d i e n which is service for the other parts, say PC 101 or PRT 101.

You might already see that they have been created with the material type first.

All right.

Now that we have created the materials, let's move on to the next step and create the bill of material.

How to create the bill of material.

You use this transaction C01 Now, there are different types of bills of material.

Some bill of materials are created for sales.

Some bill of materials are created for production.

Some bill of materials are created for planning, for plant maintenance, so on and so forth.

I'll give you a very simple example to understand why we have so many different bill of materials.

Let's take the same example and then we have the PC top level part and then all its components.

Now to a salesperson or to a customer, probably.

He's more interested in looking at the PC and its higher level components.

Say monitor keyboard, mouse memory.

That's what the sales perspective is, more or less the customer perspective.

Now, if you look at the same thing from a manufacturing perspective.

So this is the plant.

And if you look at it from a manufacturing perspective, yeah, there is this PC, but if you look at

the monitor here, the monitor will be broken down into its components, say the panel, the power supply,

um, and any other electronics, so on and so forth, because they are all required to manufacture that

monitor.

Similarly, if you take a CPU, uh, a sales guy or a customer is only interested in looking at what

processor it is and how much memory it is, that's it.

But from a manufacturing perspective, the CPU needs to have a motherboard, the processor, the memory,

the graphics card, so on.

So this is the sales perspective, the same bomb and this is the manufacturing perspective of the bomb,

so on and so forth.

There are so many different perspectives.

Now let's go to CS zero one, which is creation of a bomb and say PC Dash 101, which is our top level

material.

Then enter the plant bomb is per plant.

So it is not necessary that the same bill of material be used and in all plants, meaning in the US

you can have one bill of material for the same top level part.

And in India or China you can have a different bill of material for the same material or top level part.

Which is rarely used, but it's a feature that's available now.

Bomb usage is the one that we've been talking about just now.

We've talked about sales views, production views, so on and so forth.

The ones that we are interested in is the sales view, which is number five.

Usage five.

So pick five here for sales usage and then hit enter.

Now we're going to create the components.

As we have seen in the bill of material that we initially started out to create.

So here is what we wanted to create.

A PC should contain a monitor.

Dash 101.

Since we have already created that as a material, the system should validate it and then be okay with

it when I hit enter.

So the quantity is one.

So this is going to contain one monitor, hit enter and the system is okay with it because it has already

pulled out the unit of measure, so on and so forth.

The next component is the CPU.

And the CPU is quantity one CPU dash 101 quantity one hit enter.

And I'm going to deliberately skip the memory, which I'm going to tell you why in a bit.

So I'm not going to do memory right now, okay.

Because memory is a component of CPU, so I'm going to create CPU as another bill of material which

will contain the part memory.

So the CPU contains memory, right?

Let's say two GB memory.

So I'm going to skip the memory part for now and then just going to create the remaining parts which

is extended warranty printer and mouse pad.

So here we go.

Extended warranty 101, which is a service and of course quantity one and printer 101 quantity one and

mouse pad 101 quantity one.

That's all we wanted to create.

Click on Save.

Is that all?

So we've got the PC.

Of course, the top level.

And then one, two, three, four.

Five.

All right, so we got everything lined up.

Save this guy.

Similarly, we're going to create another bomb for CPU 101 and then let this guy contain the part.

Memory 101.

So CPU 101, everything else remains the same for the same plant, same bill of material.

Enter.

And then this is going to contain memory 101 quantity to let's say we're giving four GB memory as part

of this standard package and which is two into two two GB sticks.

So we're going to say the quantity is two.

All right.

Save.

Now we have created the bomb.

And if you want to look at the bomb, here it is.

CS 022 change or CS zero three to display.

So I'm going to say CS zero three pick out CPU Dash 101, which contains the components memory.

And let me go here and then I'll take a screenshot of these two different bill of materials that we

have created.

All right.

So this is one bill of material which will contain just one part.

And the second bill of material is for the PC, the top level part, which is much bigger in scope.

There we go.

So we have all these five level parts.

Let me take a quick snapshot of it like so.

And there we go.

So this is the top level part.

And then these are the components.

And among it, the CPU is one component which could be further broken down into more components.

So we have PC.

Which contains.

So on and CPU is going to contain memory as a component inside the CPU.

If you only have one level of components, it's called a single level Bom.

If you have more than one level of components like CPU is going to contain memory, memory is going

to contain something else.

It's called.

A multi level bomb.

Or.

Superbomb.

Super bill of material.

All right.

This is how you create bill of materials.

Any questions?

Please feel free to post your questions in the forum and I'll be able to answer your questions.

Thank you.

# 47. Item Category Controls and Hands-on

Now that we have created a bomb, let's go ahead and use it in an order and see how the bomb behaves

in an order.

So go to var zero one or enter your favorite customer.

Or it could take any order type you like.

And the top level part is PC dash 101-1.

If you get a message like this, it says PC, PC Dash 101 and it's not defined for 1010.

And then language.

The easiest solution to it is to go to M0, to enter your material, click on basic data, go to additional

data, and then select the language that that SAP has thrown the error for.

In this case, it's D because it's a German sales org, and then I'm just going to copy whatever is

here and then put it in.

Here.

Save it.

This applies to any materials where you get the same error.

Okay, we're going to zero one again.

Use standard order or any other order of your liking, any any customer that you like that you have

created maybe and enter the material.

PC Dash 101.

What is the item category here?

The item category is tan T a N.

All right.

We don't know much about item categories yet, but there is some item category that you see there called

Tan.

A weird name, but we're going to explore the nomenclature in a bit.

What has happened here.

We have created a bill of material for PC 101.

We are trying to order that material.

But wouldn't it be nice if that bill of material that we have created, when you enter that in the system,

it explodes into its components automatically?

Well, in order for you to see that explosion, automatically, you would have to do a bunch of configuration.

Well, not really a bunch.

Maybe a couple of fields here and there.

And before you go there, we should first start to explore item categories.

So what is this item?

Category?

T a n And what does it control?

Just like the way your order is controlled by the order type or Z or t, I in.

The line items in an order are controlled by the item category.

Now we have seen the controls at the header level at a very detailed way.

For example, we have seen what our number ranges, we have seen what our quotation messages, we have

seen the different document types that are attached to the sales document type.

We have seen somewhere close to 14 or 15 different controls in a document type.

An item category is almost equally important.

But luckily we don't have so many controls.

I'm going to highlight or summarize a bunch of controls and kind of relate it to the same example that

we have been seeing, the PC example.

We will see one version of it and then you will understand the remaining things as we go forward.

All right.

So here is our PC, and then here are our quantities, which we are not seeing yet, but we will in

a bit.

And then when you enter PC, the item category that came up was tan T A and the name Tan might sound

a little weird, but ideally it's actually simple.

If we were doing it the German way, which is or in Germany stands for to.

Or in Germany stands for to.

And then they have just added a n to it at the end.

Like if you do a VR oh one to that's still a standard order.

It's just that to is a German name.

Whereas we use or the standard English name for that document type.

Similarly, if you use to create a quotation, let's say v a 20 1QT

enter and enter your.

Customer enter a material, say PC 101, quantity one.

What is the item category here again?

So why is again coming up as opposed to say, CTN?

Well, you have guessed it already.

Cute is the English equivalent for the document type.

AG So you could as well type in AG here and then start doing your regular quotation.

So that's the nomenclature behind CU.

AG and the respective item categories say t, a, n or h e.

N.

All right.

So we have to end as the item category and to N or again, all of them have a bunch of controls behind

them.

What are the important controls behind an item category?

And in order to understand that, we have to go to Sbarro.

So go to Sbarro, IMG sales and distribution.

Sales.

Sales documents.

Sales document item and click on define item categories.

So here are our different item categories and you can just go to position and select Pan Asian or whatever

item category you like and go into the controls behind it by clicking on that magnifying glass.

All right.

What are some of the important controls here?

So let me just quickly go here and then.

Try to capture a screenshot.

Okay.

This doesn't look good.

We go here and try another screenshot.

Okay.

Much better.

Just resizing it.

Okay.

We have a screenshot of item category.

I'm going to quickly highlight the important fields here.

Schedule lines allowed one item relevant for delivery.

Two returns Relevant three.

Billing relevance for credit active five pricing.

Six Completion Rule seven.

Special stock eight Billing block and Billing plan.

Let me call this as nine.

And structural scope.

Then.

Along with application delivery Group 11.

And most of this like in completion procedure, part and determination, procedure, text determination,

procedure are important, but we're not going to go there yet.

So let me just call it as 12 and status profile is 13.

Now I'll highlight what is important at this point.

Let me change the color, uh, to.

I don't know how to change colors.

But anyway, let me highlight some of the sections by going to the previous screen.

And here we go.

This is one billing relevance.

Okay, so one is billing relevance.

So let's go step by step.

Some items are relevant for billing and some items are not.

For example, this PC is relevant for billing or its components are relevant for billing.

You don't really want to price both at the header level and at the line item level, isn't it?

Meaning both at the top level, part level and at the component level.

You want to make sure that you either price at the top level or at the component level, which means

the PC is $650 and it includes a monitor, CPU memory, blah, blah, blah.

Or you're going to say here is your PC and depending on the way you choose it, the monitor cost $100,

the CPU cost of $50, the memory cost $10, so on and so forth.

Right.

And the next one is pricing relevance.

Very similar to what we have discussed.

You can prize either at the header level or or the top level or the component level.

Some of them you don't really prize.

Some of them you prize, some of them you give free of cost.

For example, let's say we are not giving out this PC or we are not pricing this PC at the top level,

rather pricing it at the component level.

So PC is not relevant for pricing, but the components are relevant for pricing.

Let's say monitor is $100, CPU is $100, which includes the memory component of let's say $50 and then

an extended service warranty of uh, let's say $50 for three years and printer, let's say, is given

out for free because it's part of this package.

You must have seen this already in Dell.

So you buy this printer, you buy this PC, you configure it in such a way that if it exceeds a certain

amount or under certain conditions, your printer is given out for free.

Or even as part of a regular package.

The printer is given out for free for all the materials that belong to a certain category, let's say

pieces.

When you're giving out for free.

It definitely is still relevant for pricing.

Only thing is, it's given at 100% discount.

All right.

Next is a mouse pad, which is not relevant for pricing, maybe because it's too trivial a quantity.

You know, you don't really, really want to say that you have given a mouse pad for free or or it's

not relevant for pricing because it's too trivial.

Maybe it's like giving away a very small piece more more or less like a complimentary thing, but a

printer is much more prize worthy.

Maybe it's worth $100 if you buy it separately, but because he's buying it as part of the package,

we are giving it at 100% discount, which is essentially free of charge.

Now, this will be shown in the bill because we want to show what is the top level part.

This will be shown in the bill.

This will be shown this, this, and this will also be shown in the bill, but with a $0 saying, hey,

you know what?

The printer is $50, but I'm giving you it at $0 because I'm giving you 100% off.

But a mouse pad maybe is not even relevant for billing, so it won't even go there.

Or you might want to take a mouse pad down to the billing and say, Hey, you know what?

Here is your bill and here is your mouse pad.

I'm not charging anything for the mouse pad because it's not really chargeable.

Okay.

So it could if you want to make it pricing relevant or billing relevant, you can make it.

If not, you don't need to.

And we're going to look at these controls step by step.

But I'm just going to go over the details first and then we're going to visit the respective flags in

the item category configuration.

Next, is delivery relevant?

And schedule line relevant.

These things are very much interrelated.

The same material PC 101.

Could be scheduling relevant in an order and scheduling relevant in a quotation.

But in an order PC is delivery relevant, whereas in a quotation this is not delivery relevant.

A very subtle change.

An item can be made delivery relevant or not at the item category level similar to the way an item can

be made.

Schedule line relevant or not at the item category level.

When would you want to make anything or any item delivery relevant or schedule line relevant?

Depends on the nature of the product and on the nature of the business process.

Sometimes you make some products delivery relevant.

Sometimes you make some products schedule and relevant.

Most of the time when you have schedule and relevance, you mostly will have delivery relevance with

some exceptions, like the quotation example that we have seen.

Keep going.

Is this schedule relevant?

Yes.

Yes.

Yes.

Is this schedule relevant?

Well, it's an extended service warranty.

It's a service item.

Why do we need schedule lines for that?

Not necessary.

Same thing here.

It's not even relevant for delivery printer, although it's given 100% for free.

It is relevant for delivery and it is relevant for schedule lines.

And same thing with a mouse pad.

Remember, you cannot do a delivery unless you have scheduled lines.

But if you have scheduled lines, that does not mean that you have to do delivery and that is controlled

by the delivery relevant flag.

So we have seen four different properties billing relevance, pricing relevance, delivery, relevance,

schedule, line relevance.

Now, as you can see, there are more properties, as I've highlighted here, like weight, relevant

credit, active special stock completion rule billing blocks and so on.

And like I said, not all of them are important at this point.

We can slowly go step by step as we explore the other business processes and concepts.

But as of now, if you understand these four different properties that we have discussed, along with

the fifth one which we are going to see, which is the structural scope that should be good enough for

item categories.

So let's talk to look about or look into the structural scope which talks about the bill of material.

Now, Tan does not have anything here.

It's blank.

And that's the reason why if you go inside the the document type, you'll see that.

Let me just log in again.

Looks like I've timed out.

Here we go.

We were trying to create an order.

Or 1010 zero zero 1000.

Okay.

And then we have PC 101 quantity one.

The item category is tan and tan.

If you look at the properties of Tan, go to SPRO, IMG sales and distribution sales, sales documents,

sales document item define item categories go to tan.

Select it, click on the magnifying glass and in the structural scope.

Both these fields are blank.

Now I'm going to talk to you about a couple of item categories, especially T, a, P and T, a Q.

Which have the structural scope and application set to A or B, and I'll tell you how it's going to

make your items come alive with its components.

But before we go there.

I need to tell you something about item category group.

What is an item category group?

If you go to your material Master M0 three or M0 to select PC 101 and then select the sales org to view.

Remember sales org to view, click okay, enter your plant and sales org distribution channel.

Here we have the sales item category group.

Forget about this.

This is not important, but this is the one that is important.

Okay?

There is this subtle difference that you got to keep in your mind.

Item category group.

So we have item category group of norm for this material.

Just for a bit, I'm going to change it to e r l a or you can change it to l u m f.

Okay.

A or F.

Let's change it to F for now and save it.

Right.

And then go back to zero one and enter your material.

Then type in PC 101.

Quantity one.

Oops.

What happened?

Okay.

I don't know why the plant is not coming up.

Let me put the plant here.

And.

Oh, oh.

Why aren't they being copied?

And here we see an error message again.

Monitor 101 is not copied from the bill of Material.

The system is trying to copy the components from the bill of material into an order and it says it could

not be copied.

Now go to help and see if there is any message that you can make out and correct.

And I can't seem to make out anything from here because it says when the bill of material was exploded,

it was established that no sales document item could be created for this material.

Well, that doesn't really make any sense to me.

So what I'm going to do is click okay and then click okay to all the components and then try and see

where we have gone wrong by entering that material.

Mon 101 and enter that material as one.

There we go.

It says Mon 101 is not defined for the sale.

So the same error that we got for PC.

So what we are going to do is go to zero to enter the materials, go to basic data, go to additional

data, and then make sure that the material is maintained in the respective languages in this case.

Chairman again, let's try to create this order here.

Zero one 1000 and PC Dash 1011 Quantity.

Now the monitor is coming up properly and I'm going to do the corrections that we have done already

for the monitor for all the remaining materials.

Right now that we have corrected the material descriptions for all the materials in German.

As soon as I enter PC Dash 101 the quantity of one.

We got all the materials that come up beneath them as components.

Now the CPU is not exploding into memory, which is a sub level component.

That is because the item category here is not be, but instead to n which does not result in explosion.

So how is this controlled?

As usual, if you go to the item category and look at the structural scope here for ten, this is blank

which says do not explode.

But if you go to A or B.

It says explode.

When do you use a versus when do you use B?

You want to use A when you have a simple level bomb and you only want to explore the top level components,

which is what is happening in our case for tap tap.

So go back and check.

Tap, select it, click.

Okay.

And oops, sorry.

I think.

Here we go.

Tap.

We have a which is explored single level bill of material.

Now, if you go to to Q.

Select it and look at the controls behind the queue.

It also says single level bill of material.

If you want to explode multi-level bill of material, you could use an item category that has B as.

The structural scope and under application make sure that you always choose SDS zero one, which is

the sales.

View of the bill of material.

Probably by now.

You remember that.

You know, these are all the different views that you had when you created the bill of material.

Okay.

So first is the structural scope.

Second is the application.

All right.

So we have two different item categories.

Tap and take and take.

And of course, the initial one that we started out with.

So in total, we have seen three different item categories.

In some cases of our order type is determined and in some cases to n is determined.

Some cases to D is determined and we are not entering the manually, but they are automatically picked

up.

So what really is causing this?

Why is it coming up this way?

There should be some kind of a determination that's happening behind the scenes automatically.

What are the controlling parameters?

The controlling parameters in deciding the the item category is called or rather the fields are.

Sales document type.

Plus.

Item category group.

Plus.

Higher level item category plus usage.

All these four parameters put together will decide the item category.

Okay.

This is called.

Okay, let me go here.

Change the name to item

category.

Determination.

Oops.

Write it here, right?

I think I named the wrong one.

That's fine.

So here is item category determination sales document type plus item category group plus higher level

item category plus usage.

These four parameters determine the item category.

Now, usage is something that is very rarely used, so we are not going to worry about it at this point

because it's not really very configurable.

It's mostly something that you can change in user exits or somewhere in the code.

So and it's very rarely used as well.

So you really don't have to worry about usage.

You can always claim that you have never used it, no worries.

But you just have to remember that there is a fourth parameter called usage.

Now these three parameters, order type, let's say, or then item category group, the one that we

have seen at the material master sales org two level.

Okay.

So let me open up another page.

And show you the.

The configuration behind sales document type.

So go to SPRO.

Imrg.

Sales and distribution.

Sales.

Sales Documents.

Sales Document item.

Okay.

And then assign item categories.

So this is the equation where you determine item categories.

Go to assign item categories or I can take a screenshot here so that you can.

This is all under Sbarro.

Go to.

Assign item categories.

Or the transaction for it is v, o for orange V for you can either do that or go to this menu path.

And here we have the determination of item categories in our case o item category, group of lymph or

norm or whatever.

Then we have tap the first piece of configuration.

Right.

The first piece of configuration is this for the first line item.

For the first line item as shown here.

Okay.

I think I've got to open the items just for a bit.

PC dash 101-1.

And then here we go.

Okay.

And the configuration for this, this tab.

Is determined by.

This, which is an order of type or plus the item category group of this material is l u m f.

Where do you see the item category group?

Go to the material master sales org to view and then you can see the item category group of that material

there.

Right.

You can see the item category group of the material in the material Master in 010203.

This item category group.

Is coming for the material from the material master group.

So a property.

One of the property comes from the document type.

The second property comes from the material and it's called the item category group.

And the third property is the higher level item, which we don't have anything in this case.

So let's open something, a new sheet and then see.

How this works.

Now we know that for line item ten, this is what has happened.

So what about line item 20 for line item 20.

Look at this little column over here.

I'm going to drag this guy here so that you can understand what is a higher level item.

Okay, so here we go, higher level item.

Look at this.

This field is called the higher level item.

That means that these are all components of the higher level item ten.

So ten over here refers to this ten.

So in this case, the equation goes something like this Order type R plus item category group for Mon

101 is Norm.

How do I know that?

I go to the material master.

Sorry.

The line item.

Or you can go to the material master directly.

But another easy way to go to the material master right from the sales order is to highlight that material

and hit F eight and go to sales or to view and you'll see that the item category group in this case

is norm.

Okay.

Plus higher level item category is tab.

So what about this or plus norm plus tab.

So let's go here, click on position and type in or plus norm plus higher level item is T a P.

The equation says that the resulting item category should be t a n.

Right.

Well, paste that here.

Here we've got because of this little equation, we've got the item category for this line item.

Line item 11 monitor is to an.

So similarly we can decide the line items or rather, um, make sure that we understand how the line

items have been determined based on that little equation of ours called the item category determination,

which essentially consists of three parameters document type item category group higher level item.

Now higher level item is not always mandatory, but at least the first two fields are mandatory document

type item category group.

If you know these two parameters at the line item level, you can determine the item category.

And we have seen the item category controls a whole bunch of properties at the item level like delivery,

relevance, schedule, line relevance, billing relevance, pricing relevance, returns, relevance,

credit, relevant completion rule, so on and so forth.

But we have only seen 4 or 5 different fields, the fields being billing relevance, delivery, relevance,

schedule line, relevant pricing relevance and structural scope which decides how the bill of material

should explode.