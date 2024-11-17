# 123. ABAP Debugging for Functional Consultants - 1

Today we are gonna talk about debugging.

Now, some of you who don't have any

background in coding might find this a little difficult.

Okay?

[UNKNOWN] This option, it's not mandatory [COUGH] you

don't have to necessarily have to debug but this is a nice

to have [COUGH] and it's a good differentiator thing.

People with [UNKNOWN] skills.

Are looked up.

Now it's also going to help you in troubleshooting problems.

Okay, how I'm going to tell you.

Now, before we going into debugging, for those

of you, you know, who don't understand code.

Let me show you how the code flows, from a very high level.

We understand same product, right, same product.

Created, [SOUND] [INAUDIBLE].

We [UNKNOWN] one, then you enter the customer, then you enter the materials.

What happens behind the scenes?

Do you see?

Availability check happens.

All right?

I think in order to see it in the text using the front.

[BLANK_AUDIO]

Right?

Availability check happens.

What happens after that?

Timing happens, right?

And then incompletion check happens, whether

the document, [SOUND] is complete or not.

[INAUDIBLE] check happens if, the document is okay for [INAUDIBLE].

Right?

And the list goes on and on and on.

There are so many things that

happen, like, [INAUDIBLE] incompletion, credit check.

[INAUDIBLE] requirements, before seeing there are certain things that happen.

After saving that certain things happen, in the course of documenting [INAUDIBLE].

So these are some of the things,

that have been, fueling, the creation

of a sales [INAUDIBLE] [SOUND] okay?

Now, how do you, find out, what is a program

that's triggered when you create a field for that?

[INAUDIBLE] 0 1 [INAUDIBLE] 02.

Okay?

And click on this little, bookmark kind of thing, to the right of the bottom corner.

You'll see the program there.

The program is in this case is ABMV 45 A.

OK?

Then, [COUGH] you can open the program ABMV 45 A.

Okay.

In the evaporater.

And so you want to evaporate this.

It's like a [UNKNOWN] only thing is you can edit a vap code.

You can write your own code.

So you open that code like this.

And then.

If you want to find out the

code there, for example, available features unresolved.

For example,

something else happens.

Say, [UNKNOWN] loss happens.

[INAUDIBLE] Is that mouse from my angle.

[NOISE] Okay.

[COUGH] That beeping noise is from my inbox on my [INAUDIBLE] UPS.

So you wanna find out, where the call is?

Sort of things like availability check or incompletion or [UNKNOWN] happens,

that we can't find that out, because the code is embedded very deep inside.

If you think of the volume, probably this program, this little program.

I shouldn't say little, because its very big.

I think it runs into, the total amount of code that can possibly be run.

When you create a complex program, like a same sort of creation.

You run into many, many thousands of lines.

I suspect it could be somewhere around, a hundred thousand plus lines of code.

Okay?

So in that hundred thousand lines of code.

I don't think, we will be able to find out where

available picture happens, where incompletion happens,

where this happens, where that happens.

And it's for a good reason.

It had better intend us, to find out where that code is.

[SOUND] So why do we even need to bother?

Is the first question that might come in here.

The first, situation, we're you will want them to cut the

code, is something called the user [UNKNOWN] [SOUND] Okay?

So what is this user [UNKNOWN].

# 124. ABAP Debugging for Functional Consultants - 2 + notes

We need to bother to write something called user exit.

I'll tell you why we need to bother about user exit, okay?

First off, what of, what is this user exit?

A user exit is it custom, is, is it necessary to define a window,

in the code, where it can insert your own piece of code.

Okay?

So think about it like this [COUGH].

So, let's say you were here.

And let's save it doing this right check, all right?

So SAP is doing this kinda check.

SAP have some standard program besides this

main program that does the prediction part.

Okay?

So, after it's done with the standard program that does the credit check.

Okay, but in the little,

space over here, okay.

Which will initially be empty, but there will be no code here.

Okay?

There will be no code here.

That is a space to write across by SAP so that we can write our

custom code.

Okay?

Now you see of, seen availability check video, the conflict part of it.

Have discussed a use case where availability check needs

to be re-triggered after the viewed management is done.

Right?

And have discussed the business case behind it.

And that is not something that happens.

So availability check should run this out, availability check is done.

And that is not something that happens,normally.

The normal default behavior of SAPs,

availability check is automatically prepared after.

And, and it already reads pretty quickly.

Another reason to report, and all these reads

to predict, so availability check automatically happens again.

So, I discussed the use case of business case.

Where availability check explicitly not happen after

a credit document is leased on credit code.

So, this is an example of customization that

you can only achieve by app and user exit.

So, there is a user exit that I have discussed in that video.

Something that we just after credit check.

Where we can write some custom coding and say, okay, do I do credit check.

Okay?

Don't worry about exact code that needs to be written, which flag

needs to be checked on, which flag needs to be checked off.

That's something we can, explore at a later point.

So, to be able to understand the

overall concept, first concept being the code flow.

And the second concept being the, user exit code.

A user exit is a window in the code where you can create your own custom program.

Or custom lines of code that will affect the way the standard program works.

[COUGH] Okay?

This is the safest way of extending the product itself.

[BLANK_AUDIO]

Now, the requirement I talked about with this availability check is

very unique to a particular customer that I have worked with.

Not every company wants it that way.

But I think there is one product that

is delivered to every company in a similar fashion.

It's one product.

And each company will customize it for their own needs.

Like the way you'll be, you'll be seven and customization categories document.

Surprisingly, it's very specific for that company only.

Let's say Johnson and Johnson.

So, the customization or configuration that you do with

that product is specific to the needs of that company.

Now not all needs can be met with configuration.

Only some of the needs can be met with configuration.

So, what about the rest of the needs?

It's like the example that I talked about.

The rest of the needs can only be with customization.

So, what is the difference between configuration customization?

If the way loosely used, those terms are used very loosely and interchangeably.

But ideally configuration is anything that you do with SBRO.

[BLANK_AUDIO]

Any other customization that you do, outside of SBRO,

say I write a piece of code is called customization.

It could be your own custom program.

Or it could be program, [INAUDIBLE], or it could be a new routine

exactly, like a new copy control routine, new data transfer routine.

All of these, are called customization.

Okay.

In short, you can think of customization as writing code.

Configuration are something you do in SPO.

It's only through a combination of configuration and customization that we

can achieve 100% of what the customers or the company needs.

Okay?

I would say, in general, configuration can only achieve

20 to 30% of what the company needs from SAP.

The rest of the 70% is achieved generally via customization.

Okay?

So, you should also become aware

of customization, apart from the regular configuration.

SBRO is all right, you need to know it.

But you also need to know customization.

Very critical what code to write [UNKNOWN].

But luckily, we as functional consultants would not have to write code.

We will not be given the authorization to write code.

So, you don't have to be code savvy, but you might

have to understand a little bit of a code here or there.

Okay, just a little bit.

So don't worry if you are not a coder in the past.

There is nothing to worry about.

90% of the STB, SAB functional compartments in the

SAB world were successfully doing their jobs cannot read code.

Okay?

That's good news for most of you, I believe.

Because you don't have to go through code and all that.

But it's nice if you have some level of comfort with code.

Because some job descriptions ask for you to have some

level of comfort with debugging and user exits.

Okay and if you can see that you, you can debug, you can understand that user exits.

It's gonna be a way huge advantage [COUGH].

Okay?

I would say huge at least a least level

amount of advantage that will give you an edge.

Okay?

And it's not all that difficult also.

Like I said, you don't have to be a coder.

You just have to understand a little bit of code,

here and there, and that should be more than enough.

So, coming back to the topic of user exits.

So, a user exit is a window in the

main program where you can write your own custom code.

Okay?

[BLANK_AUDIO]

How do a user exit?

I'll show some examples of user exit, okay.

And how to code user and so on and so forth.

So, here is an example [COUGH] of a user exit.

User exit, it starts with a flop from

user exit_move_field_to_VBAP.

And there is a code that goes in here and that end form.

Everything that goes inside the form and the end form, it is the code, okay?

It is what the user exit starts.

And this is where it ends.

And anything inside it, is the code.

In this case, there is no code because this

line of code called VBAP-blah blah blah, is commented out.

With this star.

Star at the beginning of the line means, this is a comment.

So you cannot mess up.

Just let me see, we have this, right?

And then you write your code and then this.

So that, particular line is not run because it's a comment.

In about two ways to comment code.

One way is to start with a star at the

beginning of the line, then that line is a comment.

So, in general, user exits start with a form and there will be a name for it.

In this case, it's user exit move field to VBAP.

And then, you can write anything you want inside it and fill in the form.

Okay, and I say we will give it a generic description

of what this user exit is and how it can be used.

And in this case, it says this user exit can be

used to move some fields into the safe document item workareas VBAP.

Now in this case we don't understand what

this means, VBAP some finish blah, blah, blah.

But when you get to that point, you'll understand it.

The department, does it have it's own pricing, how

to customize the condition table above and all that.

You don't understand it.

But this is how a user exit is in the system.

That is how you can, view it, and you use it and print this

structure like this from user exit name and, there is a window.

This is the window I was talking about when I said window.

Right?

So this is the, the window.

These two lines,.

[BLANK_AUDIO]

We can write what ever you want.

Anything you want.

As long as it doesn't crash the system of course.

[LAUGH] You can write anything you want.

And what you write will change the functionality.

There I give you some more examples.

Now let me take you to, a program the user to now, I'll

show you how to open the program and how to view these use exits

[BLANK_AUDIO]

Okay, so, let's open the edge of the one, which is a simpler program.

And then go to o r 1000 and 0 0.

Enter.

And I said you can view the program that's currently being run

by going to the bottom right corner and clicking on this little.

Look back pop up, click on that and

it'll say what's the program that's currently being run.

Because at the end of the day everything is a program, I see, right?

Everything is a program that is being used.

So, that program is separating all that logic

for you, these things and all that funky stuff.

So what is this program that is displaying the same sorta screen?

The name of the program is SAP MV fortified A.

This is one way to know the program.

Is there another way?

Yes, go to System.

Go to System in the menu.

Go to Status,

and we can see the program here, so.

Okay?

From copy the program sabmb45a.

Closing this.

And how to open and view this program.

Now when you, go to field for the wheel 01,

you are ex, asking the system to execute the program.

So the program is being executed.

But if you want to view the code behind that screen.

How do you do it?

We have to go to an editor right?

How do you go into editor?

SP [UNKNOWN] backspace [UNKNOWN] editor.

Click OK.

Enter the name of the program if you copied.

Then we're going to display the source code.

Okay?

Like so.

[BLANK_AUDIO]

Any questions up to this point, anybody?

While this opens the program does anybody

have questions on the program flow or user exit

or any of the concepts that [INAUDIBLE] now?

All right.

So, this is the program.

Again, the program and the code inside the

program is how much, 358 lengths.

So, is the inside of the program just 358 lengths?

Actually program is very big because it's structured like this.

There will be a bunch of includes.

And each include is a program again.

So if you look at MV45AFZA, that's the program again, okay.

How do you view it?

Just double click on that.

Whether you located a program double click it and

it will open and MV45AFZA [UNKNOWN] double click on.

Include in the program and include in the program, include

in the program which is basically how programs are structure anyway.

Okay, and here is an example of user exit I was talking about.

See?

It's very similar to what we are seeing in that [UNKNOWN], right?

So, when we hear a description of it as to what this user exit does.

I need start with a form and then the user exit name.

[BLANK_AUDIO]

And from this window of course here and then end form.

Okay, so this is how we use user exit structure.

Now, let me discuss one user

exit [COUGH] maybe MV45AFZZ.

This one ZZ.

Okay we're going to discuss MV45AFZZ.

Is that okay?

[BLANK_AUDIO]

Okay and look at this for example, user exit daily document.

This user exit and I, I'm reading off the description.

This user exit can be used to delete data

and additional tables on a sales document is deleted.

Okay and now I tell you the scenario where you can use this user exit okay?

Let's consider a scenario where when you

create an order using VA01, okay.

The program is created all there is as usual.

All right we have created another z

table or z order_ log or something,

something like that there [UNKNOWN].

You log [UNKNOWN] auto screen and some data like that.

Some data that is very specific to the customer, okay?

Some data that is very specific to the customer okay?

Now, when you do that I don't know why it's going down, I leave it alone.

When you do that, [UNKNOWN]

you go right to this table.

Okay, now when you go to the same

part [UNKNOWN], VA02 let's say.

VA02 then go to same [UNKNOWN] delete.

Automatically that should implicitly also tell the

project [UNKNOWN] that you go and delete the entry here.

That's [UNKNOWN].

How would you solve it?

As soon as it is deleted automatically the entry to this one is that order number.

In this table, z order_log should be deleted [UNKNOWN].

How do you solve it?

So you go to that user exit_delete_program.

User exit, MV45AZ that we have seen.

And then, we write your code.

This code, you don't have to write, right?

You just have to give a guideline as to, what to write.

So, this code will go and locate the order number in z order log.

And then, delete that line.

Save it.

And then, Exit.

This is one scenario

where you can that user

exit_delete_document program.

Okay?

We will exit delete document.

>> So, three notifications.

[UNKNOWN].

Let's not go there.

I'm looking at some user exit that we can explain.

With the knowledge that you have already.

Okay, number one this is a good example.

For user exit number ranges.

Okay?

[COUGH] I'll tell you a similar example that you can relate to.

Because I, I'm saying similar because it's not used in sales orders, generally.

It's used mostly, in invoicing, okay?

Now, [COUGH].

In some countries, in some countries

there are requirements where legal departments, okay?

Legal departments where, all [UNKNOWN] invoices.

We need to have [UNKNOWN] numbers.

I mean it starts at one, two, three, four, five, so on and so forth.

There cannot be four and then a blank and then six.

So you might be wondering why they did this [UNKNOWN].

I tell you what let's say US is 01, company code, Canada is 01, company code.

Okay, where you define F2 or ZF2 as the document type.

You will be finding a number of ways to do it.

Right.

And 01 corresponds to 1299999, whatever.

So, ZF2 which you define is not specific to a country.

You don't define one program for every one document, for every country.

When if you happily representing 100 countries you

have to have 100 documents, just for invoice.

You just can't.

Right?

Really one program [UNKNOWN] one document type

and that [UNKNOWN] the same plus [UNKNOWN].

If you want a very physical document type

[UNKNOWN] for India [UNKNOWN] country [UNKNOWN].

But in this case, when the invoice program runs, the dash program, V041.

If we start seeing ZF2s, for all of the US01, CA01, Italy, Germany, so on.

And [UNKNOWN] you can use this number range right?

When you start using okay one, two, three, or the next one four.

[UNKNOWN] and next is Germany 7,

8, 8, 9 and the next is US 10,

and the next is US again 11,

12, 13, 14, 15,

16, 17, 18, 19.

Okay, now it doesn't really matter I believe.

Yeah, sure US has this number, 1, 2, 3, 10, 11, 12.

Okay, but let's say Canada has this legal department

where all the invoices need to only have computer numbers.

Like that precisly that 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19.

Okay, the end of the world.

This is not possible, right?

Understand [UNKNOWN] this is not possible.

How do you solve this problem?

Very simple, you go to that number range.

[BLANK_AUDIO]

The number range.

Okay, and this number range between this

line and this line you write some piece of

code here where if Sales are [UNKNOWN] Canada

[BLANK_AUDIO]

Then use US_range_internal

is equal to, whatever.

01, or the [UNKNOWN] specific number, 05.

So, for all Canada [UNKNOWN] samples, the number range is gonna be used is 05.

When any kinda Canadian invoice is created.

It's always going to be used in that range.

So that

[UNKNOWN].

Everybody understand this thing?

Any questions here?

>> [INAUDIBLE].

And here

I have a

question

[INAUDIBLE].

[INAUDIBLE].

>> Hello?

[UNKNOWN].

This [UNKNOWN] are [UNKNOWN].

Are every form like an MV45AFZZ program are those,

are those exits, user exits predefined.

I mean like every form have like.

>> Yes predefined.

Predefined [INAUDIBLE] whatever user exits is there can only be used.

That's it.

>> You can not say the new ones, right?

If you wanted to.

>> No, no.

>> That's okay.

>> Okay, so that's the user exit it's already to go now [UNKNOWN].

This is just the beginning okay you have to do some more research on it.

And just remember the names of some of these programs.

Okay [UNKNOWN].

It means what they say MV45AFZA, ZB, ZC, and ZZ.

These are some of the main programs

that are almost used almost at any installation.

MV45AFZA, AFZB, AFZC,

AFZZ [UNKNOWN] program.

But, that's too hard at this point.

A case [UNKNOWN] it simply ask you what are

some of the user exit that you've worked on.

Just take these names number one, okay.

And number two, if somebody ask you what exactly user exits that you've worked on.

If you go to MV45AFZZ you can use some examples [UNKNOWN] number range [UNKNOWN].

I believe that would take you one week further.

And you can use some of the examples that I

given, delete document, number ranges so on and so forth.

[BLANK_AUDIO]

Okay.

So, that's how you open a program.

That's how you create a [INAUDIBLE] and that's very [INAUDIBLE] own original code.

Like I said, your [INAUDIBLE] programmer will

be able to write that program for you.

Once you give him the specification as to what needs to written.

The logic needs to be given by you,

the actual programming may be done by the [INAUDIBLE].

And we'll also learn some of the important user exit programs, MV45AFZA, ZB, ZC, ZZ.

And we are seeing couple of examples, real time examples of user

exits, user exit delete document, user exit number range.

Okay then [UNKNOWN] situation you can use.

So that is the program flow and user exits.

So, the next topic is break point.

Now we are moving into what is called as debugging?

What is debugging?

When do you need to use debugging?

What is a bug?

A bug is a problem.

Right?

A bug is a problem, a bug is a problem in the code.

That's called a bug.

What is debug?

Debug is to remove a bug.

But debugging is a process of removing a bug in the program and in

order to remove the bug you have to find out where exactly the bug is.

All right and how do you find where the problem is in the program.

In order to do that you have to go through certain lines of code step by step.

Okay, now before I go there one of the aids that you can use

in going through lines of code is called the break point.

What is a break point?

Well let me show you what is a break point, okay.

So, I'm going to the same program.

Click on Display and go to MV45AFZZ, double click on it, okay?

Then

let's say, is the exit number range, okay?

I've placed my cursor there.

Then, click on this stop.

Okay and then that line turns yellow.

What it means is that we have set a break point there and asked

the program to stop when the execution comes to that point.

Interesting, isn't it?

Now, let's open another window and try to create a program.

[UNKNOWN] enter 1000 enter.

And this just [UNKNOWN] the program.

Ooh, something funky is happening.

What's happening here?

As soon as you save that thing sorta a number [UNKNOWN].

Before that number is generated.

It takes the code execution of the code flow takes that point

where the user exit number range blah, blah, blah [UNKNOWN].

Then over there we are asked SAB to set a

break point [UNKNOWN] and stop here for a little bit.

It's like program is going from Detroit to New York,

and we said okay, stop in Ohio somewhere in Cleveland.

And it, it stopped at Cleveland right now, and it's awaiting your instructions.

So at this point, you can do a bunch of things.

What can you do?

You can examine certain variables.

Like for example [UNKNOWN] Okay, is [UNKNOWN] here.

Okay go take this.

This is the actual number range that is used.

What is the value of this, 0.

They should have know there are OR number range 0.

You know that right?

So what is the 01 number range?

I'm opening another window.

[UNKNOWN].

What is 010 [UNKNOWN]?

It started 129999 [UNKNOWN].

Now on the [UNKNOWN] I want to change it to 02, Can I do that?

Yes, this called the bug [UNKNOWN].

On the fly, programmatically using debugging we

are changing the variable and seeing [UNKNOWN].

Okay?

From 01, I want to change it to 03.

[UNKNOWN] from 100,000 to blah, blah, blah.

[UNKNOWN] and the current range is 100003.

Now, lets go back to our screen and say, this is not 01, but I want it to be 03.

So, click on this pencil, change to 03, okay?

[UNKNOWN] okay?

All right, any questions up to this point?

I've changed that number range using what is called the bug [UNKNOWN].

In the debugging mode we are replacing the values of certain variables, okay?

Just to see how it works okay.

Now then we want the program to continue as usual.

How do we let the program continue?

We let the program continue [UNKNOWN] or F8, F8.

Let's click on continue.

[BLANK_AUDIO]

When the program is going forward.

Which is saving and the rest of the code is being run apparently.

And finally [UNKNOWN] next [UNKNOWN] okay.

Now, I've change the number range to be used.

So ideally it should [UNKNOWN] some already in the code that

is already [UNKNOWN] with the standard number range.

Let's see the effect of it.

[BLANK_AUDIO]

Okay, move on.

[UNKNOWN] Do you understand the concept here?

What is a break point and [UNKNOWN] okay.

If you put a break point [UNKNOWN] line

of code and put a break point [UNKNOWN] hello.

The next time you [UNKNOWN] run the program

which is a the execution of that program.

The problem starts there and then you can [UNKNOWN] analysis at that point.

What analysis can you do?

You can watch the value [UNKNOWN] variables.

You can watch variable at this point and time.

Or you can do debug replace.

Which is changing the variable value at runtime.

The, the screen that you see here is an older version like 6.,.

the older version of GUI the newer version of GUI [UNKNOWN] okay?

The older version of GUI look like this [UNKNOWN].

But [UNKNOWN] we are changing the value of

certain variables and finding the effect of it, okay?

You'll see the effects of it.

[UNKNOWN] program at least but why is it taking so long I don't know.

Come on.

>> [UNKNOWN] this is for SVR is there any

not a debug but kinda like [UNKNOWN].

Or do a 01 doesn't know what customization is running.

Or it's kinda like a trace kinda thing [UNKNOWN] and I did that.

You know it [UNKNOWN]

>> No, no, no I think where you are going with this question.

But there is nothing like that.

[UNKNOWN] on a program [UNKNOWN].

We have to understand [UNKNOWN] how it does function.

We have to have knowledge of the system that's it.

Okay.

[BLANK_AUDIO]

I don't know what happened there.

But I, I can tell you the end result is gonna be that instead of

order number 133 [UNKNOWN], it will start with 1003.

Because you are replacing 01 with 03.

Okay now, [COUGH] [UNKNOWN] very good from here.

I want you to find out what's most important user [UNKNOWN], okay.

Specifically [UNKNOWN] and MV45AFZA, MV45AFZB, MV45AFZZ.

Okay, these three programs four programs have [UNKNOWN] like this.

At these final scenarios use for five or six different user exits minimum.

I've given you two scenarios, user exit delete page, user exit number page.

So go ahead [UNKNOWN] some more user exit in business scenarios.

And keep them in you mind [UNKNOWN].

Okay very important.

Any questions at this point?

I'm gonna stop the debug topic.

I think we've heard enough for one day.

I'm not sure if you have any questions up to this point.

[UNKNOWN] Go through it and then tomorrow if you have questions [UNKNOWN] [UNKNOWN].

>> [UNKNOWN] here.

>> Yes sir.

>> You said [UNKNOWN] going to be an indicator [UNKNOWN] of like a, of

of the program what I could [INAUDIBLE] or nothing.

Nothing I didn't try anything else significant.

Being a [INAUDIBLE] but I do [INAUDIBLE] have a lot of things to

do with it, but we, will we have something to do in it?

>> No, like it said we will not [UNKNOWN].

But you have to understand user exit, debugging,

debug retrace and all these [UNKNOWN].

And I mentioned user exits, I mentioned debugging

that is these two things you have to understand.

Okay, so the [INAUDIBLE] something of

debugging defined a kinda miss error [INAUDIBLE].

We just want to know where the.

Excuse me.

>> Yeah, go ahead.

>> [UNKNOWN] we want to know where they are, the error happened [UNKNOWN].

Is, that, is that right?

[UNKNOWN] then on the [UNKNOWN].

And I'm gonna ask [UNKNOWN] other then break point is

[UNKNOWN] the name of the program then keep doing it.

If you want do, do start inputting right away without having

to go to, actually program and do setting the big coin.

We can do what is on that /h here, okay, /h.

And then we can start going about doing your own things on place /h.

Okay, it's actually a thing is, okay.

On the next step start debugging.

[INAUDIBLE] serious

you know [INAUDIBLE].

[UNKNOWN]

you are

probably

hearing me

[UNKNOWN].

Okay so what I was trying to say is /h is used

to start the execution in debug mode.

Okay?

Just remember that.

How do you do debugging?

/h or set a break point.

These are the new options for you to start debugging.

Okay so don't go beyond that [UNKNOWN] at this point [SOUND].