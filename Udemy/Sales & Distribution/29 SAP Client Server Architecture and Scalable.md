# 125. SAP Client Server Architecture

Let let's discuss a little bit about the architecture of SAP.

When I mean the architecture, we're not really going to do the architecture at a very technical level.

It's going to be at a very high level, but just only enough to understand what's really going on.

When you log in and do your transactions and what would happen probably when you would have to deal

with some optimization issues.

We'll talk about some examples.

Let's say this is me.

I am logging in to the GUI.

Let's take this example GUI example.

Right.

So let me log in to the GUI.

So I select my server, click connect, and I get this screen and the first thing that I do is enter

my user ID

hit.

Okay?

And I get this screen.

Okay, let's stop here and try and analyze what just happened.

So in the GUI, we fire it up and then we entered the user ID and password.

But before even we enter the user ID and password, the system has already communicated with the server

and gave us the login screen.

And what kind of communication is that?

This guy is on the client side, meaning it's on the PC, it's on a mac or it's some kind of a front

end, like a like something that the user interacts with.

And as soon as I log in or try and connect to the server, the request, let me change the color.

The request is sent to the server.

The server could be residing anywhere the server could be residing in in US server could be residing

in Canada, it could be anywhere.

In fact, companies all over the world could have one server in the United States and all the users

in Singapore, Japan, Russia, India or Brazil could all be connected to the same server as long as

they're on the same net.

Now, as soon as I fire up the GUI, a communication is happening with the server.

And what's a server server is a big piece of hardware, right?

It's like a super turbo version of your desktop.

In fact, it need not be just one.

It can be more than one, which we're going to see in a minute.

So this is the hardware.

It's a computer.

And let's say it's a computer, right?

It's a computer that takes in this request.

Analyzes it and response to it.

So let's say the response is in red.

Okay.

So the input or the signal that goes to the server is in green and the response is in red.

Server is responding and I get the login screen right?

So I get the login screen like this.

I get a user ID and a password and hit enter and as soon as I hit enter, somebody has to validate it,

right?

So again, it goes to the server request, goes to the server and the server responds with a response

saying yes, you're you're okay to go through or probably not.

If I enter a wrong password or use the wrong user ID.

Okay.

Now this is with the GUI.

GUI is like a dedicated piece of software.

But it's not just the GUI.

You can use for example, you can use a browser, a user can use a browser.

This need not be a GUI.

It's called the web GUI, which is a fancy word for accessing SAP through the browser.

And this is your browser.

And you can use the browser to connect to the server.

Let's connect to the server.

And the server responds with some kind of a response which could be a result of a login, or it could

be a result of a sales order being saved or whatever action that the server needs to take.

So there are a couple of things that are happening here.

First thing being all the processing is happening on the server.

It's not happening on the client.

The client, meaning if I want to divide all this stuff into layers, this is my client layer client

and this is the server.

Okay?

So it's also called the client server architecture, where the client is the GUI or the web GUI or any

other form of front end that the user interacts with.

And the server is where all the processing is happening.

So the first point here is the server is a place where all the processing happens.

The second thing is the communication between client and server follows different kinds of protocols.

Now if you don't know what a protocol is, that's fine.

Over here it uses a language.

Now the language you can talk of protocol as a language.

The communication between the dedicated sapgui and the server is called a PC and between the browser

and the server is Http.

Okay.

If you don't understand that, that's fine.

You know, it's no big deal.

The second thing is the protocol uses a variety of protocols Cpic or Http.

These are the common protocols used to communicate with the server.

# 126. More users ? No Problem.. SAP landcape is Scalable

Okay, now what about the server itself?

Now what's really happening on the server is it's just a single box.

Well, it could be technically a single box, a single propped up CPU, but it could be a little more

complicated than that.

So let's analyze why you would want it to be complicated or why you would want it to be much more than

just a server just serving up some requests.

In order to do that, let's let's understand a little bit more about what would happen if I am logging

in and a whole bunch of other users are logging in.

Okay, so this is me.

I'm staying in India, let's say.

So I'm staying in India.

And I am trying to log in using a GUI and then like me, there are many other users

logging in from the US, let's say.

Logging in from the US.

Let's say this is a 200 users and then.

So this is another 100 users logging in from UK all through the guy doesn't matter guy or through the

browser all the same.

Okay, so this is the client and and each of this user could be performing any type of transaction.

For example, I could be doing the creation of a sales order.

And I would do it for like a minute or I could be doing it for five minutes.

So all along the server has to preserve my status, my data, right?

So whatever I'm entering is supposed to be stored in the server until I either log off or time out or

I cancel and these other 100 users could be doing 100 other things right?

They could be doing the creation of a purchase order.

They could be just logging in, logged in, or they could be doing a creation of a master data like

customer master material master.

See, each of these guys could be doing anything that's possible in SAP and for each of the user, the

server has to maintain what's called as um, status, where the system server is going to store a whole

bunch of data.

And this is called user data.

There are some technical terms for it like role area and all that, but we're not interested in that

part.

We just want to see that.

We want to just understand that for each user, the server stores an amount of data.

That data is stored in the memory.

And every time I do a transaction, every time I do an action, like let me give you an example.

Let me log in and give you an example.

Let's say I want to do a sales order.

So I go to zero one and put in or ten zero zero and then click okay, and I enter some customer details

like that.

Now, at this point, I've just entered the customer details and it has pulled some data and I'm right

here now I can go have a cup of tea and still come back and continue to work on it.

So all through this time, SAP has to preserve my data.

Like, you know, what's the customer number that I have entered?

What other details has the system pulled in?

Like my name, my address, blah blah, blah.

This is called the user data and SAP has to maintain this user data for every login.

So I could be doing not just one transaction, I could be doing more than one transaction.

For example, if I say slash OVD03, which is the customer master, right?

It opened another window and then I open this customer.

Now if you see there are two windows that have opened or two transactions that I'm performing right

now.

One is the creation of a sales order and the other is the creation of a customer master.

So in my case, SAP has to store data for both these transactions, right?

One is the sales order, the other is the customer master, right?

Like that SAP allows you to open six simultaneous sessions.

So for every user, SAP has to store six different sets of data that the user could be potentially performing,

like sales order here, customer master here, something else and something else, right?

This is the first complication.

So there's a ton of data that needs to be stored.

The second thing is when a user logs in through the GUI right on the client and, and the server also

has to dedicate an amount of CPU resources to, you know, act on that data.

Meaning I'm trying to create a sales order here, right?

Zero one And when I do that, when I create the sales order, the system has to allocate some CPU resources

to me, right?

So this is the CPU.

The earlier example of storing data was memory.

Now it's the CPU.

So the CPU resources are of course limited.

So a dedicated thread has to run and allocate some CPU resources to me and the CPU resource is not unlimited,

right?

So there are only so many processors that can be in a in a server.

And when you look at the CPU resources, I'm not the only user, right?

So there are so many other users, let's say I'll draw them in green, so, so many other users, so

logging in and the system has to make sure that, you know, it balances between the amount of CPU and

processes that it has and the number of users that are coming in.

At the same time, it has to appear that it is responsive to everybody.

So how does it do it?

# 127. Nuts and bolts of an App Server

On the server and the system is architected like this.

Let's say this is the server.

So this is the gateway.

What's a gateway?

A gateway is a process or a sub process inside the server that is responsible for communicating with

all the client requests.

So this is the gateway.

So this is the request that's coming in.

It hits the gateway.

Once it hits the gateway, the gateway looks for what's called as a dispatcher.

This is called as a dispatcher.

Okay.

This dispatcher is responsible for looking at the requests that the gateway has sent, and it looks

at what's called as a work process.

So these are all work processes.

So work process or let me write it down.

It's called a work process.

So these are all work processes and the dispatcher looks at the work process that's free, that's readily

available and dispatches the request to the work process.

And this work process will handle this request, do what's required, use the corresponding computing

power.

And of course, it's going to send back a response.

Via the dispatcher to the gateway all the way to the guy.

So when you hit V01, this is what is happening.

So it first goes to the gateway, then looks for the dispatcher.

The dispatcher looks for the available work processes and takes the first stab at the work process.

Let's say if it is this work process, it goes here.

And if it is the second work process, it goes there for the third work process or whatever work process

is free.

It picks it up and sends the response to that.

And the work process will actually look at your request and see that, let's say if it's a creation

of a sales order, it will look at the corresponding program that needs to be pulled up and it will

compile the screen and send the screen to the user.

Okay.

So far so good.

What would happen if the users increase?

So it's not just me, but there are 300 users.

So what would happen then?

A number of work processes might not be enough.

One server might not be enough.

There might be more servers that are needed.

So what would happen then?

So SAP has architected its server in a very scalable way.

So let's say again, we have this guy request coming in and the request is coming to the server and

on the server end, if you want, you can architect it in such a way that you can have more than one

server.

What do I mean by more than one server?

So it's more than one physical piece of hardware.

So this is one box of server.

This is another server.

This is another server.

So what are we doing here?

We are trying to distribute the load.

So we're saying, okay, it's not just you.

You don't need to run this on one server.

You can run it on multiple servers.

And how do they all communicate with each other?

The communication between them is run by one process called the message server.

Message Server.

What's the message server?

This communicates between the different pieces of hardware.

So what are the processes that are free?

What is the server that is lightly loaded?

What's the server that's heavily loaded?

How can the work be shared between these different servers?

Is all taken care of by this message server and each of these boxes could be running an application

server.

The app server.

App server here and app server here also.

Okay.

The message server is only one, but the app servers could be one per each machine.

Now when the request comes in, the request could be routed to any of these different boxes.

This, this or this, depending on which which server is lightly loaded and the communication between

the servers happens via the message server.

And in each of these app server, look at the previous picture.

Each of these app servers write boxes really comprises of a gateway, a dispatcher and a word processor.

This is an app server

and each app server consists of a gateway, a dispatcher and a work process.

And you can have more than one app servers when with one message server taking care of the interactions

between all the different app servers.

This is called the application layer or.

Application layer.

Okay, this is all processing and memory, but where is the data stored?

The data is stored in another layer called the database layer.

This is called the database layer.

Database layer.

Okay.

So probably, you know, most of you know what databases are most popular examples are Oracle, MySQL,

SQL Server and so on.

And between the app server and the database layer, there is a very thin SAP component.

Making sure that databases work fine.

What do I mean by that?

SAP is a database agnostic, meaning it doesn't matter if you use Oracle or MySQL or SQL Server.

SAP is not bound to a particular type of database.

There are instances that use Oracle, for example.

Some companies use Oracle, some companies use MySQL, some companies use SQL Server or other certified

databases that SAP supports.

DB2 is another example.

So that's where all the data is stored.

This is where the data is stored.

So all the tables reside here.

# 128. Recap + notes

Okay.

So let's quickly recap what we have learned.

So the first thing that we have seen is it all starts with the guy.

I'm a user, a login, I do a transaction.

The communication from the client and goes to what's called as the server.

So this is a server.

It's not always a standalone GUI.

For example, this over here, right?

This is called the standalone GUI.

It's a dedicated program working only to interact with the SAP GUI.

But there is another version of the GUI called the web GUI.

So you can use your Firefox or any Internet Explorer or any kind of supported browser and you can use

that to interact with your server.

It's going to be mostly similar.

The screens are going to be very similar.

And on the server end.

So this is called a gateway.

So a gateway takes the request and looks for what's called as a dispatcher.

And dispatcher knows which work process to connect to and get that work process to look at this request

and process the corresponding request.

So when I mean a request.

It could be a login request, it could be a sales order creation request, it could be a purchase order

creation, it could be a customer master creation, any of those.

And the server also has what is called as a database.

This is behind that.

This this entire thing.

The blue box here is called the application layer.

And this is the database layer and the application server interacts with the database and the database

stores and retrieves data for the application server.

And we have seen an example of where SAP can scale.

So the same application scale, depending on the number of users, if the number of users is more,

you can architect your landscape in such a way that the system scales with the number of users, so

the same server can be replicated into more than one.

This is one server.

This is another server, this is another server and here is the user trying to log in or do some transaction

using the GUI.

And there you go.

It can log into any of these boxes and and all the communication will be taken care of by what's called

as a message server.

And these are all app servers.

That's called application servers.

There is only one message server and more than one application servers, and the app server interacts

with another layer called the database layer.

So this is how things scale.

So we're not talking about scaling on the database level that's taken care of by the underlying database.

So we're not going to talk about that.

But this is the scaling that's happening on the SAP app server.