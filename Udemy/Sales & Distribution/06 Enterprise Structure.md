# 28

So in this chapter we're gonna start

learning about Enterprise Structure.

What is enterprise structure?

How do companies.

In the system.

Let me give you an example.

If you take the company GE, GE is a pretty big company, right?

So GE has GE healthcare,

GE lighting,

and say GE plastics.

There are many different companies inside GE, but let's just take one of these.

If you take GE Healthcare, GE Healthcare is again, a global company,

meaning it does business in the US, it does business in the UK,

Canada, India,

Singapore, and so on.

Now, if you take the US company.

The US company has sales offices on the west coast.

Because there are hospitals on the west coast.

There are hospitals in the midwest.

There are hospitals on the east coast.

In the south.

So on and on.

And each sales office contains a whole bunch of groups of people.

You know, some people doing a certain line of business.

[COUGH] Salesman, say in Rob's group,

does only capital equipment, meaning all the big stuff, right?

Like X-ray machines or MRI machines and so on.

Capital equipment.

Steven's group

does consumables.

Meaning an x-ray equipment requires some tissues, some tubes, or

something that's consumed just for that particular X-ray, for that patient.

That's a consumable.

A syringe is an example of a consumable; a tube is an example of a consumable.

You see, the entire company is structure in a certain way, you know, in terms

of where it's operated, how many different sales

orgs it has, or sales offices it has.

And in each sales office, how many different groups of sales reps are there.

And of course underneath it, there are so many different sales reps.

Right?

Selling the product.

This is one part of it.

Another part is, I'm just taking US, just for the sake of simplicity.

Another part is, maybe there's

a manufacturing plant somewhere in Wisconsin.

So in Wisconsin, so this is a manufacturing plant.

So in Wisconsin, there is a plant or a factory, it could be one or more than one.

You know, one of these factories is producing capital equipment, another

producing consumables, another producing spare parts, so on and so forth.

So, each factory will have or can have so many different warehouses.

You know, one warehouse in Milwaukee.

One warehouse in Waukesha, one warehouse in Brookfield.

There just different cities that might have in all

different warehouses that store the goods that these factory produces.

And when you're shipping say, for example, spare parts for

an x-ray machine, they could be shipped out of Brookfield.

And when you're shipping an x-ray machine, the entire

machine itself, it could be shipped out of Milwaukee.

And say if you're shipping some consumables,

it could be shipping out of Waukesha.

All right.

So, what I'm trying to say here, the

company runs its business using different org structures.

In this case each country represents a company.

Because if GE Healthcare wants to do business in Singapore, it has to go

set up a legal office there and do there business, so it's company.

Where the profit and loss, the balance

sheets, assets, liabilities, are maintained at this level.

And further downstream, company has plans.

One or more than one.

Company has warehouses.

Company has sales offices Since office, company has expenses around offices.

Company has manufacturing expenses.

Company is structured in a certain

way to represent the structure

of the company, entire GE or

G healthcare, in SAP is done

wire, enterprise structure.

So this is the definition of enterprise structure

# 29

An enterprise structure from the perspective of SD has three parts.

From the perspective, and as the consultant.

This is Finance.

Okay.

This rectangle is Finance,.

And this is sales and

this is logistics.

Finance, sales, logistics.

Now for a consultant working on a MM, he's more focused on logistics.

A finance consultant, he's worried about more elements in finance.

More operative and organizational elements in finance.

The reason why I'm saying we need to know a bit about finance, and sales, and

logistics is, when you perform a sale, the sale has to be accounted for in finance.

And the sale has to be done using the sales elements.

And the sales has to be delivered using logistics.

So all these three functional areas come together, when you represent

name price structure of the company that's relevant for, and as the consultant.

As [UNKNOWN] consultant, you should know a little bit of finance AG elements, a

little bit of sales AG elements, and a little bit of logistics AG elements.

In this chapter, we are gonna focus on

the financial element, or the financial AG elements.

Now I'm using the word AG element.

What's an AG element?

I'll give you a very, very rough example.

If a bank, say Bank of America,

is writing an application for online banking,

it will represent in its code within its system the major elements, right?

How is the bank structured?

[UNKNOWN] what are the branches.

Because a customer can make a transaction in a branch.

And we should represent that branch in the system.

Okay, this is the Boston downtown branch.

Or the Houston midtown branch.

Let's say you're a hiding [UNKNOWN].

And you have privileged banking with Bank of America.

Which privileged banking manager or group of people responsible

for dealing with privileged banking, has done your transactions.

So, who is the sales manager who has done the transaction for you.

And the list goes on and on, the point being.

We are trying to capture the major elements,

within which, we are trying to do the transaction.

We are trying to do a transaction in

a branch, with our sales manager, and the details

from that point on, could be very bank

specific, so we're not here to talk about that.

The reason why I gave you this example, is

so that you understand that when you do a transaction.

When a customer comes to us and does a

transaction, in case were are GE medical systems or healthcare.

And the customer comes to us, and we create a sales order for him.

We have to say.

Okay, we have created a sales order for this customer in this company.

We have to represent the company in the system, right.

Are we doing it in Singapore, or are we doing it in U.S.

or UK, and who has done it, and what channel will be used to sell.

The goods to the customer.

These are all, the different AG elements.

These are not real, physical entities, sometimes.

For example, a plant is a physical entity.

It exists, but a sales group, it's really virtual, right?

It doesn't exist.

It's a group of people, that we're calling as an AG element.

Most fo the time, it's, it's a

virtual grouping or virtual representation of certain things

that are required to run your business, and report on that part of a business.

Now, in a subsequent section, where I'm gonna talk about.

What really is the use of enterprise structure?

But up until then, let's really go through

the definitions of all the different AG elements, and

create them in the system, before we really go

and understand the philosophy behind why SAP asks us.

To do enterprise structure definition.

Let me erase this.

We have so much to do in finance.

Okay.

![alt text](image-528.png)

So, in finance there are three or four

different AG element that are important for SD consultants.

But at this point, I'm only going to focus on two items.

Or rather one and then another we'll see next time.

The top most AG element

is called a company.

In the case of G health care this will be GE Healthcare.

This is the company that reports the profits.

At the end of the quarter or at the end of the year, and this is the

company for which there is a stock ticker, the trades in public, so on and so forth.

Everything rolls up to this entity, in the US.

That doesn't mean, that GE Healthcare doesn't

do business in India, or Africa or Australia.

Does business there, and all the profits are rolled

up to this entity in the U.S called GE Healthcare.

It could be public limited, it could be a private company, it doesn't matter.

Underneath that, we have the actual legal entities, that are boon in the business.

For example, so this piece, GE US.

So this is a legal entity that's doing business.

In the US ask g health care.

The, this is GE, UK.

Same company but in the UK it has to operate

in a in the legal restraints of that particular country.

It has to show it's books.

The country's tax men, whenever there is an

audit, it has to be shown to the respective

officials or all the sales for that country,

if you wanted a board on top of it.

Everything is at this level.

So same with GE Canada.

So there's a GE Canada,

right.

GE India,

GE Singapore.

The list goes on and on and on.

Most of the time, every country that the, that the company

operates in, has to have a legal entity in that country.

So, the typical you know colloquial name for this is called legal entity.

And in SAP terms.

This is called company

code.

So this is what SAP calls it.

You could call it a company code in SAP, but outside of SAP,

if you talk to the general business, they call it a legal entity.

So what's a legal entity?

A legal entity, is how a company is represented in the books.

And that representation needs to be done SAP as well.

So GE US is represented in SAP as a company code.

And GE UK is also represented in the system as a company code.

So from the finance section of enterprise structure.

This is your focus, cuz you almost never deal with this.

The company, very rare.

You will never have to deal with it.

For all practical purposes, company code is what you'll be dealing with.

Every bit of configuration that you do, with respect to finance,

whatever little that you do, is always with the company code.

There are some other arguments that we'll talk

about when we come to the respective ideas.

All right, so in finance, the main AG element is the company code.

It also called an eagle entity and that's, that's

how a company is represented in the books and

in the system, and all accounting is done at

the company hold level, not at the company level.

But always the company code level.

This is the AG element at which S-A-P does accounting at the highest level.

# 30

![alt text](image-529.png)

![alt text](image-530.png)

![alt text](image-531.png)

All right.

In the previous chapter, we have talked

about the finance part of enterprise structure.

Now we're going to look at the sales part of enterprise structure.

At the top we have what is called as a sales org.

Sales org.

Okay.

What is a sales org?

A sales org represents the

sales policies that are

implemented in that geography or that zone.

For example, [COUGH] let us take GE US.

Okay?

GE US is the company code for which we

are trying to create all these different sales orgs.

So, a sales org falls under a company code.

Meaning, the sales org is associated to a company code.

Meaning, the sales org exists for that company code.

More than one sales org can exist for a company code.

For example, GE US can divide their entire sales in the US.

US.

As say Midwest Northeast

Northwest, and so on.

So, that's one way of defining it.

By geography.

There are multiple ways of defining it but before

we get to that, why are we doing this division?

What's the advantage?

Let me give you one simple example.

Say GE US does business in Midwest say

a bit differently than it does in the Northeast.

For example, when I talk about sales policies, pricing is one example.

Meaning, the prices in the Midwest are

different than the prices in the Northeast.

Possible, right?

Typically, most of the US has the same

price list for most companies, but sometimes it's possible.

It's possible that different geographies have pricing policies.

Say for example, In the midwest, returns are

allowed on capital equipment, whereas in the northeast.

Terms are not allowed, maybe replacements are done.

So these are all examples of policies, sales policies, and sales

org is used to define a set of

policies that apply to their sales returns of any kind of sale transaction.

Now it need not always be the case that one country has more than one sales org.

Either by geography or by any other parameter.

Most of the cases, one company called almost always

has one sales org in all practical scenarios, but

SAP allows you to have more than one sales org per company code.

It's up to you.

But like I said, typically one sales org per company code.

Okay.

Now, what is a sales org?

A sales org defines a set of policy that are to be used.

For there particulars geography or whatever kind of

division that you use to define that sales org.

If there were no Northwest, Northeast, or any other geographically divisions

through which you wish to implement your sales policies, you can have

an entire US as one sales org and all these

connections are gone and it's directly linked to your company called GE US.

So, US has one set of sales policies with respect to entire country.

So that's a sales org.

A sales org is the highest level org element.

So this is the highest org

element in sales.

Okay?

So because this, this part of the window is all sales.

So in sales, sales org is the apex structure.

Under it, we have two main divisions or two main sub structures.

The first one is called as a distribution channel,

distribution

channel.

What's a distribution channel?

Now think about g-medical systems.

When g-medical systems wants to sell an x-ray machine, what

are the difference channels through which it sells that x-ray machine?

It could do a direct sale.

Meaning it could directly go to hospitals or

diagnostic centers and sell this equipment to them.

Or it could do let's say, agency sale.

Let's say AG, where

there are agencies that resell this medical equipment and GE

sells to that agency and that agent sell it to a hospital or a diagnostic center.

It could do it via corporated networks.

You know networker hospitals buying on behalf of the bad hospitals.

Right?

So there're different channels through which they distribute they goods.

Now if you take a computer, that, that's probably more relevant.

If you take a computer, a laptop, HP sells a laptop.

And what are the different distribution

channels through which we sell our laptops?

Examples could be wholesale, meaning you know what a company like say Ingram Micro.

Right?

Ingram Micro which is a distributor of computer goods.

Buys them in wholesale and sells them to different customer and companies.

That's one channel.

Another channel is corporate, where, say a company, a big company

wants to purchase laptops for their in-house consumption, for their employees.

So HP goes and makes a deal with this company.

That is a corporate company, right?

So that channel is a corporate channel.

And then HP can send the same computer on Amazon.

Right?

That's online retail or e-commerce.

HP can also sell their site on HP.com.

That is e-commerce or online, whatever, as opposed to a third party online system

like buyer.com or amazon.com they could sell

it on their own website via e-commerce.

Right?

And they could sell it as a franchise

or they could have agents.

They could have re-sellers.

These are all the different distribution channels

through which HP actually sells their laptop.

Now in the case of HP, it makes sense that it has

a whole bunch of distribution channels like that because its a mass product.

But with a product like an x-ray machine, not everybody buys it.

Right?

Only hospitals, diagnostic centers buy x-ray machines, and of

course the network through which they sell their products

is not as wide as, say, HP selling a

laptop, they only have one, two, or three different channels.

So the channel through which the sale

is made is called, it's a distribution channel.

So, each sales org in the US for example you're gonna have more than one

distribution channel and the second key part to a sales org is the division.

Again, you can have more than one divisions.

This is called a division.

D-I-V-I-S-I-O-N.

What is a division?

A division represents a group of products.

From the perspective of GE Medical Systems,

there could be any number of x-ray machines,

you know, all the different configurations, different

power ratings, you know, different kinds of exclamations.

For example, a dental x-ray is different from a whole-body x-ray verses a

lower arm x-ray, verses an x-ray that's done only for the fingers.

You know, these are all different x-ray machines.

They have different form factors.

Their uses are different.

But, if you wanna group them all together, and say

which division does all these ten different extinguishings belong to?

It's x-ray.

So a division is a grouping of different

products, a set of products rather, into one parameter.

And why would we wanna do that?

We're gonna talk about that at a later point.

But, you understand this point right?

You group different products into one, based on some kind of a commonality.

All x-ray machines common with exited division.

Maybe you want to do accounting differently for

x-rays, comprising differently for x-rays, maybe report all

x-ray sales for all the ten different machines

underneath it into one division and so on.

The users of the month.

Endless.

Similarly, it can have CT scanners and then,

again, there are ten different types of CT scanners.

One for the brain, one for the whole body, so on.

And all of them are grouped together into one org element called a Division.

In this case, CT Division.

And MRI, one of the divisions, and consumables is another division.

We only sell consumables, we don't sell capital equipment.

Right?

So a division is an argument that

represents a grouping of products for the purpose

of pricing, for the purpose of reporting,

or for the purpose of other operational efficiencies.

If you are to do it for HP.

HP would have divisions like Laptop Divisions.

And inside Laptop there are a whole bunch of

materials that could come under the umbrella of a laptop.

An example, the Inspiron model.

Or HP could have ten different types of laptops and

all of them could come under the division of Laptops.

Same with desktops, same with printers or scanners, and

any other kind of broad classification of products that

they wanna do or their line of products classification

of their line of products is called a division.

Okay.

So we have three org elements that we have seen here.

Sales org, distribution channel.

Right?

And division.

Now, as sales org plus distribution channel

plus division

so 1, this is 1, 2, and 3.

This combination is called as a sales agent.

And this is purely an inhibitor it doesn't have any significance outside of it.

Don't think of sales area as the sales

area of that sales people that can think of.

This is my domain this is my territory, this

is my sales district this is my sales area no.

It's not that.

There is another term for it calls sales district or sales region that

you can use at the customer master level or the transaction level that's different.

That's typically the sales area that sales consultants think of, but

this sales area is an SAP specific term,

which signifies or represents a combination of one sales

org, one distribution channel, and

one division.

For example in this case, sales org US

plus agency plus x-ray could be one sales area.

Sales org US plus direct sale plus x-ray could be another sales area.

And the number of combinations could go on and on and on.

Why do we do this?

Because not all combinations are really relevant.

For example, in the US, maybe direct sales is not done for x-ray machines.

In which case, you don't use this

combination US plus direct sales plus x-ray machine.

May be this is not relevant.

So all combinations in which you actually perform a sale have

to be created as what is called as a sales area, which

is an SAP specific term that signifies a sales org and a

distribution channel and a division for which a sale can be done.

So, we have learned three things here.

Sales org, distribution channel, division.

And we have seen that, that distribution channel

is really something that falls under a sales org,

and there can be more than one distribution

channel under a sales org, and same with divisions.

There can be more than one division associated with a sales org.

And a combination of sales org plus distribution channel plus division

is called as a sales area, and we have also talked about why we do a sales area.

And on top of that, we have seen that

sales org is really linked to a company code.

In the next chapter, we're going to talk

a little bit about sales offices and sales groups.

That's going to be a small chapter.

Then, we're going to move on to logistics.

# 31

![alt text](image-532.png)

We're gonna continue our discussion of sales so we

know sales are distribution channel and division former sales area.

These are the primary org elements in the sales part of.

The enterprise structure.

There are two more org elements that you

should be knowing about, which is sales office.

A

sales office is associated with a sales area.

And there can be more than one sales areas, per sales office.

[BLANK_AUDIO]

So, what does a sales office represent?

A sales office, typically represents a virtual or

a real office, where sales is being performed.

For example, USG medical assistance for a

combination of agency and MRI could have one

sales office in Los Angeles, one sales office

in S-F-O, San Francisco, one sales office in.

Portland.

And one sales office in San Diego for all West Coast sales.

And then they could have more on the East Coast.

Now for a company like Facebook now, it need not be geographic.

They could have sales offices all in one place.

Where they really want to do different divisions, meaning you know, one sales

office for all ad revenues coming from convention companies.

One sales office dealing with all ad revenues coming from.

Say e-commerce companies and they could have one sales

office only looking at potential you know new clients.

So it need not always be geographic, it could be by-line of business, it could be.

By channel or it could be any way that business seems fits.

The key point to learn here is that a sales office represents.

A group of people, okay?

A sales office over here in this case, say, the Los Angeles sales office

represent a group, or more than one group, right?

This group is a group, group one.

GRP1 and this could be GRP2 and this could be GRP3.

So these different groups of people, each group could be responsible.

For, say, in this case, group 1 could be responsible for

all x-ray sales and it has three different sales people here.

Or salespeople, salesperson one, salesperson two, and salesperson three.

Say.

Bob, Steven, and, and Mary.

So all these three sales persons, or sales guys, could be

in one sales group, and Mary, for example, could be in this sales group, as well as.

CT sales scope.

You know if her specialization is both x-ray as well

as CT, she could be part of both these sales groups.

Once again, there is a sales office, which

could represent a physical structure or it could

represent a virtual structure through which they want

to, they want to structure or channel their sales.

And it's assigned to a sales office.

So, a sales office is assigned to a sales area and.

Underneath each sales office there can be more than one sales group.

And each sales group could have more than one sales person.

So this is the last set of hierarchy, sales office and sales group.

And typically these are optional, meaning you don't need to have

a sales office, you don't need to have a sales group.

But these elements, the sales org

distribution channel and division, these are mandatory.

These are required.

Sales Org, distribution channel, division, these are required.

This is optional.

Don't need to have it, if you want more reporting.

You can have it, if you don't need that

level of reporting, you can just not use it.

All right, in the next chapter, we'll be moving on to logistics.

So, we're gonna.

# 32

So the last piece to the definition of enterprise structure is logistics.

So in logistics, at least for us as consultants, the top org element is the plant.

So what is a plant?

So a plant.

A plant is a place where goods are manufactured.

So what about service companies?

Do they need a plant?

Yes, they do need a plant.

So a plant is much more than a place where goods are manufactured.

A plant is a place where goods are evaluated, services are performed.

So for a company that's doing car repair, there could be multiple plants in the city.

For example, one in a particular downtown part or another in one of the suburbs where service is performed.

So a plant is a place where services are performed or goods are manufactured or both?

Of course.

And sometimes for services where that are not really physical in nature, for example, car service

is a little physical in nature.

What about a law firm?

Does it need a plant?

Yes, it does need a plant.

What about a software services company like Microsoft?

Does it need a plant?

Yes, it needs a plant.

So now how do we define a plant?

A plant is a place where you can manufacture goods or perform services, or you just want to evaluate

all the services that are performed under a single head.

In the case of a software services company is just an aggregation of all the costs that go into that

software services being performed, let's say, for us.

So from the perspective of valuation, a plant is a very important element.

And the plant is associated with a company called Now One plant can be associated to one company called

only, meaning Gus can have more than one plant.

Plant one.

Plant two.

So plant 1 in 1 location.

Plant two in another location.

Plant three in another location.

But one plant cannot be linked to more than one company code.

Meaning this plant cannot be linked to both US and UK.

That's not possible.

But one company code can have more than one plant, so it's a kind of a ownership thing.

So one plant plant is like an asset.

This head or the company can have this asset listed under it, but this asset cannot be listed under

both.

This company code as well as this company code.

Right.

I hope it makes sense.

So that's a plant.

And underneath the plant we have what is called as a storage location.

So think of storage location as an aggregation of a warehouse.

This is storage location two.

This is storage location three and so on.

So what's a storage location?

A storage location is where goods of different types are stored.

So one storage location could be used for returns.

Another storage location for broken items, another storage location for unrestricted goods.

Or you can have everything under one storage location, but instead underneath this storage location

and a plant, there could be more than one warehouse.

Warehouse.

One warehouse, two.

Warehouse three.

And so on.

Now, I'm not going to talk about warehouse because it's not really super important at this point,

but I want you to stop at the storage location and this is your least Aug element with respect to logistics.

First there is plant and then there is storage location for all practical purposes.

Think of a storage location as a warehouse.

So a plant has multiple warehouses.

It could be one or more than one.

One last piece of assignment is that the sales org and distribution channel combination can be assigned

to a plant.

So the combination of sales org plus distribution channel can be assigned to a plant.

Now that assignment.

Now that's one of the weird assignments that you need to do.

But other than that, most of the assignments are pretty simple.

Plant to a storage location.

Plant to a company code.

Company Code to sales.

Org.

Sales.

Org to distribution channel Sales.

Org to division.

And a combination of sales.

Org distribution channel and division is called as a sales area and the sales area is assigned to a

sales office.

Sales office is assigned to a sales group and sales group has a whole bunch of people there.

This is enterprise structure.

So in the next set of chapters, we are going to actually create these structures in the system as configuration

using a sample template.

# 33

All right.

Now that we have done the enterprise structure, in theory, we're going to configure enterprise structure

in the system in SPRO.

This will be our first exercise majorly in configuration.

Now, we have already seen case scenario of how company code, company sales or plans are all assigned

and what they really mean.

Now we are going to talk about how to create them in the system.

We will take this simple case study.

Here is our company code.

Company.

And these are our company codes.

Which is another way of saying this is the parent company and these are all the legal entities under

which this whole enterprise is operating.

So in the US we have GE Medical Systems, US and in the UK we have G met UK and Asia PAC for the Asia

Pacific region will not create all these company codes, but we can just create one.

And like I'll be telling you, we won't even be creating company codes for the simple reason that we

would never ever create company codes, because this is all fiction.

All right.

So underneath that, we have a bunch of sales logs.

Once again, like the thumb rule we mentioned most of the time, one sales org per company code like

G medical US will have one sales org in the US and UK will have another sales org.

But in case you want to create more more sales orgs, you could do it by geography, you could do it

by any other number of parameters that your users ask you to create.

So here is our set of sales orgs.

And these are the distribution channels, Agency Wholesale Retail Direct.

In this case, GE Medical Systems is selling direct and age through the direct and the agency distribution

channels in the West sales org.

So that's what these links over here mean.

And we talked about divisions.

Okay.

And these are our divisions.

We know divisions represent the product lines.

In this case, GE Medical Systems is selling X-rays and CT equipment.

So they have divided their product lines into two divisions.

And now underneath this sales area, this sales area, meaning West Direct and x ray, let's say we

have two sales offices, one in the Bay Area and one in Los Angeles.

So for this exercise, we'll just create one sales area, which is the Bay Area.

And underneath that we have two sales groups, one for field apps, which is a product line, and the

other one for consumables, which could be another example of a product line.

So this is sales group.

Now, like I said, this is Fico, so we would probably not be creating this, but instead assume that

GE Medical Systems is, um, either 1000 or 3000, which are standard existing company codes in any

IDs system.

But in a real project, remember, company company code will be created for you by your Fico consultant.

There is a whole lot of setup that needs to be done behind the scenes.

When you create a company code like the creation of GL accounts, chart of accounts, currency account

determination, so on and so forth, which we don't care about at this point or at any point in the

future.

So that's the reason why I'm saying don't even bother creating company codes.

Rather, assume that your Fico consultant has created a company code and call it either 1000 or 3000.

Thousand is the German company code.

So if you want to create your enterprise structure in Europe, use 1000.

If you want to do it in us, start with 3000.

So from an consultants perspective, we're going to be creating a sales org, distribution channels,

divisions, sales offices, sales groups.

Now, apart from this, there is a whole logistics part that needs to be created as well, like the

creation of a plant, the creation of a storage location, the creation of a warehouse, and the creation

of shipping point.

Now the plant is very much used in sales and distribution, but nevertheless, it's not your job to

create a plant.

So who will create a plant for you?

The consultant will create a plant.

All right.

So plants New Jersey or Arkansas will be created by your consultants.

In this case, the example being GE Medical Systems US is associated with two plants, one in Arkansas,

one in New Jersey.

So they have to be created in the system as plants.

While you can use the existing plants, 1000 or 3000 or 1200 if you want, you can create your own plants.

And we'll try and do that in this example.

So I'll change the color just to indicate the fact that, you know, these are not something you might

need to do in a real project.

All right.

So this is six and seven is storage location.

So underneath the plant, there are multiple storage locations.

Each storage location contains the goods that you want to store or ship.

And when you ship goods out, you'll be shipping goods out of a shipping point.

Shipping point is mostly relevant for SD, but it's either the SD consultant or the consultant who can

create that.

So shipping point is eight.

And there are in this case for the Arkansas plant, there are two doors.

Each door could be responsible for a particular type of shipment.

Like we discussed in the enterprise structure theory, there could be multiple doors in the warehouse

that that could be assigned to a single shipping point, or each door could represent one shipping point,

or all the doors in the warehouse could be represented by one shipping point, if that makes sense.

And then warehouse, like I said, is always optional.

Use the warehouse only if you implement warehouse management.

If you do not want to implement warehouse management, do not create the warehouse.

We will try and create the warehouse in this case just to see or rather complete the structure.

But remember, warehouse management is optional.

You don't need to have a warehouse management setup in order to do a sales order delivery and billing.

But if you do not have a company code, I'm just marking them in star to indicate that these are mandatory.

Company code sales or distribution channel division, plant shipping, point and storage location.

So what are the things that are optional here?

So let me change the color to green and then show you what is optional.

So this is optional.

This is optional.

So sales offices and sales groups are optional.

You don't need to have them.

Warehouse management is optional.

All right.

Now that you have a good idea on what to create here.

So let's go ahead and create them.

And as we create, I'll try and capture the screenshots and paste it in our workbook.

Okay.

So I said we're not going to create the company code because we will never ever be creating it.

So we'll start off with the sales org.

Let's say US or West, we'll start off with West.

Where do we go for this?

So go to SP, which is our customizing transaction and we have already seen the examples of customization

and we have already seen what is the purpose of customization, configuration and so on and so forth.

All right.

So I'm going to jump straight to the customization part.

Go to enterprise structure.

And you can see that there are mainly two parts to it.

One is the definition.

The second part is the assignment.

The definition is where you create all these little boxes.

So if you can look at the enterprise structure, again, the definition is where you create these sales

org distribution, channel, division, plant and all these little boxes.

The assignment is the arrows that links these boxes together.

So one sales order could be assigned to multiple distribution channels, multiple divisions, and one

sales area comprises of one sales org, one distribution channel division, so on and so forth.

The assignment of these boxes or the connection of these boxes is what is represented by the assignment

part.

So the first part that you have to do is do the definition.

The most of our work will be in these sections Logistics, sales and distribution.

Logistics.

Execution.

So we'll start off with logistics, sales and distribution.

Here is how we create the sales org.

Okay, I'll capture all these screenshots so that you can refer to them at a later point.

So the first job is to create a sales org.

The one that we want to create is West.

All right.

So here is our sales org.

So the first step is go to define copy check sales organization.

Select it.

And we have two options in this pop up.

The first option is to define a sales org, and the second option is to copy, delete, check a sales

organization.

Now you will be very tempted to go to the first option, define sales organization, but never do that.

And this theme repeats across many other enterprise structure elements.

Don't define enterprise structure elements, rather copy them from an existing standard enterprise structure

element.

Now, you might be wondering why when you define a sales org, there is a whole bunch of things that

are already assigned or rather that should be assigned that you might tend to forget or you might not

even know sometimes.

This could be a little difficult to comprehend initially.

But as you go forward and start doing the configuration, you will notice that this is a recurring theme

where you want to create configuration but would rather copy from an existing configuration set.

Now let me show you what I'm going to copy it from and why.

But before I do that, let me take this screenshot and then.

Paste it over here.

So this is the first part and this is our second part.

Step one.

And.

Step two Select this and click Choose.

Okay.

So when we select that and then click choose what happens, you get this blank screen.

I said we want to copy from something, right?

So what do we want to copy from first part and why?

If you want to copy something, click on this button.

The second button, the one that looks like one page over the other.

Right?

Like a notepad over there.

One notepad over another.

This is the copy button that you consistently encounter across all of Sbarro.

It's really easy to identify.

As we'll see.

Now there is a form entry on the two entry.

This is the form entry.

This is the two entry form is what you want to copy from and to is you want to want what you want to

copy into.

Now, in this case, we want to create a sales org.

West Isn't it?

West So the target is the two sales org, which is West Now, what's the source?

Source is 0001.

Now, why is 0001 and why not something else?

For example, there are so many of them, right?

Why am I only choosing 0001 for the simple reason that this is an ideal system which will contain a

ton of data like, you know, 1000, 2000, 2000, 200, 2300, so on and so forth.

But if you look at a blank system that you will be implementing SAP on in a real project, you will

not have any of this test stuff.

You'll only have one sales org, which is the template that you use to copy and create your own.

This is a template provided by SAP in a blank SAP system, but since the one that we are working on

is an ideas system, well, you have a ton of data.

But don't expect to see this data in a real SAP system that you're going to implement SAP on.

All right.

So that's the reason why you will only use 0001 as the source.

Now, let me take a quick screenshot of this so that you can remember the source.

All right.

So like I said, click on the copy button.

So this is the copy button.

The source.

Always be 0001.

So like I said, none of these other ones will be available.

Only 001 will be available in a standard SAP system.

Once again, these other elements here are available because this is a test system and there is a ton

of test data.

Somebody else has created them and given it to you.

In this case, SAP is partners or SAP is internal testing team has created all these different sales

logs, which would not be the case in a brand new implementation.

All right.

So start with 001 and then your target will be west.

Click.

Okay.

And then if you get something like this, just click.

Okay.

So we'll discuss what number ranges are at a later point in time.

What?

Did we not copy this?

Okay.

Like, so.

Okay.

So next step is you get this message, click okay, we'll see what transport numbers are, why they

are not transportable, what are number ranges, so on and so forth.

Now, if you do not see this, all right, if you do not see this, then you know what to do.

We have discussed this as part of our transport request creation.

Remember, if you do not see this, if you don't see a number filled up and then some text here, then

you have to click on this button.

This button.

If you if you do see this, then there is no need for you to click on this new button and create a new

transport request.

But as a practice, whenever you are creating a new configuration, always create a new transport request.

So this is a way of recording what you have done so that you don't have to repeat this again.

In a new environment, things can be copied over.

So we'll discuss what this is at a later point.

So create sales.

Org.

West So we're just setting up a small message there so that it's very easy to identify when somebody

else looks at this and says, What is it exactly that we have done at this point?

Okay, So the next step is you get this transport request.

And.

You go here, click on this new box and then enter a description and then click save.

When I click on Save, a new transport request will be generated here.

As you can see, there is a new transport request that has been generated.

Okay, so here is your new transport request.

This is called as a transport request or TR.

Which is a unique way or a unique code that identifies what you have done.

And here is your description.

And then click the green button, which completes your act of creating the sales organization.

Okay, Then you get this message.

Sales org copied to West.

Right.

So this completes the creation of the sales org.

And hit enter.

We are done.

We created a sales order called West.

Now.

After you have created the sales order, click on Define Sales Organization and then click Choose the

one that we have created.

Go search on it.

Okay, so the creation part is complete here.

Or rather, the copying part is complete.

Copy is complete.

Now, there might be some little changes that you might have to do to that sale.

For example, you might the way to come here is.

Click on define sales org and then click Choose.

Oops.

Let me move this a little bit here.

And then here we go.

So we have to click on define the sales org now and then click Choose.

So go to the next page and I'll tell you why we are doing this step.

So here we have a list of all the sales orgs that are available and that we have created, right?

So now go to the position box.

And then select the sales org that you have created.

Go to position then we have created vast.

Right.

So enter that sales or click.

Okay.

Select it and then go to the details.

Okay, so here is what you have to do.

Sorry.

There are a couple of steps that you have to do here, and then I'll explain all of them.

So what have we done here?

Once again?

You went to define sales organization.

Click on Choose.

Go to position and then selected West as the sales org that you want to see and change.

And I'll put that step as well here.

So on to position.

Enter the sales org and then select the sales org.

And then.

Click on the details button.

So select, click on the details.

So here we specify a bunch of things.

At this point, not very important, but at a later point you will see that a sales org will also have

certain parameters like what is the currency?

What is the number?

If you are doing any text messages, what, where?

What is the if you are printing, the address of your sales are going to form like an order, an invoice,

what should be the address, so on and so forth.

Okay.

Apart from that, there are other areas like intercompany rebates, um, so on and so forth which,

um, we will not be very worried about at this point.

But what I want you to take away from here is that this sales org has certain properties, okay?

Now if you go to the this little box, okay, this little box where you specify the address.

Okay.

What is the name?

West.

Uh, whatever.

West something.

Something.

And then you can specify the address.

Where is it?

So West is in 1100 south west, uh, Andrews Road.

And then 67009 California.

Uh, no.

It's like, um, San Francisco.

Okay.

And then us and then so on and so forth.

Whatever you want to enter here, you can enter all that stuff in there and then click okay, which

is a way to change the address of the sales order that you have just created.

All right.

So the first step was to open that sales org and then click on the address details and change the address

to the exact address that you want that sales org to be headquartered at.

Okay.

So finish that.

Oops.

Uh, California.

Okay.

Okay.

Save it.

And every time you save it, this pop up box comes up.

Now, if you look at this box, I might not want to create a new transport request here.

Why?

For the simple reason that, you know, what I've just done is also part of creating that sales order,

like changing the address.

But the next step, which is maybe creation of a distribution channel or whatever, is a totally different

step that requires its own transport request.

Right.

In that case, I'll be creating a new transport request.

So for now I'm just going to say, okay, whereby these two different activities that I've done just

now.

The first one being creation of a sales org, the second one being changing the address of the sales

org are all recorded under a single transport request.

Okay, I'm done here.

Going back.

Going back.

And the next step is the distribution channel.

Now.

Next step is distribution channel.

If you remember that picture, the distribution channels were agency and then something of that sort,

right?

What was that?

Oops.

Okay.

Agency and then direct.

Right.

We want to create direct as the distribution channel and then x ray as the division.

Okay, so let's create the distribution channel as agency.

So again, where do we go?

We go here to create a distribution channel.

Click.

And what do we do?

As usual.

Copy.

We don't do define.

Right.

Copy.

Go to copy.

And then from zero one, which is a source here again, there might be many distribution channels,

but we copy from zero one.

Okay.

And we want to call this division as, as as agency distribution channel as agency.

So you can call it a G.

Right.

So I'll take a screenshot here to say that we are creating a distribution channel here of type.

AG which we are copying from.

Zero one.

So we click okay, and then you get this transport number problem, which is fine.

Now here I'll be creating a new transport request because in the previous one we have created a sales

org.

But in this one we are going to do a distribution channel, right?

Two separate things.

One is independent of the other.

So create

distribution channel.

AG standing for agency.

Okay, save it.

And this will create another number here, which is a different transport request number, different

from the previous one.

And then click okay.

Distribution channel eg copied to e.g..

We are done here, right?

Copy.

All of this stuff moved a little bit here.

And then we are we have completed the creation of the distribution channel.

Next is the division.

Where is the division?

Here is the division.

Okay, so there are little haphazard.

So you just have to make sure that, you know, you search all of the places in the enterprise structure

section.

To find out where all the different elements that you're going to create are.

Okay.

They're not in the order that we have learned, meaning sales or distribution channel division, sales

office, they're not in that order.

They're a little haphazard.

So you have to be a little careful in where you search.

But nevertheless, everything will be under that enterprise structure branch.

It's not a very big branch, so you don't have to really worry about it.

Okay.

The division that we want to create is x ray, isn't it?

So again, we start with zero one and then create x ray as the division.

Okay.

Create new division.

X r standing for x ray.

Enter and then it will create a new transport request as usual.

Click.

Okay.

Division is copied and then we are done.

What have we done here?

Created new division.

X r.

Right.

So distribution channel is done, Division is done.

Then we have sales office.

Again, this is an optional entry, but just for the sake of completeness, we'll be doing this sales

org as well.

Sales office.

I mean, so go to sales office then you can either create a new entry or you can choose to copy from

001.

Okay, now.

I'm taking a different beat here.

I'm saying you can either copy or you can choose from 001 why you can sales office.

So I'm saying you can either copy or you can create your own.

But that was not what I said when we were creating sales orgs or distribution channels, especially

sales.

Org.

The reason being anywhere in the configuration where you have that magnifying glass kind of a button.

So here is a thumb rule again.

So if you have magnifying glass.

Safer to choose.

Copy.

Copy.

In this case, there is no magnifying glass.

Right.

So you can just choose new entries.

No problem.

Or you can as well select 001 and then click on copy.

Okay, so I'll choose new entries just to illustrate that.

It doesn't really bother.

All right.

So what is the sales office that we should be creating?

The sales office is, let's say Bay Area, right?

B, A, Y, A The description is Bay Area area.

And then we have to enter some address here.

Now, I'm not going to enter the full address here.

Bay Area Sales Office, it's in the US, blah blah blah.

Then you can enter all that address anytime you like and then save again.

Create a new address, new transport request create.

Sales office.

B a y.

A four bay area.

So give as much of a meaningful description as you can because it's going to be really useful after

a certain point in time where you might want to dig back into the system and see, you know, what are

the things that are being done, especially after a go live.

If you want to find out a particular rogue transport that might be causing some problems, it's very

easy to identify if you have a request description that's more meaningful.

All right.

So similarly, you can create any any other number of sales orders that your sales officer that you

want.

But for now, we just we're just going to go ahead and create sales groups.

Again, the sales group that we'll be creating is, let's say, a consumables CEO and consumables.

Consumables enter.

Okay.

The one that we'll be creating here is consumables.

Okay?

Sales office is that and then sales group is consumables.

Okay.

So in fact, we can copy all of this stuff into the previous slide.

Right?

Like so.

So here is our sales group and sales office.

Save it, then.

Create.

Create.

# 34

New sales group can enter.

Okay.

So we have done our sales part, which is creation of a sales organization, creation of a distribution

channel, creation of a division, sales office, sales group, company code and company will be created

by your Fico consultant.

But we will also do the part of consultant which is creation of a plant and storage location.

Okay.

Sometimes, you know, as an SD consultant in smaller projects, you might have to do this, but it's

very, very rare.

But nevertheless, we will see it just for the sake of completion.

Okay.

Next one is Plant.

So how do you create a plant?

Here is how you create a plant.

Next is.

Plant.

So here is how you create a plant.

Go to define copy check plant and as usual copy but don't define So copy, delete, check.

Click on choose.

Click the copy button.

Choose the source as 0001.

And the target is going to be.

And we're going to choose the source as 0001 as usual.

And the target is going to be the plant in New Jersey, let's say.

So it's going to be New Jersey and then hit enter, you know, the same transport number, message click

okay.

And as you see in the left bottom corner, it's trying to read the tables and do a bunch of stuff behind

the scenes that we know don't need to bother about at this point.

So it's a pretty intensive series of steps that SAP is doing behind the scenes, which we should we

need not be aware of as it's not very important.

But what is important is to understand that you should you shouldn't create plans, but rather copy

plans from standard setup.

And here we go, same old familiar transport request, click on new and then what are we doing here?

Create new plant, new J and try to be as descriptive as you can.

As usual.

So according the transport.

Look at the left bottom corner for any messages or, you know, as any progress that SAP is doing in

terms of copying or any other stuff like that.

Okay.

The message finally that you get is plant 001 copy to New Jersey without number ranges, understandably.

And we don't really care at this point as long as we see that our plant has been created.

New Jersey is the plant that's created.

Okay.

Now, as usual, go back to define and then click Choose.

Then select verse.

Sorry, Uh, select new plant and either go inside the plant like this and then change the configuration

is required or go to the address details and change whatever address, um, that you want to change.

Okay.

In this case, I will let it remain as it is.

But you might want to change the address of the plant in a real scenario, because if the plant is in

San Francisco, you don't want this address to be there.

The world of Germany address.

Right?

That's the plant.

But I'm going to remain as it is and move forward.

Okay.

Plant is done.

And then we have storage location.

Right?

So where is our storage location?

Go to material management and we have maintain storage location.

Right.

So here is storage location configuration.

So we want to create a storage location.

Where?

Storage location for the plant.

New Jersey.

Right.

So enter your plant as New Jersey.

So in order to create your storage location, the first thing that you have to do is enter the plant.

Right.

So enter the plant.

Enter the plant and then click okay.

And you see that there are already three different storage locations assigned to that plant.

If you want to create your own storage location as usual, select 001 and then create new entries by

copying.

Or you can use.

Just start creating new entries and then, uh, create your own storage location.

Right?

And then click copy.

Or you can use new entries to create your own storage location.

Now, if you think these storage locations are not relevant, you can delete them.

Okay, select all of them and click on this button to delete most of the cases.

That's what you'll be doing because you don't require those standard storage locations.

You might want to create your own storage location like so.

Okay, then click on new entries.

What is the storage location that we want to create?

The one that we want to create under the New Jersey plant is, let's say in New Jersey.

In Jersey City.

Jersey City.

There is a storage location, There is Jersey City storage location.

Okay.

And select it.

Go to address.

If you want any addresses, you can specify that here.

Oops, sorry.

Specify that.

Here.

Address of storage location.

All right.

I don't know why I'm not able to do it, but that's fine.

So create storage location.

Jersey.

Jersey City.

Right.

Save.

Then our warehouse.

Like I said, warehouse is optional, so I'm just going to show it for the sake of completeness.

But when you want to do it, you can just definitely skip this step.

So here is the warehouse step under logistics execution.

Okay, Warehouse.

Like I said, this is optional.

Okay, here is our warehouse.

Select this and then as usual, define copy.

Delete.

Check.

What warehouse do you want to select it from?

We want to select it from 001 and then call it the warehouse WH1, let's say.

All right.

So you want to create a new warehouse?

You copy from 001 and create your own warehouse WH1.

So create new warehouse WH1.

Okay.

Then warehouse 001 copy to WH1.

Sorry.

Okay.

This is the warehouse step.

And hit.

Enter.

Go back.

Okay.

You can, as usual, go and change.

Um, the address of the warehouse, the address formats and all that stuff.

The next is the shipping point.

So we know this is where we ship and create the shipping point.

Go click on Choose as usual, click copy.

0001 And then the shipping point.

We are, uh, let's say we are shipping, uh, delicate medical equipment, right?

So or consumables, let's say consumables.

Consumables are like they are consumed by the equipment, like, you know, gels that they write for

on your body when you want to do when they want to do a CT scan or any of those consumables like syringes

or stuff like that.

So if you want to ship consumables, you'll definitely ship it in a different format than when you ship

those capital equipment.

So for shipping point, we can define two shipping points, one for capital One for those sensitive

equipment, and the other is for, um, temperature sensitive equipment, like, you know, those vials

of bottles or all that kind of stuff like gels that need to be kept under a particular temperature.

Now this is sensitive equipment and I'm just using a term there called sense create shipping point C

and S for sensitive equipment.

Okay.

The shipping point that we are creating is SNS.

Oops.

Okay.

So we are doing that there and we are doing that here.

Warehouse is done.

Shipping point is done.

All right.

So we have done most of the stuff here, like creation of plants, storage, location, shipping, point

and warehouse.

So the definition part is done.

So you close the definition part and move on to assignment.

Now, let me go back to that picture there where I think it was a long way back.

Where we see all the different, um, uh, enterprise structure elements.

And then you see we have created most of these things.

We have created West, we have created direct, we have created x ray, we have created Bay Area.

We have created Field App sales Group, New Jersey, plant some shipping point storage location, warehouse,

right.

Optional as well as mandatory.

We have done all that stuff.

Now for the next part, what we are going to do is link them up together and we're going to start here.

We're going to start with assigning the plant sorry, the store, this sales organization to the company

code.

Well, we're going to choose 1000.

In this case, you can choose 3000 or 1000.

Then the actual number will be given by your Fico consultant.

Right?

So the definition part is done.

And now we're going to start with assignment.

Go there.

Start with sales and distribution.

Assign sales org to company code.

So the sales org that we have created is.

But before I go there, let me take a screenshot.

Okay.

First part is create assign a sales order to company code.

The sales org that we have created I guess is West West is assigned to 0001 company code.

We don't want that.

We want it to be assigned to 1000.

Now, you might have a question here.

So who has assigned the sales?

Org west 20001 company code.

We didn't do that until this point.

Right.

So SAP has automatically done that under the assumption that that's what you want because we have copied

it from 0001.

If you remember the sales org West was created as a copy of company of sales.

Org 0001 and internally 0001 sales org is already assigned to company code 0001.

But that's not the assignment that we want.

We want West to be assigned to company code 1000 or 3000 or any other company code of our choice, and

we can change it here.

All right.

So you can change it here like so.

Okay.

We can change that assignment.

Here.

So change it.

Yes, of course.

We want to change it.

Assign sales org west to company code 1000.

Again.

Like I said, you can be as descriptive as you want.

The more descriptive you are, the better it is.

All right, so what have we done here?

We have chosen west as the sales org and.

We have us copied.

Sorry.

We have assigned West to the company code 1000.

So this is the change that has been done.

Changed from 000 1 to 1000 or a company code of your choice.

Okay.

Next is distribution channel to sales organization.

What distribution channel do you want to assign it to?

The one that we are interested is in West and you see, West is assigned to so many different sales

organization distribution channels, right?

But we are not interested in this or this or this.

We are only interested in AG, which is the one that we have created, which is agency sales.

Again, you might have a question Who has done all these assignments?

Remember, these assignments are done as a part of the copying process behind the scenes by SAP, okay?

And it's a side effect of copying.

So if there is any other assignments that SAP has already done for 0001 sales, org, it will already

be done for you.

But it's very easy to correct.

All you have to do is select whatever is not necessary and click on the delete button and then all the

stuff that is not necessary will be gone.

Right.

So go here.

And what we are doing here is this step.

So select whatever is not necessary and then click on delete.

Delete Unnecessary assignments.

Okay.

So delete.

Say again.

What are we doing here?

Assign sales.

Org west to distribution channel agency.

EG

okay.

Save go back, assign divisions to sales.

Org.

What is the divisions that we are interested to assign West to?

We are interested to assign it to x rays, isn't it?

So select whatever is not necessary again, and then only assign it to x rays.

Oops.

Or maybe we can go back and set it up right there.

Okay.

Oops.

Sorry.

Pick up this window.

Put it here.

And this is that.

Select whatever is not necessary and then click on delete.

Right.

So we have done three things.

Assign sales org to company code, assign distribution channel to sales organization and assign division

to sales organization.

Now copy this guy because this is what we'll be using again in the next picture, because we have just

done only three pieces in this menu path.

This is done.

This is done.

This is done.

Now we need to do this part.

Setting up of sales area.

Assign finishing up the previous configuration, which is assigning West sales org to division.

X ray.

Okay.

Save it.

Go back.

Now the next is setting up our sales area.

Go here.

Click on this button.

It will set up this.

It will show you the sales area.

The one that we are interested in is to set up West distribution channel, age and Division x ray.

Do we have anything like that?

Of course we have it.

But as usual, apart from that, there are a ton of other things that we are not interested in, isn't

it?

So we are not interested in everything that I'm highlighting here.

We are only interested in this one row West age x SR.

So everything that is not relevant, you know what to do.

You just have to delete that stuff.

Okay.

Once again that assign that that extra assignments is automatically made by SAP because.

We have copied West from 0001.

Okay.

That's that.

And save.

Assign create rather sales area West and Distribution Channel Agency, and then Division X, R, which

stands for X Rays.

Okay.

Next is assigned sales office to sales area.

Okay.

What sales office needs to be assigned to the sales area.

Go to sales office and select West.

West should be assigned to sales area sorry West and Distribution Channel, Division, Agency and SR.

This one needs to be assigned to a different sales area which is sales office sorry, which is Bay Area.

If you remember, the sales office that we have created is Bay Area, but that assignment is not here.

So delete everything.

That is not necessary.

Delete and go create new entries for West.

Distribution channel Agency Division X Ray and Sales Office Bay Area.

Okay.

This is the entry that we want to create.

Save it.

New entry assign sales area West.

Distribution Channel Agency and Division SR to Sales Office.

What is the sales office that you want to assign it to?

Bay Area.

Enter and then click.

Okay.

We are done here.

It's pretty simple, isn't it?

As simple as it can get.

You know, once you get a hang of what we are doing here, this whatever we are doing here is really,

really easy.

There's no complication here at all.

All right.

You just have to have an understanding of what we are doing on paper.

Once you have that understanding, whatever we are doing is pretty simple.

The steps.

The actual steps are pretty simple.

They if you know one step, all the other steps are very easy.

Okay.

But understanding those concepts and understanding what a sales office is, sales area is, is more

important.

Next step is assign sales groups to sales area.

Okay.

Sales office is Bay Area and is it assigned to anything else?

I don't even see that entry.

So click on new entries and then create Bay Area.

Assign it to sales group Con, which is our consumable sales area, isn't it?

So this is the next step.

Oops.

The next step is assign sales group to sales area.

So this step is done as usual.

Create your meaningful transport request.

Assign sales group to sales.

Office.

You can specify the names very clearly so that it's easy to understand.

Okay, then the next step is assign the sales organization to plant and distribution channel combination

to plant.

So select that.

The ones that we have created is West and distribution channel is agency right for West and agency.

We want it.

This is the assignment that we are interested in.

West and agency should be assigned to the plant.

New Jersey and the rest of them can be deleted.

Right.

Oops.

This is this entry.

Delete everything that's not necessary.

Like by doing that and click save assign distribution channel and sales.

Org west egg to plant.

New Jersey.

Okay.

That's done.

And then you can close this guy.

Go to logistics, execution and assign warehouse number two plant and shipping point two plant combination.

Okay.

This one is very simple as well.

No sweat.

Go to the next one and assign.

Warehouse number two, plant storage location.

The one that we want is Plant New Jersey.

And New Jersey is assigned to a storage location 0088.

If you have created it as a storage location, you can use that.

If you want to have a new storage location, you can choose that.

See, this one is Jersey City, right?

Which is Jersey City.

So go to New Jersey.

New Jersey Storage location is Jersey City and warehouse number is, I think, warehouse one.

If you don't know these entries, you don't need to remember them.

You can just go here and search.

Like I said, it's very easy if you set this on paper first and then do it on the system, hands on,

assign, plant, New Jersey and storage location.

Jersey City.

Two Warehouse one.

Okay.

This is the assignment of the warehouse part.

Okay, let me go.

I think we are getting closer to our final results.

The next one is assign shipping point.

Sorry, assign shipping point to plant this one.

So you go there and select assign shipping points to plant.

This one looks a little different than the other ones.

As you can see, you know, the interface looks a little different.

So the way to search for it is click on the search button, okay?

And then find the plant plant.

In this case being new J Right.

This one is a little different.

Okay.

Okay.

Search.

Go to search.

Enter the plant.

And as soon as you enter the plant, it will show you the plant that you have selected.

And then select it and see if the storage location is assigned.

Shipping point is assigned to a plant.

In this case, sense is assigned to this plant and any assignment, if it is there, you're done.

If not, how do you assign this?

If you want to assign, let's say, 3000 to plant New Jersey, how do you assign it?

So select your plant.

And then click on Assign your possible list of shipping points comes up.

Select it and then go to the next page.

In this case, first step is select plant.

First step.

Second step, click on assign in the third step, the pop up comes up.

So select the plant.

This is step number four and click on this for step number five.

Okay.

Similarly, if you want to delete, you can select a row and then click on delete.

This is assigning shipping point to plant in this case since is already assigned to New Jersey so I'm

safe assign shipping point sense to plant New Jersey.

Then click on Save.

We are done with our enterprise structure.

We have done a whole bunch of things today.

Want to see what we have done because we have been doing so many descriptions in the transport request.

Right?

So go to SE zero one.

Okay, so go to C0 one, which is the transport organiser or transport request views.

Okay.

And then select modifiable and released.

Okay.

I would rather.

Yeah.

This this should be good enough.

Okay.

Select.

This.

I'll tell you what modifiable is and release this at a later point, but make sure you have selected

both of them because some transport might not be released and some transport might be released.

If you want to see a comprehensive list, this is the easiest thing to do.

Okay, then click on display.

Okay.

The entire list of transports that you have done will be shown here.

So if you collapse this, you can see that these are all the transport requests that you have done here.

See.

The list of.

Customization.

Done by you against your username and the client and the description that you are given and the unique

numbers is all here.

Okay, Now another chapter called Landscape is where we'll be discussing transport requests, how to

create transport requests, how to modify transport requests, how to release transport requests, what

is the process of release?

What are the contents of a transport request?

What is the landscape?

Is all something that we need to discuss as part of a different class.

So until that point, you can just leave this concept right here.

All right, so this is transport requests and this is enterprise.

Sorry, this is enterprise structure for you.

We have just completed a full enterprise structure, as you will be doing in a in a full setup.

Any questions you have, we can discuss them as part of the hands on that we are going to do on Tuesday.

Okay.

Thank you very much.

# 35 - Common Distribution Channels and Divisions

In this chapter, we are going to talk about common distribution channels and divisions.

Before we talk about the details, let me do a quick experiment.

Can you create a customer master?

With a blank or a wild card distribution channel or division.

Meaning when you create the customer master sales view.

You enter the details.

Of sales.

Org.

Say 1000.

Distribution channel.

You know, ten or 20 or 30 and division is zero zero.

Can you wild card this?

Meaning put a star or a blank.

Let's try it.

To go to logistics.

Uh, sales and distribution master data.

And business partners.

Customer Create V01.

Enter the customer of 1000.

Sales.

Org of 1000.

And typically we would put a ten year or 20 or whatever distribution channel division of zero zero.

Now, the experiment that we are making here is what if you just put a blank or just put a star?

Does it work?

Let's see.

Whoops.

It says that the sales area 1010 is not defined for customers.

So what does it tell you?

It tells you that you cannot create a customer with a blanket or a wild card distribution channel or

division.

So before I explain why I'm doing this, let me give you a business scenario.

Say there's Dell Computers.

It's trying to sell to a customer.

Say ABC Electronics.

And the sales org that is trying to sell is in 1000.

Now.

Devil could be selling to ABC Electronics.

In different formats.

ABC could be buying from Dell as a retail customer for their own internal consumption.

Or it could be buying from Dell as a reseller.

Intending to sell it to other customers, maybe after value adding some components.

Or it could be buying just as a distributor to distribute goods to other customers down the line.

Now, when you want to create ABC Electronics across all these channels, you will be forced to create

this customer three times.

Say retail is distribution Channel ten and reseller is distribution Channel 12.

Distributor is distribution.

Channel 13.

You'll have to create this customer three times.

So one is for sales.

Org 1000.

Distribution Channel ten, which is a retail division that say.

Zero zero.

Let's make it less complicated.

And another record for.

A reseller and another record for distributor.

Why?

Because a customer always has to be created for a combination of sales.

Org.

Distribution channel and division.

Even if the data is same across all the distribution channels or all divisions.

In this case, it's the same customer.

The data.

Across the retail channel or the reseller channel or the distribution channel is not really changing.

So why are we forced to create this customer three times?

We have to do this.

Do we have another option?

Can't we just say, Hey, you know what, I'm going to create this customer for this combination?

Thousand ten zero zero.

And just.

Refer to the same data.

For all other distribution channels or divisions.

Because the data remains the same.

So all we're trying to say is instead of wildcarding this and saying, you know, this is the data for

all distribution channels, can we pinpoint, can we just select a certain set of distribution channels,

say 12 and 13in this case?

And say that this data always refers to ten.

Yes, you can.

The way to do it is with Common.

Distribution.

Shall.

Or common divisions.

Sometimes it's also called reference.

Distribution channels or reference divisions.

So I'm saying that if you maintain data for this combination, you don't need to maintain it for this

combination because it's already exists.

Why does it exist?

Because 12 refers to ten and 13 refers to ten, and there is no need to create data again for 12 and

13.

Now let's do another experiment.

Let's try to create.

The customer for the combination.

1012 zero zero.

Very easy.

Just put.

12 year.

Whoops.

It says that the sales area 1012 zero zero does not exist.

So what does this tell you?

Tells you that when you create ten as a reference distribution channel for 12 and 13.

You can't really create data again for 12 and 13.

Now, you might have a question here based on this error message sales area thousand 12 zero zero is

not defined for customers.

Is it really true that thousand 12 and zero zero are not defined for or are not defined as a sales area?

Well, let's find out.

Go to SPR.

IMG.

Enterprise structure, assignment, sales and distribution.

You can set up sales areas and go to selection by contents.

I'm going to select sales org and say division.

Because we want to search by division zero zero and sales.

Org 1000 Jews.

We have 1010 zero zero.

Thousand 12 zero zero and 1013 zero zero created as sales areas.

That means that even though the sales area 1012 zero zero exists in the enterprise structure, still

SAP does not allow you to create a customer for this combination.

It only allows you to create it for this combination.

Where is this configuration that allows you to reference one distribution channel to another and go

to SPRO?

And instead of going to enterprise structure, you might be tempted to go there, but it's not there.

Go to sales and distribution and then go to master data.

And this is where the configuration for common distribution channels and divisions is.

So let's go inside the common distribution channel configuration.

Go to position.

Select 1000 and.

You'll see.

Ten, 12 and 13.

Was the first column represents the sales org.

The second column represents the distribution channel.

And for ten, the reference distribution is channel is ten.

And for 12, the reference distribution channel is ten, and for 13 the reference distribution channel

is ten.

So ten is really referring to ten, meaning ten is the reference distribution channel, which is good.

And Paul is also referring to ten.

And 13 is also referring to ten.

So this is the configuration that says that ten in this case is the common distribution channel for

12 and 13.

Now you see two columns here that references ten, for example, distribution channel 12 references

ten here and here.

The one that we are interested in is this column, because that is the reference distribution channel

for customers and materials.

For now, just understand that reference distribution channels or common distribution channels are not

just for customers or materials, they are also for condition records.

So they refer to pricing condition records or other kind of condition records.

And this column refers to master data.

Like customer.

Or material.

You could have a different combination for each of them, but it's very rare.

You always go with the same combination.

Now we know the configuration and we know the result of the configuration.

When you create the record.

Again, let's do another experiment.

Let's change this.

Something else.

Let's say 13.

13.

What should happen now when you try to create a customer master for 1000?

12 zero zero combination system should say no because it really refers to ten.

But when you try to create it for 13.

Housing sales.

Org 13 distribution channel zero zero division it should say.

Okay.

Right.

Let's try that.

So let's change this.

213.

And this 213.

Save it and try to create a customer.

Which is VD01.

And it's going to be 1000.

Instead of 12, we are going to put 13 because we just dereferenced 13 to refer to itself instead of

the common distribution channel ten.

This works fine.

So what does this tell you?

As long as you reference another distribution channel, you can't really create master data for the

referenced distribution channel or the referenced division.

Couple more learnings here.

All along we have been talking about distribution channels.

The same logic, the same logic as in common distribution channel or reference distribution channel

plies to common divisions as well.

You could see that in the example here.

So this configuration for common distribution channel and this configuration for common divisions.

And the second point is the same logic applies to not just customer master but material master and condition

records.

Okay, so what does it mean?

This means that when you create a customer, you only need to create one record because 12 and 13 already

reference.

And what if there are more divisions?

Say there are zero zero ten and say 20?

Ideally, if you don't reference another division, you would still have to have the same problem that

you started with.

You'd have as many records as there are possible sales areas.

So which means you have to do this one record, plus you'll have to do 1000 plus ten plus 20.

That will be another record and 1000 plus ten plus 30.

That will be another record.

So if you have three distribution channels, ten, 12 and 13 and three divisions, zero, ten, 20,

you'd have to create three records.

Can we minimize that?

Yes.

You could have ten reference zero zero 20 reference zero zero.

In which case there is no need to maintain these two records as well as these two.

You could just have 1010 001 record and all the other sales areas really reference the 1010 zero zero

record.

Right.

What are we doing here?

We are reducing the data maintenance.

So instead of nine records.

That you would probably have to maintain if you did not have common distribution channels and divisions.

You are just maintaining one record.

What about the material Master?

Same thing.

If you go to a material master, say zero one.

And select the materials say M01.

Hit.

Enter.

And then.

We are only interested in.

These days, right?

So click okay and you'll see that you'll have to enter a sales org and distribution channel to maintain

sales data for that material.

Now, granted, you don't see a division here.

The material master case, because divisions are really part of the material master maintenance.

You still have distribution channel.

So in this case, when you reference 12, 13, 14 to 10, you don't need to maintain data for 12, 13,

14 sales or distribution channel combinations.

You can just maintain for ten.

And the rest of the data really references ten.

And same is the case with condition records.

Let's try and maintain a condition record.

Go to week 11.

And enter PR00.

Select the combination material.

Click okay and you'll see that sales or distribution channel is typically a possible combination in

most of the pricing condition records.

So if you maintain for ten, you don't really need to maintain for 12 or 13.

If you try and maintain for say, 12, which really references ten hit.

Okay.

You'll have a message here saying that condition records cannot be created for distribution Channel

12.

So if you try to create condition data for distribution channel that really references a common distribution

channel, you get an error message saying that you cannot maintain conditions for that possible combination.

So that's about condition records.

So let me summarize what we have discussed here.

Okay.

Creating Master data for all possible sales areas is not necessary.

So this is master data proliferation.

You don't really need to do it.

And the way to avoid this master data proliferation is common distribution channels and divisions.

Another point is when you create a reference distribution channel division model data only needs to

be created for the common distribution channel division combination.

The rest of the distribution channel division sales area combinations need not be maintained and cannot

be maintained.

# 36 - Why is Enterprise Stucture required ?

Okay.

Now, when we think of this enterprise structure and our price structure.

And ask yourself the question, Why are we doing this?

Enterprise structure.

Most people will be tempted to say, Yeah, we're doing this enterprise structure because we want to

structure our enterprise.

Meaning we're going to put some organization around the company.

That will be a very tempting answer, but unfortunately, that's not correct.

That's not the reason why why we do enterprise structure.

Barring a few exceptions, 1 or 2.

Most of the elements in the enterprise structure like sales.

Org distribution channel division.

Sales office sales group.

These things are really useful for reporting.

This is the most fundamental reason why we do enterprise structure.

What I mean by this reporting thing and I mean reporting.

Okay, how many how much of sales did we do in this distribution channel?

How many new, let's say, sales and let's dollar 100 million in retail and dollar 150 million in franchise

sales.

So that gives somebody up in the value chain, say the CEO or CIO, some picture on which distribution

channel to concentrate on, which needs more efforts, which gives them more leverage, so on and so

forth.

And you can probably think about a million reports like this based on sales or based on divisions,

which product lines are doing more, which product lines need more and more R&D because the sales is

increasing, which is an upcoming and promising product line.

So on and so forth.

And you can talk about sales offices.

How what kind of sales did this particular sales office do?

How much commissions did the sale, the particular sales group sales group, how much commission did

he get?

These are all examples of reports that can be pulled once you create your master data and transactional

data according to a particular structure.

And that structure in this case being the enterprise structure.

So reporting is the primary reason why you use enterprise structure.

Okay.

There is another reason which is more operational.

Okay.

Let me write here.

Operational.

Meaning you want to give a special discount.

Example you want to give a special discount to all, let's say coupon, right?

You want to give a special coupon to only retail distribution channel.

So unless you classify as a customer belong to retail or a transaction like a sales order belonging

to a retail, you know, section or segment, you can really give that coupon out.

Right.

You only want to give that out to a retail.

So giving a coupon is an example, giving a discount, any other kind of discount like a promotional

offer where you do 10% discount to all corporate customers?

Sure.

I can only be possible if you classify the customer or the transaction as being corporate, right?

You want to have special pricing for it.

You want to have special freight for it.

These are all operational reasons, meaning they are useful for your day to day operations.

So unless you classify your data like the customer master or the transactions as belonging to one particular

segment, you can't really, you know, create all these operational.

You can't really give these or do these operational interactions like giving coupons, discounts or

having special freight, so on and so forth.

So these are the two main uses of enterprise structure.

One is operational, second is reporting, the third is almost a subset of reporting, I would say is

what I would call.

So we have two uses.

Right?

Let me just summarize that.

So you got your enterprise structure.

And you have two uses for that, I said.

One is operational.

Where on a day to day basis you would need your data to be structured in a particular way.

And another is reporting.

Okay.

Now as a subset of reporting.

Is internal versus external.

Internal is all the reports that we have discussed in reporting, like sales reports, operational reports,

like what's the total discount that we have given?

Are we going to losses or profits?

That's internal.

It's only relevant for our own company's employees or the decision the decision makers.

But external is.

Probably for the government.

Or for the SEC or for any other external board that requires some data.

If it's a publicly traded company, let's say if it's a private limited, Yeah, the government is probably

needs your transactions for tax records, but if it's a public limited company, yeah, like Apple or

any of those big companies, they would need to file their returns with the SEC because they deal with

public money.

The bottom line is.

This is a special kind of reporting that not just used internally within the company, but it's sent

out to somebody else like the government or SEC.

The key element that is used for this external reporting is company code.

Okay.

So it's a pretty important argument.

That's why all business transactions are performed under this head.

So irrespective of whatever the business transaction is, anything that happens in the company, Well,

most things.

Okay.

Have to happen under a particular company code.

Okay, so company code is company code is super important.

Company code is very important.

The reason being, like I said, everything has to be done under a head.

Now, when we talk about sales, we talk about sales.

Org.

So everything happens under a sales org.

And we talk about purchasing.

Everything happens under the purchasing org.

When we talk about warehouse management, everything happens under a plant.

But when we talk about the company in general.

The big Daddy for all of these different ARG elements is the company code.

And any transaction that you do here or here or here has to be finally linked to a particular company

code.

That's why each sales order is linked to a company code.

But like.

And similarly, purchase org is linked to a company code and similarly plant is linked to a company

code and so on.

Okay, so company code has a special place in that.

It's, it's the head under which you do all your transactions so that anything that you want finally

when you pull your balance sheets and profit and loss, it's done at the company code level.

This is the place at which you do your profit and loss account.

So which is basically accounting for how much did we make this year and how much did we lose this year.

Right.

And balance sheet.

So how much assets we have, how many liabilities we have, so on and so forth.

This is the importance of enterprise structure.

So let me quickly summarize what you've just learned.

We were trying to discuss the importance of.

Enterprise structure.

So we said enterprise structure is not just created because you want to put our org into structure,

but.

The two main reasons why we do enterprise structure is one is reporting.

And another is operational.

Reporting, because unless you organize your transactions into different sections or sectors or other

any other kind of org elements, you can't really do any kind of reporting on it.

And we have seen some examples of reporting like sales reports, purchase reports, discount reports

or channel reports.

These are the types of reports that can be pulled out of the raw data, like the raw customer data or

raw sales data or raw purchasing data.

Raw invoices, data.

Operational, on the other hand, is giving.

Or rather performing certain operational activities based on the way you have structured your enterprise.

So we want to give special discounts to to a particular channel or you want to give coupons to a particular

customer group unless you really classify a customer as belonging to a particular channel or a sales

order belonging to a particular channel, you can't really do these operational things that are required

generally in the enterprise.

So reporting and operational purposes are the main reasons why an enterprise structure is created and

used.

So a special case of reporting is company code.

Company code where we said the reporting that happens in company code is not just used for internal

purposes, but it's used externally also like reporting to the government for tax and other reasons.

So company code plays a very special role when we talk about reporting.

So like I said, all transactions have to be accounted for in the company code.

So that's the head under which all accounting is done.

If you move goods from one place to another, the company code has has to record it.

If you sell some goods to the customer, the company code has to record it.

If you purchase some goods, the company code has to report it.

So a special sub case of reporting that is especially used for legal and government purposes is the

company code.

So this is a pretty important piece of enterprise structure that that's used, you know, both for operational

as well as reporting and especially on the legal and government front.