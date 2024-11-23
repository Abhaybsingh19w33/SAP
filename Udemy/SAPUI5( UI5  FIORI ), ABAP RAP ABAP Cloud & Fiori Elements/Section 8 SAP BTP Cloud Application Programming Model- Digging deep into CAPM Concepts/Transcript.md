# 108. SAP BTP CAPM Introduction

So far we have learned ue5 application development.

That is nothing but the front end application development.

And later on we have learned Fiori elements application development with the help of RESTful Abap programming

model.

So RESTful API programming model is the development approach to develop OData services based on Abap

and based on the Wrap, we were able to develop Fiori elements applications.

So in that way we have become a full stack developer using Uf5 and Abap.

So that is a different stack.

Now we are going to focus on becoming a full stack developer using Non-sap programming languages.

Using Node.js, we are going to become a full stack developer means based on Node.js.

OData services.

We will be able to build Fiori applications.

So welcome to the training of SAP Cloud Application programming model development by Sathya Siva Prasad

counterparty.

So what is this Capm used for?

So in short cloud application programming model is called Capm.

This Capm is a development approach for developing applications in SAP cloud.

When we are developing the applications in SAP cloud, those applications are called cloud applications.

So applications which are developed in the cloud and deployed in the cloud, these applications are

native to the cloud.

So why a programming model is needed.

Programming model is not a programming language.

So there are programming languages to develop applications.

For example, in SAP Uf5, JavaScript is a programming language to develop SAP web applications.

Uf5 SDK provides the tools and languages and libraries for the development of UF applications.

Means it supports the programming language JavaScript, and it provides the library for the easy development

of applications.

So in the library we can see the best practices which are needed for the development of the applications.

If we come to Uf5 dot Sap.com that is nothing but Uf5 SDK, we can see the API reference means the predefined

classes and the functions which we as a developer can use to build SAP Uf5 applications in a similar

way.

Capm also provides Libraries, which a developer can use to develop CP m applications in a similar way.

CP m supports two languages, that is, JavaScript and Java means JavaScript means it supports.

Node.js and Java programming languages.

So Node.js is based on JavaScript, so JavaScript or TypeScript.

Can be used to build Node.js applications.

And Java and Spring framework are used to build.

Java based CP m applications.

So which tools the cloud application programming model supports?

Is business application studio.

We have seen how the Business Application Studio works in Ue5.

Development classes.

And it also supports command line interface.

So there are two tools which.

CP m supports to build cpam applications.

One is bash and the other one is VS code.

If we develop applications using bash, then we can deploy them directly from the bash to the Cloud

Foundry or Kyma or Kubernetes environments.

So don't worry about what are those environments for now.

So we develop the applications and then we deploy them to somewhere from where the SAP can execute those

applications, so that somewhere is nothing but Cloud Foundry.

Now when we develop the applications on VS code, as we know, VS code is the editor which we need to

install in our system.

So once we develop the applications in VS code, then we have to use command line interface to deploy

the applications to the cloud.

If we develop the applications using bash, then we don't need CLI.

But if we develop the applications using VS code, then we need command line interface and also while

developing the applications through VSCode, we need to install the CDs tool as well in our system.

So what is CDs?

Core Data Services is used for defining the data models and service definitions.

So what are data models?

In simple words we can say data modeling is nothing but definition of entities and their relationships.

Earlier we have seen this product set entity set from ES5 demo system.

And here we can see the entity types and entities.

So this modeling is nothing but data modeling in Capm.

So in a similar way we will be able to define the entities and their relationships, navigation properties,

associations, etc..

So whatever we have seen in UEFA development, the same is also valid here.

But in Capm, we define these services using Node.js instead of the Abap.

So here service definition means simply OData service RESTful application programming interfaces.

So from any web application we will be able to perform Crud operations.

So these Crud operations can be performed only based on the services.

So these services can be developed using cloud application programming model using two flavors of Node.js

and Java.

Just like how we have seen uf5.sap.com documentation, that is nothing but Uf5 SDK.

So SDK stands for Software Development Kit.

So inside SDK we can find the libraries based on which we will be able to develop the applications.

So API reference is nothing but the library of classes and functions in a similar way.

Node.js Capm has an SDK Decay and Java has an SDK.

So these are two different libraries.

And also it supports.

Kabam supports Fiori Elements library as well.

Based on the services, OData services are RESTful APIs which are developed using cloud application

programming model.

Based on those services, we will be developing Fiori elements applications.

So Capm supports this theory elements library based on which we will be able to develop the Fiori elements

applications.

So in order to see the documentation of SDK, just type in these websites in your browser and you will

be able to navigate to the corresponding SDKs.

Here we can see the SDK for NodeJS and this is the SDK for Java, just like in Uf5 Sap.com how we have

all the guidelines to develop applications in a similar way We have the guidelines or code snippets,

etc. to develop Capm applications based on Node and Java.

As we have seen, programming model is one level higher to the programming language.

So programming model has languages included in it and it provides tools libraries.

So as we have seen Java Library and Node JS library both are available in this programming model.

And it also has a templates etc. for easy development of applications using software development kits,

we can develop applications using Node.js stack with express framework.

So this framework is a web development framework based on which we can implement Crud operations.

We can also develop Java based applications using Spring Boot framework.

So this is spring framework is a web development framework based on the Java ecosystem.

So what is this web development framework?

Web development framework is nothing but based on which we can perform Crud operations.

So in order to web app using NetWeaver Gateway, we will be able to perform Crud operations in a similar

way with Java.

Spring boot framework is the framework based on which we can perform Crud operations.

So how NetWeaver Gateway is for web app.

In a similar way, Spring Boot Framework is for Java and Express framework is for Node.js.

So the main advantage of cloud application programming model is that we can use any kind of database.

So SAP in its cloud environment it provides support for PostgreSQL, Redis and SAP Hana Cloud.

So these are all the these three are the databases it supports inbuilt in its SAP cloud in SAP, BTP,

but NodeJS and spring supports n number of databases like MongoDB, SQLite etc. so it supports n number

of databases, whichever we can name.

So if we go to S four Hana RESTful Abap programming model wrap, it supports only Hana.

It does not support any other database, but when it comes to Capm, the main advantage is that it supports

any backend which is supported by either spring framework or by Node.js.

So whichever database these two programming languages support, all those databases can be used for

consumption using cloud application programming model.

So we can use any kind of database which these two languages supports.

Both wrap and cap applications can be deployed to SAP cloud.

So SAP cloud consists of three environments.

One is Cloud Foundry, Kyma and Kubernetes, out of which Cloud Foundry is the most popular one.

And in this course we are going to use Cloud Foundry environment.

We have seen the entity types just now in ES5, so that is nothing but domain modeling or data modeling.

So with CDs we will be able to do the data modeling or domain modeling means we will be able to define

the entities and their relationships.

This Capm supports not only the open source programming languages like Node.js and Java, as well as

Spring Framework and Express framework.

So apart from open source technologies, it also supports the SAP technologies like CDs, Fiori and

Hana.

So with the SDK of Capm, we will be able to deploy our applications to SAP, BTP or all the SAP, BTP

services, whichever are relevant.

All those services of SAP, BTP like authorization and authentication etc. can be used in Capm application

using these SDKs.

One more very much biggest advantage of cloud application programming development is that these services

can be integrated with any front end.

So the OData services which are developed using Capm.

So these OData services can not only be used by Fiori application, but can be used by any other front

end like React or Vue or Angular etc..

So that is the main biggest advantage of Capm services.

So it also supports Fiori elements library.

So with the Fiori Elements library we can again use annotations to develop Fiori applications.

# 109. Project Creation & Artefacts,Yeoman

There are three ways to create a Capm project.

First option is to use yeoman generator and the command to be used in the business application studio.

Is this.

Yo.

So what is a yeoman generator?

Yeoman generator is nothing but an NPM module, which SAP has used to generate or to create its own

yeoman generator to create the Capm applications.

So here you have to search yeoman generator.

And when we open this module we can see that if you are interested in writing your own yeoman generator,

we recommend reading the official Getting Started guide means we can create our own Yeoman generator,

and in this way, SAP has created its own Yeoman generator.

Based on this, SAP has given us an option to create Capm application.

And the other option is to use the template.

And the third option is to use CDs init command in terminal.

So in this course we are going to use Business Application Studio for the moment.

Maybe at a later point of time.

VS code will also be used in order to use Business Application Studio to create a Capm projects, we

have to have this dev space created.

So just create this dev space if it is not available and open the dev space.

And now open the projects folder.

If it is not already opened, just follow this path to open the projects folder and click on okay.

And once you click on okay, this projects folder will be opened.

Since I have already worked with many applications, my project workspace is already having a number

of projects here for you.

It will be empty if it is a new dev space created Once done, click on this option to open a new terminal.

and now enter the command.

Yo, I want to create a SAP cap project, so if it is not available here, just go through the list

of options by selecting the upward or downward options on your keyboard.

For me, SAP Cap project is readily available.

I just press the enter button on my keyboard, give the project name as something like test three.

Select the environment of Node.js.

Here we can see.

Use the arrow keys up arrow key or down arrow key to navigate between the options and now press enter

button.

Again I don't want to select any database, so I will be using in-memory database.

I mean a temporary database available for bash I will be using.

So there will not be any database I will be using at the moment.

I will tell about it at a later point of time, but for now don't select any option.

So for selecting an option you have to press the space button here.

So I'm not selecting anything for you to show what happens if I press space button is this one.

So I have selected a SAP Hana cloud.

Now again I am Deselecting SAP Hana Cloud by pressing the space button.

So I have deselected and now I press enter button.

I don't want to select anything to deploy the project, just press enter button again.

Here also, I don't want to select anything, just press enter and enter to create the project.

Now the project is created.

Any folder which starts with a dot is a private folder.

To that project means in general we will not be doing any modifications to these folders.

We have package dot JSON which will have all the dependencies of the project.

We will have development dependencies and the runtime dependencies.

Development dependencies This means in order for us to develop the application, we need some npm js

libraries in our project.

So those are nothing but dev dependencies, for example SQLite.

So SQLite is the database which is temporarily available for us to store the data means from the project.

Data will not be stored to a database means it's not persisted.

Once we restart the application, this data will be lost.

So that is nothing but the temporary database in-memory database is available, so that is needed for

the development of the application, for testing the contents, etc. this is a development dependency

and we have SAP CDs module from npm js which is needed to develop the application means uh, just like

Ue5 SDK, sap ui core dot JS is there, right?

So that is the core framework class of Ue5 SDK.

I am talking about this particular the JavaScript file, which has a number of classes or functions.

So this is the core file JavaScript file, which is needed by UEFA or Sap.com means needed by UEFA SDK

to call the controls or create the controls to implement the router, etc..

So in a similar way, we need SAP CDs to implement SAP cloud application programming model projects.

So this is CDs for Node.js.

So the CDs engine is needed.

CDs module is needed by the project.

So that is one more dependency.

In a similar way we need express module as well.

So as we are using node stack not Java stack node stack.

This Node.js uses express framework to implement Capm applications.

So that is also one more dependency to implement the Capm application and the dev dependency.

As I said for the development of the application, these are needed, but for the actual functioning

of the application.

These are the dependencies which are needed in git.

Ignore consists of the files or folders which needs to be ignored when deploying the application to

the git repository, so it will have the file folders which needs to be ignored when deploying the application.

For example, node modules should not be deployed to the git repository if at all it is deployed, it

will be consuming a lot of space.

I think you remember the purpose of node modules.

If not, kindly go to my earlier explanation of node dot js.

There you can find what is the importance of node modules.

So this node modules folder will get created as and when we install any npm js library manually.

For example, if we install some module from npm js, then node modules folder will get created here

and this node modules folder will contain all the modules content from the internet means from npm js.com.

The module is downloaded into the project inside node underscore modules folder.

Importance of these three folders is app folder will be used for display purposes and DB folder for

database specific contents of the application.

SRB for defining the services means for defining the OData service.

A service folder is used for defining the entities.

This DB folder will be used, for example, to include the UEFA application.

This app folder will be used.

The second option to create the project is.

Select this new project from template.

Select this option Cap project and click on start.

Just enter any name.

Select the stack here.

These options are optional.

You don't have to select anything here and just click on finish.

As soon as you click on finish.

Once the project creation is completed, that project will be opened here.

So here we are able to see the same folder structure which we have seen earlier.

I don't want to be in this particular folder or project.

So I want to go back to uh the projects folder.

Just click on okay.

So here I am back into the projects folder.

So another option to create a project is CDs init Test5 means the project name have to be given here.

This is the project name.

Now the project is created within one second or two seconds of time very quickly.

So again this is the same project structure.

So these are the three ways of creating the project in business Application studio.

# 110. CDS HELP , CDS ENV Folders, Capire Documentation 

So this was the project which was created in our last class.

If we try to open it in the integrated terminal, just click on the open integrated terminal.

We will be able to open this testify project.

So what is this integrated terminal?

Using this integrated terminal we will be able to perform n number of actions on this project.

So this is also called as a command line interface for the business application studio.

Based on this library npm js library we have obtained the command line interface in our business application

studio.

If at all this module is installed in VS code.

So in VS code as well, we will be able to use command line interface for performing a number of actions

on the project.

If we have to see what are all the capabilities of command line interface, just click on the documentation.

Augmentation.

So here just expand these tools and then click on command Line interface.

So here we are able to see that based on this library we can perform the CDs CLI commands in our Capm

project.

For example, in our earlier session we have performed the CDs init command to perform the creation

of a Capm project.

So what is the purpose of a CDs?

Init is explained here to create new projects.

Likewise, we will be able to perform n number of operations on a project.

So how do we know what are all the operations which can be performed on a project is.

And just click on here CDs command line interface and select the CDs help.

So these are all the operations or this is all the help which we can get regarding the documentation

of for CDs.

For example, CDs in it will create CDs based projects means it creates a project, if at all.

If we want to add a feature to an existing project, we will have to use CDs add command.

So for example CDs add.

What are all the options available for that.

We will have to perform CDs add and then help is the command which we need to give in the command line

interface to get a help on add command.

So let us say that we have come to our project and then we will just do CDs help initially.

Here just expand this and we are able to see these are all the options available in CDs CDs environment.

We will be able to use, build, deploy etc. everything we will be using in the later sessions.

But you need to understand that these are all the possibilities of CDs.

So if I want to see what are all the possibilities with CDs and we have to type in CDs, help and then

add, say here CDs help and then the command CDs help.

And then the command is add here.

So if we do that we got again the help of the list of possible options with respect to add.

So CDs add.

For example, if we want to add Postgre SQL database then we will have to perform this command.

If we have to perform CDs add SQLite then this is the option means that this CDs add SQLite have to

be given.

If we have to add redis database CDs add redis have to be given.

So these are all the options.

Now for example there is a scenario where app db and SRV are the standard folders for View, model and

service definitions.

So I want to change this behavior first.

I want to see what is the standard configuration in the system.

In order to see the standard configuration in the system, I will have to type in CDs env folders.

So how do I know I will have to type.

This is.

First we will have to go and see what are all the options here.

See CDs env is possible.

And again for env what are all the possible commands we can enter is we will have to execute this command.

So CDs help env.

If I do that next possible commands are appearing here.

So I will have to perform this action means I will have to enter this command to get the list of other

options.

So CDs env.

keys.

See here CDs, E and V folders is one more option available so I can perform all these actions.

But I want to see what are all the standard uh configuration available for the folders.

So CDs, E and V folders.

If I enter this I can see here for database db is the folder.

This db is the folder for a survey.

This is the folder for application app is the folder.

I can modify the standard behavior as well.

So before modification I want to implement a sample service.

One of the most important aspect of Capm is it provides RESTful API services.

We can create OData RESTful API services using cloud application programming model.

We will see that in next class.