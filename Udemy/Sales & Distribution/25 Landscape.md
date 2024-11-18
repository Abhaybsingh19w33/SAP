Hi, guys.

In today's class, we are going to talk about a theoretical subject.

You don't have to do anything in SAP.

What?

You have to understand the concept.

Topic being the system landscape.

So what is a landscape?

This is a term that is specifically used in SAP.

A landscape means.

How the different environments in SAP.

Are stacked together and how they are interconnected.

When you just get started with SAP, you might think that there is only one system.

But you if you have any level of SAP or experience in general, you would understand that there are

different systems supporting the main production system.

Call it a development system, staging system, quality system, pre-production system, so on and so

forth.

They are also called environments.

So.

Quality Environment.

Staging.

Environment.

Pre-production.

Environment.

Development.

Environment.

So on and so forth.

An environment is just a fancy name for an instance.

We are going to talk about a very minimal landscape and then we'll move on to describe more complicated

examples.

The minimum landscape that I am talking about has three systems.

Development system.

Quality system.

Production system.

What is the role of each of these systems now?

A development system.

Is an instance of SCP

where you can do configuration.

Which is.

Anything under Sbarro.

And in the same development system, your Abap consultant will be doing Abap development.

This will include programs.

User exits

reports and all the technical stuff.

And in this environment, you also do unit testing.

What is unit testing?

For example, you create a new order type, say as a copy of or you create Z or.

This document type needs to be tested.

As to how it behaves when you create that order.

How it behaves based on the configuration you have set.

For example, if you have set the immediate delivery on for this flag, this document type.

Then when you test it by creating an order, the delivery should be created immediately.

We are testing whether the expected functionality is working properly or not.

When you do it at a smaller level of configuration.

Let's say a document type or a newly created item category or a newly configured copy control.

This is called unit testing.

As opposed to other kinds of testing, say systems testing, integration Testing.

Full cycle testing.

User acceptance testing.

So on and so forth.

Which we are not worried about at this point.

We will talk about testing in another class.

So here are the basic things that you do in a development system.

The next system is the quality system.

When you log on in the SAP log on pad, this will be a totally different instance.

You will select a different server.

And then click connect to connect to it.

So why does the quality system exist?

When you are able to do so many things in a development system, why does a quality system exist in

the first place?

The primary roles are the primary things that you do in a quality system is let the users perform user

acceptance testing.

U80 stands for User Acceptance Testing.

Second thing you will do, integration testing.

Which is a kind of testing that involves full life cycle plus interfaces.

Think of it like a full blown version of unit testing.

You'll do that.

And you will also check for Go-live readiness.

If you implement a particular piece of functionality, it's in the quality system that you make sure

that things are as close to the production as possible.

A development system is more rustic.

It's not close to a production system.

But a quality system is much more closer to a production system in terms of data, in terms of configuration

test data, so on and so forth.

We'll talk about Go-live readiness when we talk about this SAP project lifecycle.

And finally, we have the production system.

This is the real thing.

This is where users will actually be creating sales orders, looking at reports, performing deliveries,

billing, so on and so forth.

The data here is the actual business data.

No dummy data.

No testing.

You will not be given access to this system in a write mode, meaning you cannot do a VA zero one you,

meaning you as a functional consultant.

You cannot do any of this stuff.

You cannot create anything here.

But you are supposed to see what's happening there.

That's why you'll be given VA zero three Vl zero three all kinds of display transactions.

So you as a functional consultant will be given display access to production.

So who will be doing these transactions?

Create and change your users.

These are the people for which you are configuring the system based on their business requirements.

So no testing in a production system.

A production system contains the actual data.

The users will be creating orders day in and day out in the production system.

They will not create orders here.

They will not create orders here.

These are all supporting systems for the final system, which is the production system.

All right, let's go a little bit deeper into our sandbox and understand the components in IT development

system.

Sometimes the development system is also called the sandbox.

But we will understand the different components of a development system.

Once again, you have to understand what is meant by a client.

We have talked about client a couple of times already, but I'll just briefly go over what a client

is.

When you log in to SAP, say select your server and click on Connect.

Type in your username, password, blah blah blah.

And the default client here is 800.

So what is this client really mean?

Do we have an option?

Can you choose something else?

Yes.

If you have the password, you can choose another client.

So what is this client?

Every system will have one or more than one client.

Not every system.

Every development system.

Quality and production will only have one client.

But every development system will have more than one client.

And the client that we have logged into here is client number.

800.

So go to system status and then you'll see that the client is 800.

Are there more clients in this instance?

Yes.

Go to ask for the transaction is CC4.

Click.

Okay.

And then you'll have a whole bunch of clients.

100.

Sorry.

000001 808.

And so on and so forth.

These are all the different clients that you can log into.

If you have the required authorization.

But in a real system, you will never have 800.

This is something that you have to remember when you go to a project.

You will never have 800.

As a client.

800 is always an ideal client meant only for learning.

So in a real project, your development system will comprise of at least two clients.

One is called a sandbox client.

The second is called a golden client.

A sandbox client could be represented by, let's say, 100 and a golden client could be represented

by 200 or any numbers.

Generally it will be like 100, one, 20, 140, 200, so on and so forth.

And then you see a lock here.

That means that this client is locked.

What good is a client if it is locked?

And what is meant by this lock?

A golden client is a client where no master data exists.

That is, if you go to zero three and try to look for customers, they don't exist.

If you go to zero three and look for previously created sales orders or quotations, they don't exist.

So a gold client is locked for creating master data or transactions.

Well, you can create them, but you're not supposed to create them.

So please be very careful when you do anything in your project in a golden client.

Make sure you don't create any master data or transaction data.

Think of it like a thumb rule that you can never break.

Okay.

And the second thing, this is only used by functional consultants.

Only functional consultants will be given access to the golden client.

So what do you do?

They're only functional consultants can do can get access to this.

And you're not supposed to create master data and transaction data.

So what else do you do in a golden client?

Well, anything in SP Pro can be done here.

Enterprise structure, customer account, group pricing configuration.

Anything in SPRO can be done here, and that's the only thing that is done there.

And anything that you do needs to generate a TR a transport request, as we know, and a golden client

is the originator of customizing transports.

I said customizing transports as opposed to another type of transport called a workbench transport that

we're going to talk about in a bit.

So all customizing transports.

Customizing transports means anything that you do under SPRO will originate here and there will be a

unique TR for it.

Example You create a new company code.

You go to SPRO Enterprise structure, create a new company by copying an existing company code, Save

it.

The system will create a new transport request.

And that will be a unique transport request that originates in a golden client.

So whenever you want to create a new company code, new configuration in pricing, you always go to

the golden client in the dev system.

So what does a sandbox?

Has to do.

A sandbox is where you can do configuration, where you can do customization, meaning write code,

you can do master data, you can do you can do anything in a sandbox.

A sandbox is a play box.

All right.

A sandbox is a play box.

You can do basically anything in it.

So it's a testing environment.

Remember, unit testing, you can create sample data.

You can create customers, materials, orders, test them.

You can create thousands of them.

You can do whatever you want there.

Sometimes even system testing is done there.

Apart from unit testing, you do full life cycle testing also in a sandbox because in order to really

test something, you need master data and that's not available in a golden client.

Remember, only sandbox can have master data or transactions.

And the second thing is workbench requests originate here.

So what is this?

Workbench?

Anything that is not configuration but has a transport request.

Example, you create a report.

A custom report you meaning your Abap consultant.

It will not create a customizing transport request, but it will create a workbench transport request.

All right.

So that's the difference between a sandbox and a gold client.

These are, like I said, logically separated by a different client number.

A sandbox will have a different client number.

A golden client will have a different client number.

And there are two ways in which you can replicate the configuration from a sandbox to a golden client.

Let's say you wanted to create a new order type from or Z or.

But you when you create it, you need to test it and make sure everything works.

So you go to SPRO, IMG sales and distribution, blah blah blah.

Go to or make a copy of it.

Create your and it creates a TR.

And after that you create some orders.

Using some master data, you create some orders in the sandbox.

All in the sandbox.

You test it for a couple of hours or days, make sure everything is working according to your requirements.

Then finally, you want to take it forward to the quality system.

How do you do it?

Remember, this is a customizing transport request, meaning something that you do under SPRO.

So generally you replicate that entire piece of configuration in the golden client because customizing

transport requests can only originate here.

Remember, there can be done here, but you can do nothing out of it except test if you want to take

it forward to quality system, you have to do the configuration here.

One way to do it is to replicate everything here.

Meaning you again, go to Sbarro in the golden client img blah blah blah.

Go to or make a copy of or called Z or R and then create a transport request.

This is called manual replication from the sandbox to the Golden client.

Manual replication is just a fancy word for do it again manually.

There is another transaction called SCC, one that you can execute here whereby if you specify this

transport request of the source system, the entire configuration that you have done for against this

transport request will be pulled into the target system.

This is called pulling in the transport request from one client to another.

You as a functional consultant can do it yourself.

So between clients in an instance, the clients here being sandbox gold client and the instance being

dev, you can either replicate the configuration or use one to pull the transport from one system,

one client to another.

Now, that's the deal with customizing transports.

What about workbench transports?

Meaning anything related to code?

Your abacus will not be given access to gold Client So where will they do their configuration?

Their transport requests?

They'll do their transports in a sandbox.

So all workbench requests, transport or transport requests originate in a sandbox.

All golden client clients will only contain customizing requests, so customizing requests originate

here.

Workbench requests originate here and they move to the next system, which is a quality system.

Now.

And then from that point on, after U8 is done here, they move to a production system after validation.

If the user says, fine, we move it to a production system.

Now we are talking only about a three system landscape.

There.

She prayed.

Can you do more systems?

Can you have more systems in your landscape?

Yes.

You can have more systems specifically when parallelly a project is going on.

Let me give you an example.

There is a company.

A, B, C, electronics.

They are on SAP and they have these three different instances.

Dev Shah pad.

Now, this ABC Electronics has acquired a new company called X, Y, Z Electronics.

And they wish to incorporate their business processes.

Meaning X, Y, Z electronics business processes should be incorporated into ABC Electronics.

So it's a project in itself.

So how do you do it?

You don't do it all together on a dev system.

You start with a new

development system.

This is dev, call it dev one or D one.

Do all your configuration here and then move it to a new quality system.

Make sure everything is tested here and once it is done, then you move it here and then here and then

here.

Now if you don't understand this as to why it is done, that's absolutely fine.

Don't worry about it.

It's not really important.

Your primary focus should be these three different systems.

Dev QA.

Dev.

QA PRD.

The rest of them are not very important at this point.

Now it will not It's not just dev shaper of.

There is CRM, there is CRM, there is APO, so on and so forth, many different instances.

And each of these instance, each production system in SEC, CRM, so on will have their own system,

landscape or five system landscape.

So if a company is implementing SEC and CRM, at least at the least, it should have six systems one,

two, three, four SEC and 456 for CRM.

Okay.

Now there is another product from SAP called the Solution Manager, which, apart from doing other things,

can do licensing, patching, administration and monitoring of so many different systems.

So if you take a big company, say Apple, Best Buy, Dell, they'll have so many different systems

that it's very difficult to license to do patching, to do administration monitoring of so many different

systems individually.

So SAP has come up with a product called the Solution Manager, which can take care of managing all

the different instances from a single point.

Okay.

So that should be enough for you at this point.

To learn more about to, um, understand what a system landscape is.

So in summary, we have learned what is a system landscape.

We have talked a little bit about gold client sandbox and briefly about solution manager.

All right, guys.

Thank you.

Bye.