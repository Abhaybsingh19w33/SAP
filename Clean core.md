Introduction
Hello, my name is Michael Skubal.
I'm from the Farhana private cloud product management.
And today I'm going to give you an overview on the topic of clean core, what it is actually, how to get there and to get a better
understanding what clean core why to do clean core.
So without further ado, let's get started.
I will also give some example, going in a little bit more detail into one dimension of clean core extensibility so that you can get
a better feeling. Actually, what this means for a specific dimension of clean core.
Why to do it
Let's get started with the why to do it today.
Customers facing challenges different from the past that the environment business environment is changing
rapidly. They need to adapt business processes more quickly.
New technologies are emerging.
I, for example, where they also quickly need to adapt their business processes, their systems to these new technologies.
And also landscape complexity is increasing with distributed systems.
And all this means for the system.
Technically, customers need to stay up to date, stay up to date with their system, with the functionality and the business processes in the
system. And this is actually where clean core can help.
So the benefits when following clean core guidelines principles is more agility to be up to date with the system.
Also then to leverage the latest innovations for customers, but also besides agility being up to date with the system,
also to have efficient and secure operations, but also data to value is important to have the right data in the system, in the
right quality for reliable forecast, for example, or for precise predictions.
So there are several guiding principles for clean core.
Clean Core Guiding Principles
Starting with avoid whatever is not necessary and what not does not bring any benefit, any value to your business.
This might be extensions talking about one dimension of clean core, but also avoiding unnecessary data.
Unnecessary data growth.
Avoid whatever is not necessary.
Next one is be aware so not everything can be avoided, but things which are not clean core compliant, which are
not in guidelines in line with the guidelines of clean core, at least to be aware.
Okay, what are these things so that you can over time then reduce this and get even in those areas where in a short
time frame or right in the beginning, you cannot get clean core compliant, that you can get closer to clean core over time.
Also being cloud ready to do, for example, extensions in a way, even if your system is on premise today,
that later on also you're ready to move to cloud to to move parts of the functionality, to cloud, to
integrate with cloud applications, to do and rebuild everything in a cloud compliant way already.
And talking about cloud also for extensibility for additional functionality.
Also to leverage the SAP business technology platform for further innovations and extensions.
So these are four clean core guiding principles.
Now for sure you will ask yourself what exactly means this.
Now these four principles for my system.
And this is where we come to the second chapter of the presentation.
What exactly is clean core?
So as you can see here, clean core spans across several dimensions.
Extensibility. This is what today probably most people think about when hearing about clean core.
But as you will see, this is much more than just extensibility.
Nevertheless, extensibility here shown is the first dimension where we also see later on.
Then some more detailed example when talking about clean core and extensibility.
It's really to develop in a cloud compliant way Abap cloud on stack development or side by side development on
BTP and to avoid whatever extensions are not necessary, only to have the extensions where there's really value for your
business, but also other dimensions like data.
Here, clean core is about reducing data volume.
Avoid unnecessary data in the system, but whatever data is in the system should be consistent, should be complete so
that you can use it for machine learning purposes, for example for proper predictions.
But also, of course, data needs to be in line with legal requirements, where data needs to be stored for certain
certain time, or where data needs to be deleted due to legal requirements.
When it comes to integrations, Clean Core means using standard APIs from SAP wherever possible,
not everywhere. These standard APIs are available.
Hence, for Clean core in line with clean Core recommendations, you can of course build own
APIs here.
It's recommended to build these in a modern way.
Odata Soap APIs not to go for traditional R.F.C., etcetera APIs and also
wherever applicable, use modern event driven design, for example.
And when you build your own APIs, integrate them with a sub application interface framework tool.
So a sub F in order to have for example, proper monitoring.
Also business process category is important for clean core to implement.
And this is then also mainly or first of all targeting new systems.
Greenfield set up systems to use best practice standard business processes from SAP wherever possible, integrated
with standard recommendations, process recommendations from partners, but also then on a company level, establish company
best practices and also properly document your business processes, how they are implemented and actually how they change over
time. And finally the dimension operations.
This is going across all the other dimensions.
So these are quite different quite different recommendations here.
Some more on the technical side.
Do proper housekeeping in terms of background jobs for example, or in terms of authorizations, only those
authorizations which are really required, but also for the life cycle of your system, have some plan, have some life
cycle management plan when to do an upgrade under which conditions, to have a fixed upgrade schedule on a regular basis, but also support
package updates to this on a regular basis, but also then for as for a private cloud aligned with SAP as a cloud
provider, for example, to have contractual maintenance period.
Agreed that SAP can do some sort of maintenance in a proper alignment with you as a customer.
So this was the rough overview.
What did I mention are for clean core?
As mentioned, we will soon get more in more detail into the dimension of extensibility.
What is also important to mention Clean Core is a journey.
This for most customers is not something which can happen overnight.
We need here really to differentiate between greenfield system setups on the one hand side and brownfield
system conversions.
When a customer start in greenfield with a new system, maybe with limited data, take over from a previously existing SAP, ERP
or S four Hana system, then it's more about processes governance to establish the governance right away,
to stay clean because greenfield systems typically if you do not something completely wrong during the implementations are close to clean core.
They are usually not many.
No extensions in the beginning, not much data volume, but really establish the processes and the governance in order to
stay clean, core and understand the clean core principles and apply them right away.
When setting up the system for brownfield customers, a customer has a 20 year old ERP system doing a system conversion to
S four Hana. That's a very different thing here.
This such a system cannot be clean core compliant overnight.
This is a journey.
This can take many years, especially if lots of custom code, lots of legacy custom code is involved.
And here what is important, what I explained before really to realize okay, to understand what do I have at the moment?
Where do I deviate from clean core?
This is not something which will then go away immediately, but that you can plan accordingly depending.
Okay, how much effort do I need to spend for for a certain area to get clean core?
And what is the benefit?
And then put this on a timeline actually to get clean core.
So there is no magic button for these systems.
It's something which happens over time or has to be done over time.
As mentioned here.
Now we are going a little bit more detail in one of the dimension, the first dimension of Glencore extensibility, which I have shown
here. First of all, it's important to understand what does Glencore mean in the area of extensibility as briefly already
shown before.
So there are different ways to be clean core compliant.
One thing is build things side by side on SAP, BTP, different languages, programming environments
here available above NodeJS etcetera, but also on stack you can build clean core compliant code
with the above cloud three extensibility model.
There is also besides this tier one which is by default clean core.
There's also something special here for S four Hana Private Cloud on premise so-called tier two, because from tier one you can only
consume APIs which are officially released by SAP, but not in all areas.
Such APIs are already available and tier two is a good possibility then for customers also to use other legacy
APIs which are maybe not as modern as Ruby, for example, but some old Bapi
which has been nominated recommended by SAP, which customers then can wrap and still consume that API then from tier
one. So this is an enabler.
Tier two is an enabler for development in tier one, for cloud like development in tier one, in areas where not sufficient APIs are
available yet.
And finally, what is also available here in the three tier development model is the classic Abap development as you know it from
the past SAP, ERP.
As for Hana, here you can do everything.
This is not considered clean core compliant.
But still, as mentioned before, customers doing brownfield approach system conversion will still have lots of lots of custom code in
that area, and this will also not then go away automatically.
But here then the tasks in the clean core context is really look at the old coding in tier three.
What can be retired because it's not even used anymore, but maybe where it's used.
But SAP is providing meanwhile similar functionality so that it can be retired, and for the remaining coding
to renovate and to innovate in the direction over time in the direction of tier one, in order to be then clean core compliant,
to have either on stack on other cloud compliant coding, or side by side implementation on SAP, BTP.
And what is still possible here, of course, is also to adapt this coding.
This cannot always be avoided also then touching old coding.
For example, if you have implementations in sub area where which is not available in tier one, of
course you still might have even to build some new things here, even if it's not clean core compliant APIs I
mentioned already.
Very important topic for clean core compliant development if you want to develop in tier one.
So either you need an released API from SAP or a nominated API, which you then can can wrap in tier two.
So there is a comprehensive overview in this GitHub repository, which is shown here on which APIs are available.
This also can be consumed then by Abap Test Cockpit.
We will see this a few slides later on in order to identify where are you using APIs which are not released, which violate Clean
Core 3D Extensibility Model recommendations?
Or where are you using released APIs when an API is not yet available?
Or you need an API in an area which is not yet properly covered?
There's also this customer influence channel shown here, where you can request an API from SAP, and could either get either a
released API or a nomination recommendation for some some legacy API, which is sufficiently stable and meets the
requirements. For example, in order to build then on tier one coding on top.
There is also there are many different guides here, very good and comprehensive guides how to develop in the three tier extensibility model, how to develop
in tier one, how to build wrappers in tier two, how old technologies map to new technologies.
So I highly recommend to have a look at this.
There's also here this Abap cloud community with lots of more resources on that topic.
Clean core compliant development of cloud compliant development.
And finally here the last part, that's what the final slides here of the presentation will be about how to check this actually.
And our test cockpit, which you see on the right hand side is then an important part here.
Clean Core Dashboard
So. But first of all, because before checking things in detail, the question is how to get an overview on clean core.
So what we have here is the so so-called clean core dashboard.
That's it's rather new a first version, initial version was released rather recently and a new version
is currently in preparation with more information.
This is available for all productive SAP s four Hana Cloud Private Edition systems, and customers can
access this in sub for me for corresponding systems.
And this is an idea not to have a deep, in-depth, deep dive tool for clean core topics, but rather to get a broader overview on the
individual areas.
Where do I stand with a given system in terms of clean core?
And we are planning to enhance this on a regular basis with additional KPIs, with additional dimensions and additional hints and
guidelines and tools regarding clean core.
So here again the example as we are here in the extensibility area, what does it mean then to be a clean core
compliant concerning what is shown in the Clean Core dashboard?
This is about maximizing the share of tier one coding.
So as in the three tier development model, which I've shown before how much coding is in tier one compared to the other coding also
to minimize the number of modifications.
But there are also other sub dimensions like usage.
How much of the custom code is actually used?
Because unused custom code again is something which is a candidate for retirement, and also the quantity of custom code.
How much custom code is executed in a system compared to the overall custom code.
So in order to to minimize the extensions only to these areas which are really required.
Clean Core Test Cockpit
There are further detailed checks then beyond the Clean Core dashboard.
And this is where we're coming then to the our test cockpit, which I mentioned before.
So the test cockpit provides possibilities.
First of all, to check your coding in tier one, many things in tier one for example, that you're that
you're not using unreleased APIs is automatically already ensured by the development environment by the Abap
development tools.
In addition, there then variants available in other in Abap test cockpit, which check further
whether you're violating any tier one requirements or any tier one guidelines, but the same you can do with any of your code.
So for example, you could also take existing custom code tier three custom code, which might be rather far from clear
tier one recommendations and guidelines.
But still you can check.
Okay, where do I violate with a given piece of coding the Abap Cloud Development guidelines.
And this way then you can iteratively also for single packages for single pieces of coding single applications.
If you've you've built then you can step by step then address this and reduce any violations of our cloud
development guidelines.
So this is a very valuable tool for really getting there in terms of clean core extensibility getting clean.
Also exemptions are important here.
So not everything especially when checking your classic Abap developments.
Of course many things will not be clean core compliant.
Say for example SAP Sapgui will be never supported in tier one and but in tier three, customers
typically have quite some amount of SAP usage.
This is then something which you cannot just make tier one compliant, but then you can exempt it so that these errors for the time being, then
go away and focus then on other things, other parts of the logic, other parts of the coding, getting them clean, core
compliant. And here you see some some example how you can then set for a given error which you find such an
exemption. And also exemptions.
Once you have exemptions, of course, it's an important coming back to what I mentioned before to have an overview to be aware, okay, where do I violate
things? Where do I violate clean core recommendations?
Clean core guidelines here, whenever you have an exemption, you can see this here in the exemption browser of the Abap test cockpit.
So it's not gone.
But for the time being you can focus on the important parts actually where you want to get clean core compliant but still see okay what what
did I exempt.
And finally, also besides our test cockpit, there are other tools, but also services like.
Like mentioned here, the intelligent custom code management, which goes then into even much more detail, clustering your
coding based on how old it is, how it's used, and identifying different code clusters which belong together in your legacy
coding where then you can identify, okay, where do I start first?
Where would it pay off first to to get clean core compliant?
With that. I'm at the end of my presentation and I would open the Q&A, and I see already the
first questions here.
So as mentioned I see the first questions here.
So there is a question from Rajeev.
Usage of standard IDoc Bapis isn't a part of Clean core.
No, it's not part of clean core.
So I mean there are two aspects here.
Idoc first of all, lets remote communication.
It's not a clear, clean, core compliant integration technology is that a clean core compliant is
OData and web services in terms of integration, in terms of interfaces?
Bapis it's similar.
Bapi. It's actually twofold.
As you probably know, Bapi you can call remotely, but you can also call it locally on your in your coding.
So Bapi is a good example where in areas where no released APIs exist, SAP
also then nominates for this tier two, which I've shown Bapis which are sufficiently stable and compliant, for example with
Rup implementations.
And then you can wrap such a nominated Bapi for local consumption, but also for remote consumption for
remote calls.
Sap can suggest certain APIs, which then can be used as a bridge when no sufficient remote API
is available. Then there's a question from Chaitanya.
Do we have any documentation references for clean core principles?
Yes. You saw a few examples here in for extensibility.
The guides which I have shown on one of the slides.
Okay. So I don't think you see the slides anymore.
Maybe I can just go back here.
So these for our cloud are the guidelines.
And also further here they are.
And further on there's also a central clean core page.
If you look at Sap.com for clean core there's also a central page with more information about clean core not only about
extensibility and hints what actually it means to be a clean core.
Then there's a question from Sumit.
What are the tools available to check the data cleanliness in the system?
There are existing tools which you might know from the past like DBM cockpit for example, where which help to check the
cleanliness or consistency of the data.
For example, for a given system where we don't have this in yet but currently looking to integrate.
This is for example, the Clean core dashboard.
Also to have a dimension of data in similar to what what you know, for example from the DBM dashboard or DVM cockpit.
Uh.
Then we have here.
Okay. This way. All the questions.
Any? No.
Don't think any further questions.
So thank you very much for listening to this session.
I hope it was helpful to understand the principles and basics around clean core and actually to get you started,
where to get more information and how to deep dive into the topic and how to understand better how you, for your system
and your environment actually could move in the direction of clean core.
Thank you.