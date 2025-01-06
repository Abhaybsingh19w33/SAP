For many entry fields, but not all, SAP provides a search function called a Matchcode. Matchcodes allow you to select a value from a list or search for a value by categories of data if there are many possibilities.

Types of Matchcodes

Matchcodes fall into three basic categories:

1) Short list or hit list

The values are listed on one screen. For longer lists, you may need to scroll down to see all the values.

2) Restrict Value Range

Many entries are available for the field. A number of tabbed screens with different categories display so that you can enter your search criteria.

3) Calendar search

A calendar-type dialog box is displayed so that you can select day, month, and year. This is used in date fields such as invoice posting date.

Matchcodes were replaced with Search Helps starting with Release 4.0. Please use search helps to assign an input help to a field.

Existing matchcodes were automatically converted to search helps. A matchcode object is hereby converted to a collective search help with the same name. Each matchcode ID of the matchcode object is converted into an elementary search help with the same name and assigned to the collective search help created from the matchcode object.

A matchcode is a means of finding data records stored in the system. The matchcode is defined in the ABAP Dictionary in two steps:

You first define the relevant tables and fields for the search in a matchcode object. A matchcode object describes the set of all possible search paths for a search string.

You then create one or more matchcode IDs for a matchcode object. A matchcode ID describes a special search path for a search string. The matchcode ID defines the fields or field combinations to be used in the search.

Creating Matchcode objects

A search help can be created in ABAP Dictionary ( tcode se11 )

Create a new search help (say myHelp) , choose Elementary search help (simple one), select Definitions tab, enter the table name(say myTable) in "Text Table" text box.

Then enter the column to be used (say myField) for this help in search help parameter, choose Import/Export, give Lpos as 1, and activate. ( You can add more columns from the same table here).

In report, code as

parameter p1 like myTable-myField matchcode object myHelp.

when you execute this report, p1 will have a f4 help enabled. The help list will have all values from myTable for field myField.

Please check the following links on how to create Search Helps

You can do this in SE11 where you have an option for the same

-----------------------------------------------------------------------------------------

this is also for the search help. search help and the mach code object are similar..for providing the help we will generally use this..

Syntax

... 
[DEFAULT val1 [TO val2] [OPTION opt] [SIGN sign]]

[LOWER CASE]

[MATCHCODE OBJECT search_help]

[MEMORY ID pid] 
...

this will be used in the parameters or in the select options

-----------------------------------------------------------------------------------------

Matchcodes are defined in two stages in Abap/4 Dictionary:

1) The revelant table and fields are stipulated in matchcode object. A matchcode object describes the set of all possible search paths for a search item.

2) One or more matchcode ID can be defined for a matchcode object. A matchcode ID describes a special search path for a search term.The fields or combination of fields via which the search is to take place is defined in the matchcode ID.