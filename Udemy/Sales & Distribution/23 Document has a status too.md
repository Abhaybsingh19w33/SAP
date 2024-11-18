# 113. Status Profile Configuration + notes

All right, folks.

Today, we are going to talk about a topic called status profile.

Status profile.

[BLANK_AUDIO].

A status profile, is associated with the

transaction or a line item in a transaction.

[COUGH] But before we go into the technical details of a Status Profile,

let me talk about a simple business scenario for you to understand really.

Why status profile is required.

A

simple scenario, for example, could be

a quotation that requires some approvals.

Let's say there is a company.

[BLANK_AUDIO].

Of, that those sales orders, let's say worth

200k, or 300k, or 400k.

These are really big orders, right.

And these orders are generally taken, with the quotation in place.

[BLANK_AUDIO].

These orders are generally taken with the help of a quotation first.

So, there will be a quotation, that is given

to the customer quoting a particular price and other conditions.

And that quotation because it's big ticket item.

Needs to be approved by some manager.

Let's say the field sales guy goes out and give a, and gives a quotation for 200k.

And then there's some negotiation with the customer

lets say the customer says 180k, and then.

The salesman sticks with 190k and finalizes the quote at 190k.

But he might not have all the authorization to give that discount.

So somebody else, maybe his supervisor, needs

to approve that quotation, before it's converted to an order.

So how do you achieve this?

There needs to be some check in place where we can

have different statuses at the quotation level, that somebody can approve.

Before taking it forward and creating an order.

Now this was one example with a quotation,

and we can take another example, let's say with an order.

Now this 300k equipment, say, is, power equipment, let's say, for a

power generation company.

Let's say Southern California Edison.

And which is located in Southern California.

It's a power generation company, so it requires

a ton of those, you know, heavy machinery.

And let's say we are the company selling that heavy machinery to that company.

Now as soon as a company places an order.

To purchase that equipment, we got a lot of

different stages that that order is really delivered in.

Because it's not as regular small order, right?

So, Southern California Edison, being the company.

It's a power generation company.

They has, they have placed an order, to supply a particular piece of

machinery for 300k, now this company, the delivering company, will

have to first start the site verification, because it's, let's

say it's a big piece machinery, so, where are they going to keep it?

Are they going to keep it in a.

Place conducive of the working and operating conditions of that machinery.

If not, then the company has to ensure that, you know,

the respective locations and conditions are

in place with Southern California Edison.

And even after the installation is done, or even

after the validation is done, maybe a supervisor needs to

go and run a checklist on top of that, just

to make sure it's really safe to go and install

it.

A simple example over there could be, for example, whether it has all

the necessary power connectors that are required,

and does it have the required voltage?

Does it have the required cooling, maybe a water pipe

needs to come in, does it have the required cooling condtions?

Validations, so on and so forth.

Only after all of this stuff is done and the

supervisor goes and validates it, only then a delivery can happen.

But until that point, you cannot even deliver that order.

Now,.

Now, mind you this is not as simple as a delivery block because

there are a number of stages that this order has to go through.

If

it were just one stage, we would have done this with a delivery block very easily.

But there are a number of stages.

And we need to walk through these stages lock

and step, meaning we can go to one step,

we can go to the next step and then maybe we can come back to a previous step.

Or, maybe you go four steps forward and

then maybe you can only come one step backward.

You know, there are, there is a particular workflow that

can be set up, and that's all done using status profile.

Alright?

Now, with this business scenario in mind.

Let's first start the configuration.

The configuration is really simple.

There are some, one or two, to keep things

here and there, but we'll talk about all of that.

Let's start with a configuration.

Do an example finally, and then try and.

Achieve a simple business scenario first.

All right, here is the configuration, as user, go

to SPRO> IMG, and then sales and distribution,

sales, define and assign a status profile.

So parallelly, let's try and

do it in the system.

There you go.

SPRO, IMG, Sales and Distribution.

Sales, sales documents,

define and assign status profile.

So when you click on that, first you have the definition.

So define status profile.

All right, let's select that.

And click on choose.

So as usual, there are a whole bunch of status

profiles that are predefined, because this is an IDES system.

Let's pick up a simple status profile.

And look at what's really inside it.

[COUGH] So once again, you go to this

transaction, or you don't need to remember transaction.

You can just go to the path.

Click on Define Status Profiles, and then,

let's pick up a simple status profile called.

ZQP.

That is delivered as part of any standard IDES.

This is a quotation workflow, it's a very

simple workflow that we're gonna look at right now.

All right, let's go back here a bit.

So go to Position, select ZQP.

Select that status profile and click on the

magnifying glass to look at the controls behind it.

There are three different statuses.

The first status is abbreviated as NAPP.

Which is a short form for Not Approved.

The second status is abbreviated as APP.

Again, a shortcut for Approved.

And REJE, a short form for rejected.

Now, these statuses can be defined by you the way you like it.

Like, if you don't want NAPP, you can have NA01.

Or Z01 it's really up to you.

You can have the status name and status description as whatever you like.

And each status will have a number.

Just like the way we have numbers and number ranges.

In or rather sequences.

10, 20, 30, 40, access sequence of 10, 20, 30, 40 inpricing procedure.

We have status numbers.

We just represent the sequences in which these statuses should appear.

So first, we ought to have not approved step number one.

And approved as step number two, rejected could be step number three.

And we're gonna see how these statuses are

really gonna be useful when we go back and forth between the different statuses.

All right, and that's what you see here.

Status, so this is status.

And then we have a short text, which

is a description of what that status represents, so

that the user can easily understand what that status

really means, and if you click on this button.

You can have a long text for it, which is a more elaborate description,

that the user can see when he double clicks on that in the transaction.

So whatever we're doing right now, is all SPRO.

We're configuring the system.

Right?

And then we have something called initial

status, which is this little flag over here.

So one of these statuses can be marked as

an initial status, meaning as soon as a document is

created, or for that matter as I said, a

status profile can also work at the line item level.

Even line items can have statuses.

Only certain items can have statuses.

For example, when you are generating and, when you are selling.

A power generator worth five million dollars and then

some cables worth a million dollars or sory $100,000.

You’re not gonna really bother about giving statuses to those cables.

You are more interested in the big equipment and giving statuses to it.

So that the pricing, the delivery can be controlled.

That's the reason why SAP also provides statuses at theline item level.

For now, we're gonna only look at the status profile at the header

level, because it's, at the line item level, it's just gonna be an extension.

Same configuration, no difference.

I'll tell you where it's different.

Now, coming back to the initial status.

As soon as a document is created, for example, let's say a document of type ZoR

is created, this document type is assigned to a status profile ZQT.

Then as soon as this document is created, it'll have these three statuses.

With this status as marked.

As initial.

All right?

Now, we're gonna see that example as we go forward.

When we finish this.

Piece of configuration in the next couple of slides.

We wanna create our own document and assign the status

profile to it, and see the effect of initial status,

and we're gonna see all the different statuses when, when

we try and create a document off that document type.

All right.

[COUGH]

Now, there's another tricky thing called the lowest and highest.

I'm not gonna talk about it at this

point, it's, it's a little confusing to understand, not

very useful, so you don't really need to bother

about it if you don't understand it too much.

But I'm gonna leave it at this once you

get the hang of this whole status profile, all right?

And another thing is the auth code.

So similarly when we, when I revisit the lowest and highest status profiles.

I’m also going to talk about authorization code.

All right?

First let’s get the, get the baseline running and then

we’ll move on to talk about lowest, highest and auth code.

All right.

So, this here is where you put the long description, we just talked about it.

And, each status, each of the status in the status profile.

A status profile is, quite simply put, a bunch of statuses.

Each status, in the status profile, will have a certain

set of business transactions that can be performed.

For example, this status indicates that,

creation of a billing document is forbidden.

Creation of a delivery is forbidden.

Creation of an order is forbidden.

Where is an order.

Delivery, inquiry, quotation, creative sale stock.

See, goods issued is forbidden.

So for each status, you can control, the different

types of transactions that can be performed on it.

For example, if we have a quotation called a ZQT1 or ZQT5,

whatever, and associate this data's profile ZQT to it.

As soon as it is created, it will go to a status called, not approved.

So this will go to a status called NAPP.

This is the initial status.

[BLANK_AUDIO]

In this status, what are the transactions that can be performed on this document?

Let's say we created this quotation and the quotation number is

200000021 and now we want to create an order out of it.

So, create an order OR with respect to this quotation.

Can you do it?

Well, it's not an approved quotation.

We don't wanna create or allow creation of an

order with reference to an unapproved quotation, all right?

So, we control what can be done with respect

to a particular status, or what can be done.

To our particular transaction, which is in a particular status.

By just selecting that status, clicking on this, controls

and we can say, for example, that you can in fact create

a sale document for example and then it only give a warning.

So you don't wanna really prohibit.

An order from being created, but maybe give a warning saying, hey you know what?

This quotation is not approved yet.

Maybe you don't want to create an order.

Or if your business strictly for, forbids or prohibits.

An order from being created with reference to a quotation that's not, or rather,

that's in a not approved status, then I just select Forbidden.

All right.

So.

Moving on.

Here is a more complicated example.

This example is what we are going to create, Z-O-R-D-I-N-S.

It's not there in the system yet.

So we are going to create this status profile.

I'll give you a business background behind it.

And then we go and create all of that, just the way it's shown here, all right?

But before we do that, let's take a simple example and,

the same example that we have taken, the quotation

example, and try and work it out, all right?

So let's first go to.

Scenes order document type.

All right.

So do we have anything similar to our quotation?

All right.

I think this is one of the quotations that we have

created as part of our original,um, one of our training programs.

So let's take this quotation type, ZQT1.

Look at that quotation.

Yeah, It's really a quotation.

Because I know the document category is B.

Okay?

Let's take the ZQT1 and associate a status profile to it.

The same status profile ZQT or maybe a modification of it.

Okay.

Define and assign status profile.

So, go to the Define Status Profile.

Go to ZQT, select it, and then click on Copy.

All right?

So, I'm gonna go here and then show you the steps one by one.

Or rather, let me show it to you here, before I go to the complicated example.

Edit > Insert Page.

Create new status

profile.

As a copy of ZQT in our case, because there

is an already existing example, so let's use it and try to create a copy of it.

Okay?

So select your, quotation.

Status profile.

And, click on the Copy button.

Right, select it, click on Copy.

All right, we wanna name it as what?

ZQT1 let's say, okay?

Custom Quote Approval Status Profile.

Click on Continue, and then we have ZQT1 there, all right?

[BLANK_AUDIO]

Okay?

So what we have done here is clicked on that.

And clicked on the Copy button.

Created a new name, new description, and then click on Continue.

So, we have a new status profile here.

So select, and then look at the controls here.

Let's change the names for a bit.

We can call it 10.

We can call it 20.

We can call it 30.

All right?

We can call it whatever names we like.

Let's say.

Not approved.

Approved.

Just give it different names, it doesn't matter.

I just wanna show you that it can have whatever names you like.

All right?

And then let's leave this lowest and highest for now, doesn't really matter.

So, put 1090, because you have changed the numbers, right?

And then I'll change those numbers.

And, here is another thing that you wanna just make sure, this is the trick, okay?

So let me just take this picture.

This is where most people go wrong, I mean, in terms of doing it right.

We'll I wanna practice on it.

So, you can change the name.

You can have any name and

description.

Okay, and then we wanna have this is as the initial status, that means.

When we clear the document that is assigned to this

status profile, we want this status to be the initial status.

And we can, of course, change it at a later point in time.

All right, insert another page.

And select this and click on Controls.

So in the Control section, we make sure that we have all

the respective set of business transactions,

and the respective statuses set properly.

Now if you don't copy.

And create your own.

All right.

?

If you don't copy and create your own.

Like I copy from ZQT and created ZQT1.

Now let me put another status.

Okay, this is gonna tell you the difference and then final.

Let's say there's a status called Finalized.

Okay?

Select it, then go there, you see there's nothing here.

No business transaction.

So when you create your own different statuses or you create a new

status profile from scratch you're not gonna have any transactions here,

against the status.

So what do you do?

You just click on this New button.

It's as simple as that,

okay?

And then you're gonna set your allowed status accordingly.

You wanna allow, disallow, forbid, what not.

It's really up to you.

And then.

Click on Sales, Save.

This is important.

Create new status, final for ZQT1,

status profile, and save.

Okay?

Saving this is important.

If you don't save this, go back, you lose it, even for that particular status.

Okay?

And then of course you have to save it again.

All right?

Now, another gotcha.

So let me just take this picture so that,

you know what to do.

You see actually it's gone again.

Why is that?

So go here, and then select this guy, and then click Save.

Go back, let me see if it works again.

Each.

Okay?

What happened there?

[BLANK_AUDIO]

Okay?

Go back lets see again if, yeah.

Those [INAUDIBLE] stop there.

All right?

[SOUND] So let me just show it to you.

So when you create a new status.

[BLANK_AUDIO]

[SOUND].

[BLANK_AUDIO]

All right.

If you created a new status, okay?

First thing you got to do, is select that status and go here.

Step number 1.

Okay?

When you go there, step number 2 is to click on this New button.

First step, and step number 2 is to click on this new

button, and then you'll have all these different

transactions, and step number 3 is don't forget to Save.

Okay?

Very, very important.

Don't forget to save.

All right.

So now that we've got ZQT1, I'll save it, go back.

And the second step is assign, assign

the status profile to, a particular document type.

Okay, we've created a status profile,

assign status profile, to document type.

Now if you wanna do it at the line item level, you know what to do.

You assign it to the item categories.

And for now, let's do it only at the document type.

So select this

and we know the document type that you want to assign it to, ZQT1, all right?

So go there and assign the status profile.

In one of these places.

Where is it?

Must be somewhere here.

[BLANK_AUDIO]

Status profile, all right, there we go.

We don't want this, we want ZQT1, our own custom status profile.

All right?

So let me just show it here.

[BLANK_AUDIO]

Then I'll assign it to ZQT, this status profile.

Okay?

We're done here.

So let's go back.

Save, of course.

Save it, and we're done here.

Let's go back all the way.

So let's go create a quotation, all right?

So, test.

ZQT1, we wanna create it in the same [UNKNOWN] 1,000.

10 00, as usual.

And enter our favorite customer.

[BLANK_AUDIO]

You can use any customer, any sales order.

It doesn’t really matter.

Now, how do you go look at the status profile?

Go to Header > Status.

Okay?

This is how you look at the status profile at the header level.

Okay?

So you created a quotation of the particular type that you have chosen.

And then we are going to Header > Status.

So go there, Header, and Status.

Then you'll see a little button there

called Object Status, all right?

This is a trick.

[BLANK_AUDIO]

So go here, and then click on the status tab, and click on object status.

When you click on object status, you'll

have whole bunch of statuses that we have configured.

Let me go to the next page.

And then

we will see

how these statuses operate, okay?

So you go there and you'll see a number of statuses there.

So these are the statuses, right?

And we said initial, we said not approved is initial, right?

So this one is initial.

That means the current status specified by this radio button is initial.

And then we have all these different status.

Now, can we go from ten to 20?

Yes, we can.

Hit Enter.

Yeah.

Can we go from 20 to ten?

Yes.

Take, click ten, hit OK.

And you see what happens here.

Status NA is not allowed.

But why is that?

Why is status ME not allowed?

Right?

It's very simple right?

You want to go from 20 to ten but it says not allowed.

Why?

And the reason is, let me take a screen shot of this.

So how to move between statuses.

So here is how you move between statuses.

Why don't you just select that status and hit Enter, but sometimes it's not allowed.

In this case, status NA is not allowed, so if we want to move from here to here.

This status NA is not allowed, so why is that?

Let's go to the same old transaction where we have

configured everything and then see what we have configured then.

And why the system is not allowing us to

move between those transactions, I mean between those statuses.

So ZQB1, select and then you see from the lowest, highest, right?

For once the state isn't 20, the lowest you can go is 20.

What is 20?

20 is really this guy.

So let me put that here, so that you can get some perspective.

Okay?

So once the status is in 20, you

can not move back to ten because the lowest state that is possible for 20.

It's 20 itself, is not ten.

But if we would have put ten here, then moving from 20 to ten is no big deal.

All right?

So it's as simple as that.

Now, that is the initial status, and lowest and highest.

Next there is something called as an Oct code.

This is also used quite widely, but, it's not really in our hands.

It's really a job for the basis consultant?

So what is an Oct code?

A Oct code is an authorization code that's given the user

ID, so that not everybody has the authorization to create a protocol.

For example, the approval part can only be

done by a particular user with a particular status.

So you create that status and assign that status here.

Let's say,

these aren't the right ones, but let's say some guy, SCM001.

Let's say this authorization code is assigned

to a particular user ID, the manager.

One manager, two managers, ten managers doesn't matter.

All of them could be assigned this ID.

And any of them could come in and approve

the quotation, meaning set that quotation to the approved status.

All right, that is an Oct code.

So lowest, highest, status, up code and then of course the initial status.

So these are the key things against the status.

Also, the next thing being, if the quotation is

not approved, we have looked at the controls, right?

Most of the things are forbidden, including creation of a sales order.

And we're gonna see that live.

I might try to create an order with reference to this quotation.

All right.

So here's our quotation that we are trying to create.

Okay, all right, we don't want to go to 20.

And let's go here, set some dates and

set the material and click on save.

[BLANK_AUDIO]

All right.

Here is our quotation, 200088.

Ctrl+C and go back to V01 to create an

order with reference to this quotation.

Let's say OR and create for the deference to this quotation.

Click on copy.

We are able to create a quotation.

And why is that?

Because in the quotation

we accept the status to be approved.

Right?

So where is our a quotation?

Our quotation is, let's say, here.

Go to the quotation and you see that the status of this quotation is approved.

And, hence, we're able to clear the ordinal effect.

Let's get another quotation, set it in status as not approved, and then

see if you're able to create an order with respect to that quotation.

All right.

The same thing we have done, just previously.

But previously we have changed the status to approve, but we're

gonna let it remain as it is in the not approved status.

Which is the initial status.

So, go to Header > Status > Object Status.

It is not approved status.

That's fine.

We'll save it and try to create an order off of it and see the result of it.

Okay?

So, here is our, oops, here is our quotation.

Let's create an order with reference to this quotation.

There we go, then click on Copy.

Here is the order ticket.

It is not allowed, because-

[BLANK_AUDIO]

Trying to create an order

with respect to a quotation

in ten not approved status.

All right,

this is how status profile works.

Now we take the other example, I won't do it.

I'll ask you to do it as an assignment.

So here is what you have to do, the

scenario being the same Southern California Edison is the customer.

We are selling him a big power generator.

It costs 5 million dollars, so we want

to reasonably ensure that you know, the place is

ready, it has all the necessary equipment the cables

the coils and the place the condition etcetera etcetera.

So if you're going to create a status profile and assign it to

an order, like this: the first

not initialized, meaning nothing has been done.

The second thing, initial registration done.

Meaning, the order has been placed and the customer called

us and said yes, we are ready, start the installation.

Next, is a site verification, meaning one of

our service engineer will go and verify the site.

Make sure it has everything, after the management.

And ensure that the necessary supplies,

necessary conditions, necessary, I don't, power equipment.

Everything is in place to install this big power generator.

And then install validation.

So the service engineer might be a junior guy.

So somebody else higher up on maybe a senior

citizen, you then will go and validate that status.

Meaning that, that installation.

Is it really ready?

Maybe do a check list, make sure everything is ready, and then

after that inspection has passed then we'll set it to delivery, which

is a signal that the delivery can happen.

And now, look at this lowest and highest.

This is actually from one of a real

example that I have done on a small project.

It is not Southern California Edison.

It's for a, another bio company in the Bay Area.

The lowest is ten, highest is 20.

Meaning, from not registered, which is this.

You can go to 20 which is registration done.

All right, fair enough.

From 20, after initial registration has been done.

You can either go to Site Verification or

go to Install Validation, one of this steps.

Because we have said 40 is the highest, which means

you can either go to 30 or go to 40.

All right.

And, let's look at this example.

Ready for delivery means when the site is ready for delivery,

you can go back to 20, from here to 20.

Meaning maybe something is wrong, start to process all over again,

or you can go to the next status, which is install confirmation.

If everything is done, the customer has

confirmed installation is done properly to his satisfaction.

Yes, set the status to installation confirmation.

All right?

So I want you to do this example, so take the status profile and run

through, visualize this scenario and run through these different statuses, give

them the corresponding lower and higher status, and assign it.

If you created new, you have to assign it to an object type.

Okay, this is the third trick.

We have talked about two tricks you know, how to input

those profiles how to save it that was the second one.

This is the third trick.

When you're creating a new status profile you have to always assign it to an object.

All right?

So where do you do it?

You go here and, I'll tell you were you need to do it.

Okay, and select this object types.

Okay.

Let me just move these aside and actually you rarely can do this.

Okay.

Select it and then

select that status profile and then click on object types.

[NOISE] Okay, select the status profile and click on object types and

when you click on object types you'll see a whole bunch of them.

You just have to select sales order or sales order line, MNOP, QRST.

Sales order header or sales order item, you just have to select one of these.

Okay?

This is pretty simple, you know, don't think too much into it.

It's just related to workflow, meaning is it, there are

technically behind the scenes there is something called a business object.

Bus 2032 blah, blah, blah.

You don't need to really go there.

So it's a technical thing.

So, the step, third important point is,

go to Object Types and assign it to Sales

Order Header, if you're creating a new status profile.

Okay?

This is something you couldn't miss.

And then you go to this new for

each business, each status, set your business transactions accordingly.

What can be done, what need not be done.

Now in this case, for example.

Until

Ready for Delivery is done, you really don't want to

be able to create a delivery for this transaction, right?

That could be an example of how you could

use these statuses to create these different business transactions, okay?

So here's an example of, oh, yeah, whether we can

create billing or not, or if it is not initiated.

Of course you can, you can do billing, you can

do delivery, you can do goods issue, which is right.

And when it is ready for delivery, yeah you can't create a delivery.

You can do a goods issue, right?

That's how you define what can and what cannot

be done in the document in a particular status.

All right?

And you will assign this document to your own document head, let’s say ZOR5 or ZOR,

ZOR009, whatever document type you have, assign that in VOV8.

You assign it to this status profile, right?

Once you do that, you go create an order.

You go to Header and Status and then go to Object Status, and you can see,

you should be able to see all these

different statuses and how you move across them, right?

Because the document is in a particle status.

Can you do the delivery?

Yeah, or maybe not.

And between statuses, how can you move, right?

Can you move it in all the different

statuses, or only particular statuses in the particular sequence?

And that is completely dependent on how you do lowest to highest.

All right, so that's the end of status profile.

So the example that I've given you,

do it in the system.

Do it in the system, post your questions in the forum.

I'll be glad to help you.

Thank you guys