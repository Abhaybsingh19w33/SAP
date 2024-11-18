Okay, Today we are going to discuss project cutover activities.

When we discussed the project life cycle.

As part of a go live, which is step number five.

Hapoel is one of the subtasks.

We are to discuss about K2 in detail in this session.

The reason why we are going to focus so specifically on October.

He's.

It is a lot of interview questions that that come as far as an interviewer activities.

This is one area where people test whether you are you really have experience or not.

So that's why I'm focusing on couple of activities.

All right.

So what is the over?

In order to understand the composer.

Let's take some examples.

Okay, so here is a legacy system.

What is the legacy system?

The system that existed in that company previous to the implementation of SAP.

So from the legacy system examples could be.

Mainframe systems are.

Other ERP we could have many examples of.

So what other examples of ERP like Expandable?

Let's talk dynamics.

So on and so.

From a legacy system when we are migrating.

The sap.

The migrate.

Their entire business processes including.

Master data, transactional data and custom configuration, so on and so forth.

So what goes on from here to here is we migrate.

Number one, business processes.

The same order is a rush.

Order was created here.

And now it's created in the system.

Similarly, master data.

The same customer.

Walmart existed in the legacy system.

The same customer Walmart now needs to be created in.

Transactional data.

See on March 5th.

The couple.

What is happening and.

The users are going to use SAP system going forward on as of March 5th.

So as of March 5th, the legacy system is going out.

So as of that date, there might be orders.

Might be deliveries that might still be pending.

In the legacy system.

All of them need to be transferred over to the SAP space.

That is transactional data.

So the business classes need to be migrated.

Master data needs to be migrated.

Transactional data needs to be migrated.

How do you maintain the business?

How do you migrate the business process?

You do configuration.

So you.

Configuration and customization.

So you don't migrate configuration, but you rather redo them in.

That's the way a particular piece of order is created in a legacy system is different from the way it's

done in ACP.

So you redo all of that in ACP using some piece of coding routines?

Not that.

So configuration and customization needs to be created in the system in SAP.

As of March 5th, master data needs to be migrated from legacy.

Transactional data needs to be migrated from legacy.

At a high level.

These are the key activities that should be performed.

So as we go forward, we'll see.

Um, what are the how each of them should be done.

And um, we'll go into the details of each of these three steps that was cut over.

Now, why is every cut over different?

Every over activity is different.

Meaning.

Although the general principle is the same, every activity is different because.

The week.

October needs to be done cannot be set in stone and say, yes, follow these three steps and we have

to make some decisions.

And see some to see if any extra steps has to be done.

These sunsets can be eliminated.

So on and so forth.

If you take the same example, some legacy system we are migrating to.

Some decisions have to be made, for example, whether transactional data needs to be brought into SAP

or not.

What kind of decision can you make at that point?

Why transactional data.

For example, there are orders for the past six months.

So October, November, December, January, February, March.

The orders have been for the past six months.

There needs to be brought over.

Sometimes yes, sometimes no.

It is based on the discretion of you and the user community.

They might say that we need at least six months of orders.

In which case you will you will you will be responsible for bringing the data.

Sometimes you might say no, no, it's given the timelines.

We might not be able to bank in six months of data only.

We will bring in live data.

I'll talk about life data.

So every customer activity is different.

If you do it in real time, you will understand it.

But as of now, just remember that.

Right.

So there are like 7 or 8 steps in our activity.

These are not set in stone again.

I've just highlighted all the steps that are necessary in a cut over activity.

Some steps could be skipped.

Some steps cannot be skipped.

Like I said, depending on the nature of the cutover, some of the steps are done.

Some of the steps are not done.

But in a general cut over, most of the steps are followed.

In a big budget.

Okay.

As usual, with any step, the first step is the planning over planning.

What is our planning?

What are the steps that are involved?

You just skip to the section where the details are coming up.

Okay, so this is the total seven steps planning system setup configuration transaction Workbench Move

Master Data Migration Transaction Data Migration Switchover to SAP.

Stop.

Seven steps.

Okay, let's go first over planning.

So what is cutover planning?

So we have to do a cutover.

It will take some time.

Big projects, very big ones.

Cutover can take six months.

The activity itself is a project in itself.

In smaller projects.

This will take around one month.

Again in big projects, there will be a dedicated team.

Handling controller.

In smaller projects, the same consultant has to do the cut over activities.

A consultant has to do material management control activities, so on and so forth.

So the beginning of the cut over activities, you define the general roadmap, how we are going to go

about doing this cut over.

But in the same example from Legacy, we are going on to SAP.

Let's say Dell is implementing SAP.

One of the subdivisions.

That legacy is going to go away and they are going to implement it in SAP.

All right.

So tell.

There is already on.

Dell has got a subsidiary.

Selling accessories.

They are on some legacy system, let's say.

They need this since Dell has purchased the company.

They want to bring all their business processes into SAP so that they don't need to maintain two different

systems.

So this could be a big thing.

Maybe the subsidiary is doing $1 billion in business.

This is a big company.

They need to take at least six four months for that cutover to happen.

So there will be tons of master data.

Transaction data.

And business trust is.

All right.

So this subsidiary, this accessories company, is running on a legacy system, a mainframe.

Has

50,000 customer masters.

Okay.

Um.

100,000 materials.

So on and so forth.

In terms of transactional data.

Let's say they do rush orders.

The names could be different, but roughly, I'm just giving you some equivalence.

And they do caching.

There are two quotations.

They do online sales, online orders.

So let's say for different order types and then corresponding deliveries, invoices, so on and so forth.

So as of March 5th, which is the cut over date, they have,

let's say 2500 orders of online orders, 2000 cash sales, 1000 quotations.

5000.

All of them outstanding.

As a general term, any outstanding orders that are meaning orders that have been created.

But not built yet.

Meaning maybe they are not delivered.

Maybe they are partially delivered.

They have not been fully built yet.

So they are called live transactional data.

Okay, live transaction data, meaning they need to be handled somehow.

If the order has been invoiced and paid, then we don't need to bring that over.

Few reasons to bring it over, although sometimes.

The customer insists that we bring them over.

There are very few reasons why we should need to bring them over.

In general, live data is the key data in terms of transaction data that needs to be brought over.

The next stage.

Business classes.

Okay, Business classes.

What we have to configure this is all configuration.

Configuration and customization.

Know and about coding related things.

So given this project backdrop.

The project manager will look at the volumes.

Okay.

How many customers are we talking about?

How many materials, how many orders, any other customization that needs to be brought about interfaces,

data, so on and so forth.

So a general roadmap will be defined.

Okay.

So which will include what?

Seven.

Okay.

Given the severity of the data, how long is it going to take?

It's going to take six months.

What is our budget?

We need to do it in one month.

So like I said, yesterday's man hours calculation.

It takes six months to come, six months of man hours to complete this project.

And we need to do it in one month.

Obviously, we need additional staffing, so additional staffing will be defined and specific roles

will be defined.

Who is going to lead the effort?

Who are going to work under him or her?

And the corresponding responsibilities?

One person will be responsible for master data.

One person will be responsible for transactional data if it is a big project.

Like I said, if it is a small project, the same person will be doing, the same consultant will be

doing all the activities within a month or a half month.

Okay.

There will be in a big project like, for example, $1 billion project.

In which case there will be different countries.

For example, the galaxies.

This company has got.

We have presents all over the world.

So America's.

Europe, Asia, there will be different side.

One side is responsible for America's.

One side is responsible for Europe.

One side is for Asia.

This side is responsible for their respective data because America data could be different.

Europe data could be different, their business process could be different.

Very products I'm talking about.

Okay.

Next thing is war room set setup for hyper care support.

Now, this is a step that.

You've just blind at this point need not be exactly done.

What is a war?

War.

War means.

A typical setup without a war room would be.

So there will be cubicles in the office, so there will be different chemicals in the office and then

they'll always catch it.

Every day you go for a meeting, you talk about the status, and then you go back to your work to go

about doing your own stuff.

He could do it at home.

We could do it in office or lawn or wherever.

In a war room, however.

What happens is.

Everybody in the team that is responsible for this cut over, let's say.

Will be brought into brought into a single conference room.

This is very critical that the cutover happen exactly the way that you have designed it.

Everybody will be brought into a conference room depending on how big the project is.

It is very big.

Then maybe there are 25 people.

All of them will be brought into a conference room.

Okay, Let's say this conference room is somewhere in America.

Where is Del?

Del, let's say is in Atlanta.

I don't know where it is.

I'm just taking an example.

I think it's in Texas.

Okay, So then everybody will be brought to a conference room and that's called a war room.

Okay, so the conference number will be switched on and the Europe lead.

European team and the Asia team will join this conference call and they will have to stay alive for

8 or 9 hours a day.

Why?

Because any time there is a problem, there is some issue, there is some problem, everybody will be

up there.

So you can't say that I'm I'm having an ice cream somewhere or I'm doing something else somewhere.

Right.

Everybody needs to be there and they'll provide you refreshments and pizzas for lunch, and soda will

be available.

Everything will be available.

That's kind of one.

Why is the volume done so that things go at a much faster pace?

Okay, Now this can be done as part of the tower planning at the very beginning of it.

Or.

This can be done.

At the very end of the planning, let's say your planning itself is six months.

So this is zero.

This is six.

So one month, two months, three months, four months, five months, no problem.

But six months for this one month or 15 day period, then everything needs to be done and finished up

then.

We'll start over here.

Volume will start and end here.

Okay, one second, guys.

Hold on one second.

He.

All right, I'm back.

Um, so that's the wardrobe.

Okay.

The second major step is the basic system setup.

I'll keep talking about these different things like set up our master data setup, but like if you don't

understand some part of it, that's absolutely fine.

You just have to understand the basic flow, the seven steps that I talked about.

And this is step number two that we are talking about right now.

In terms of the details that go on using that step.

If you don't understand some of the steps here and there, that's fine.

You don't have to worry about because it's all theory.

Unless you really face it, you won't understand it and it might take some time for you to face that

thing because not every project might happen.

I'm giving it to you based on the years of experience that I have.

So obviously it will be difficult for you to understand.

So not to worry if you do not really understand some of the steps.

Just soak in whatever you can.

Whatever you're not able to soak in.

Okay.

No worries.

The second step is system setting.

Okay, so the planning is done.

We know how much how many people are there?

What are the total activities that need to be done?

All of that stuff is done.

And the first thing is the production system needs to be set up.

The major part of it, apart from the installation licensing patching, that will be done by the basis

consultant.

You don't have to worry about it.

The hardware sizing also done by basis consultants.

But they will take inputs from you as the psycho.

The inputs that you are going to give them is.

Volume.

Number one and number two, user base.

Okay.

These are the main data volume, meaning the system administrator or consultant will ask you, okay,

how many?

Since orders are you expecting to create per day, how many deliveries are you expecting to create per

day?

They can go and ask this to the direct sales users directly, but you are a more.

You are the link for that.

You can ask your users and say, okay, what kind of sales volume are you expecting?

What kind of delivery volume are you expecting?

And so on and so forth.

User base at any given point of time.

How many users can be logged on and what is the total number of users?

So for example, in this case of bringing over that company, Right.

So Dell.

Dell has bought this company.

That sells accessories.

This company has a staff of, let's say, 2500.

That's the staff for that company.

2500 people.

This number of people.

When logged on to the system, obviously puts on a lot of load on the system so the system administrators

have to plan the amount of memory hardware, the compute, the computing power, so on and so forth.

So this is the total number of users out of all of them.

Not all of them might use.

Right?

Only like 500 users.

Rest of them are like H.R. and there different departments which might not use SAP or they are sales

guys who go into the field for.

So all 500 of them use it.

So this system administrator or the basis consultant has to take.

Into account that 500 additional users will be added to their system.

S2 userbase volume.

How many orders are this company doing per day?

Maybe 1000 sales orders a day.

1000 sales orders.

2000 purchase orders.

And then.

Uh, 300 deliveries, so on and so forth.

So in total, you might say a total of 7 to 7 K to eight K transactions per day.

So again, we'll let them know.

Okay, this is the total number.

So the basis consultant will size their hardware accordingly.

That's called hardware sizing.

So planning the hardware based on the volume of transactions and users that is going to be using that

system.

Okay.

So they'll have some formula based on which, okay, if so many transactions are going to be done,

so many users are going to be using the system, What is the amount of Ram that I need?

What is the amount of hardware processors, how many processors and so on and so forth.

There is a simple formula for it that has provided you can just use it based on the hardware you use.

So many Dell use so many, so on and so forth.

Okay.

The next thing is the landscape setup.

And transport management.

Okay.

Landscape means I hope you have gone to the landscape.

Landscape means what is the system?

What is their staging system?

What is their quality system?

What is their reproduction system?

In case of this devil, you don't need to set up the landscape because they'll already have the landscape.

So when you are migrating, this will just follow the landscape.

But if you are implementing for a new company, then the landscape needs to be set up again.

You don't have to set up a landscape.

The system sometimes will set up the landscape, but you will take inputs from Fico, so on and so.

Okay.

So you will have to provide the basis consultant as to how you want the landscape to be.

Do you want a pre-production system?

You have to tell it.

You you like all of them, will tell them.

Okay.

Next thing is interface setup.

So this company might have interfaces to file based interfaces.

And different kinds of interfaces that interface, for example, for orders.

Orders might come in via an interface, invoices might go by platform.

Interfaces.

So different kinds of interfaces.

Come in and go out.

And they also need to be set up in the new environment.

The environment that.

Is going to be used going forward.

The environment.

All of those interfaces might require an for example, an interface needs to be set up in the partner

profiles is to be set up many different things that need to happen.

Flat file interfaces means some FTP servers needs to be set up right to be set up.

There are many things that need to be set up.

All of these things that we are defining here.

Most of them will be done by the basis.

But you will have to give your inputs.

They just wouldn't know what to set up until you tell him that there is an area that is flat for.

Okay.

He'll do it for you.

But you have to tell him what needs to be done.

And so there is a.

There is a set of meetings that go between basis and the functional consultants where the requirements

will be given to basis and basis will configure the system accordingly.

So the basic system setup will become.

Third thing.

Third step, major step is configuration.

Assuming that you are all done for the three months or four months you have it, you have designed everything.

Then finally that day has come when you need to move the configuration.

You are ready.

The March 5th that I was talking about.

No.

What?

The first thing in a couple activity after the system has been set up is configuration mode.

What is configuration mode?

Configuration mode means.

All the activities that have been done.

Right.

So if you go to Sbarro.

Let me show you all the transports that I have created.

Every time you go to do a change, what happens?

It will ask you for a transport request.

Right.

And that transport request, like I said, is a way to record the change that you have done.

And can you record can you see all the changes that has been done?

Yes.

Go to SG one or SC zero ten.

SC ten.

Okay.

And if you remove your username, all the transports will come up.

If you put your username, all your transports will come up.

In this case we are very minimal number because I have configured everything under one transport.

But if you look at your transports, if you have created one for each, which is the ideal way to do

things, then there will be a whole bunch of things.

Oops.

See, this is how it will be.

So Raj has done some have done some stuff.

This is how transport.

Are recorded.

So many transports and all of them used to be moved to the test system.

So how many types of transports are there?

This is important.

Okay.

There are two types of transports.

You see.

Workbench.

She grabs everything else.

There are two types.

Workbench and customizing.

These are the two main types of passports.

Customizing passports means anything that you do on the SPRO is customizing generally.

Type configuration.

Playter transports any piece of coding.

Will come under workbench.

This is customizing.

This is what?

Good.

That's amazing.

Now, then confederation moves are done.

There are some there are there is a sequence in which you need to move them.

Meaning.

So if you go to a customizing mode and say, okay.

This is.

Look at this man.

K900216.

And then there is 9000214.

So which needs to go before that 214 needs to go first and 216 needs to go next.

What and why?

You might ask me.

Just take a simple example.

PR number one.

I'm just taking a simple example.

Number.

This defines new customer.

You are number two.

This defines new.

Any other data and customer master new tax classification.

Okay.

Number three, this defines new customer account group.

Okay.

Now, in this case, customer group tax classification and customer account group are totally different

business entities, meaning they are not related on one another.

They can go the way they like.

You don't need to see.

Because when you create a new customer account group, it doesn't matter whether a new customer group

is create or not.

No problem.

Okay, now look at another example.

Again, number four.

Access sequence.

If you create an access sequence, call the div.

Number five, create a new condition.

ZC o n and in which in the conditional type definition itself, you assign to it access equals to Right

now look at this if four doesn't go first into the that is not transported first, can five be done?

No.

This will fail.

Right.

This is called the R dependency.

And the way it's enforced is by our numbers.

So you take the first number to one for first and two, one six next to one, two, next and two, one

for next.

They go in sequence.

If they do it in sequence, then you don't miss the order.

That's very important.

Okay.

And this will generally take care of it.

But I'm just giving you some information about the sequencing.

This is about Diaz.

Diaz are done in sequence, so no problem.

What about non configurable transports?

Some some non transportable conflicts.

Some configs are not transportable.

Okay.

These are the conflicts number ranges.

VN zero one.

Okay, Let me go to the zero one slash ten zero one.

Okay.

So if going to define a number range.

Okay.

Any number ranges that you define here are transportable.

Because the number ranges are not transportable in the first place.

Why?

They are not transportable.

There is a reason to it, but let's not go there.

Number ranges are not transportable.

So this is a dev system.

Sewage system, production system.

So there is a number range defined here.

Zero one stands for 1000 to 2000.

Can you transport this?

No.

You have to go into this system, and then the file number ranges again.

Same thing.

You have to go into the system, go to Sbarro and define number ranges again.

Similarly, any updates to the tables period?

Opening closing variables?

Don't worry about all of that.

But there are things that are not transportable and has to be done in the system.

And the prime example for that is number ranges and these are the other examples.

Okay.

Next workbench was like I said.

User access, coding reports, body bodies, any other piece of coding are all part of workbench, so

you don't have to worry about what benches exist because workbench will be taken care of by the consultants.

Okay.

Any other settings like job variants setting up of jobs workflow.

Okay.

If you don't understand that, that's fine.

No worries.

Next is master data migration.

Step number five.

What is master Data Migration?

All the different masturbators, recognition records, Customer master material Master Customer Material

Info Records.

Vendor.

Master.

Asset.

Master.

Master.

All of these are examples of master data.

What is master data?

You know what master data is.

Can master data move after transaction data?

No.

Simple example is, for example, customer thousand needs to go first and then orders data to customer.

Thousand can go.

This has to go first, then it will fail.

If you have not created it as simple as that.

So the thumb rule is master data always goes first between master data and transaction data, and transaction

data goes next.

What are the examples of master data?

We have created customer master.

The ones that we are interested in is customer master customer material for records condition records.

Consultants will do customer and vendor masters.

So we are not responsible.

Okay.

The next is the sequencing of master data migration.

So like I said, master data needs to go after config.

C config needs to go first.

Master data needs to go next.

Transaction data needs to go next.

So this is where step number three and four is where your config and customization moves.

Next master data.

After that transaction data.

I hope you understand the reason why.

If you create an order in a system without a customer existing, it will fail.

So massive data needs to go before transactional data.

If you create a master data with account 001 account group and if G01 config does not move, then again

we have a failure point.

So the sequence is like this.

First.

Customization.

Chicken master data.

Turn faction.

This is very important.

You have to remember it.

Okay.

Next is transactional data.

You know about transaction data.

Transaction data means orders.

Deliveries.

Billion.

TGA documents.

Now when doing transactional data migration, this is important.

Which data to migrate?

You don't need to migrate all the data from the old system.

It's from the legacy system.

Is it really necessary to migrate all the data?

Can you do with just.

Some other data, like only part of the data.

Only data that is live.

Only data that is as old as one month.

That is a decision that's made on a project to project basis.

Depending on the requirements, depending on the load bandwidth and the available manpower.

That decision is taken.

Live data migration is the toughest part of cutover activity.

Faster data is easy.

Configuration is easy.

Transactional data.

Live data is very difficult.

Let's not go into the reasons as to why they are difficult.

But the bottom line is it is difficult because there are so many considerations that have to be done.

And then.

Because it is difficult and decision may be made as to whether how much data needs to be migrated,

the minimum possible data value.

Okay.

Like I said, the basis for selecting the subset of data, the minimal set of data will be live data

first.

Anything that is still live, meaning an order that has not been delivered, is live data in order that

has been partially delivered.

Is live data in order that has been delivered but not built yet is also live data.

Right order delivery billing that is complete.

Then it becomes.

All we need to do is collect payment.

That data needs to be migrated generally unless the user specifically asks you to migrate.

So the key is to identify live data and move it.

Live data means anything that requires further.

Like I said, part of that needs to be delivered order that actually delivered deliveries, but not

the immediate build, but put on a building block or put on posting block.

But this transactional data migration.

Okay.

After all of these six steps are done.

Seven steps is the switchover.

So on that fateful Saturday or Sunday, March 5th.

The takeover activity.

After all, the takeover activities have been complete.

The old system will be shut down.

Okay.

That's when the war room will start, user communication will be done, users will be communicated saying,

Hey guys, your whole system is out, the new system is in and the basis will create their user IDs,

passwords and whatnot.

The war room will be started.

War room because system has gone live.

So then we obviously need tons and tons of problems.

So everybody will be ready for the users for the business to run smoothly.

This is switch over to SAP.

Any other support activities that need to be done?

End user queries.

Some user items might not be created properly there.

Their authorization might not be there properly.

They need to be given right authorization to create orders, to create master data, so on and so forth.

There might be errors here and there.

You might have to correct it.

Okay.

And finally.

So that's exactly when Hyper-k starts.

Let's say we are switching over on March 5th.

Box.

So at that point, hyperscale starts.

So everybody will be on their toes to support the users and make sure the business goes as it has planned.

And from that point, like we discussed yesterday, the Hypogea might continue for one month or 15 days

or two months, depending on how big the project is.

If it is a big project, Hypogea continues for around 1 or 2 months, smaller project is okay, so smaller

fixes, bug fixes, enhancements will be taken care of with the hypocaust.

So anything that stops the business from happening will be we have to be absolutely taken care of in

hypogea.

So any other enhancements?

Something the customer can live with, but they are required.

Um, because that pain will be taken care of after care.

Okay.

So and then after the 15 days or one month and Hyper-k is over.

Transition to full fledged support.

There will be a dedicated team that only takes care of support.

Only text support means general queries, small enhancements, big enhancements, bug fixes, defects.

All of them will be taken care of by a support.

Support model will be a separate set of people.

Find people ten people, 100 people, depending on how big the project is and they will only be bringing

support for it, will not be doing any major developments.

Only support activities.

So that's how.

The project culminates.

Okay, so that is the end of our activities.

Any questions?

Anybody have questions on our activities?