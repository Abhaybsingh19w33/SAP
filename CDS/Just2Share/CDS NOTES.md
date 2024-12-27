# [Just2Share](https://www.youtube.com/@just2shareji/playlists)

<!-- index-start -->
## Index

- [Video:1 ABAP CDS Views Introduction](#video1-abap-cds-views-introduction)
- [Video 2 HANA Studio Intro, Simple CDS Views, Access in SE38 & SE11](#video-2---hana-studio-intro-simple-cds-views-access-in-se38--se11)
- [Video 3 CDS with I/P, CDS in SE38, Call CDS from another CDS, CDS to ALV](#video-3---cds-with-ip-cds-in-se38-call-cds-from-another-cds-cds-to-alv)
- [Video 4 About Versions and Explore Standard CDS Views](#-video-4---about-versions-and-explore-standard-cds-views)
- [Video 5 Session Variable & Simple Data Manipulation in CDS Views](#video-5---session-variable--simple-data-manipulation-in-cds-views)
- [Video 6 CDS Views Joins (Inner, left outer and right outer)](#video---6-cds-views-joins-inner-left-outer-and-right-outer)
- [Video 7 CDS View Association Part 1](#video-7---cds-view-association-part-1)
- [Video 8 CDS View Association Part 2](#video---8-cds-view-association-part-2)
- [Video 9 CDS View Table Function Part 1](#video-9---cds-view-table-function-part-1)
- [Video 10 CDS View Table Function Part 2](#video-10---cds-view-table-function-part-2)
- [Video 11 CDS View Table Function Part 3](#video-11---cds-view-table-function-part-3)
- [Video 12 CDS View VDM Type and Data Category](#video-12-cds-view---vdm-type-and-data-category)
- [Video 13 CDS View - AMDP Procedure Part 1](#video-13---cds-view---amdp-procedure-part-1)
- [Video 14 CDS View AMDP Procedure Part 2 (Import multiple records, select-options and ranges).](#video-14-cds-view---amdp-procedure-part-2-import-multiple-records-select-options-and-ranges)
- [Video 15 CDS View - AMDP CURD Operations](#video-15---cds-view---amdp-curd-operations)
- [Video 16 CDS View - Extend View, Casting & Performance Measure](#video-16---cds-view---extend-view-casting--performance-measure)
- [Video 17 CDS View consumption in OData Service](#video-17---cds-view-consumption-in-odata-service)
- [Video 20: CDS View Cardinality in association process](#video-20-cds-view-cardinality-in-association-process)
- [Video 21: CDS View with sorting process](#video-21-cds-view-with-sorting-process)
- [Video 25: CDS View Virtual Elements](#video-25-cds-view---virtual-elements)
- [Video 26: CDS View Invalid Key Predicate Issue](#video-26-cds-view---invalid-key-predicate-issue)
- [Video 27: CDS View Date Functionalities](#video-27-cds-view---date-functionalities)
- [Video 28: CDS Views AMDP Exceptions](#video-28-cds-views---amdp-exceptions)
- [Video 29: CDS Views AMDP with Sub Query](#video-29-cds-views---amdp-with-sub-query)
- [Video 30: CDS View How to call a method from AMDP procedure?](#video-30-cds-view---how-to-call-a-method-from-amdp-procedure)
- [Video 31: CDS View Migration to View Entities Part 1](#video-31-cds-view---migration-to-view-entities-part-1)
- [Video 32: CDS View Unit and Currency Conversion](#video-32-cds-view---unit-and-currency-conversion)
- [Video 33: CDS View SQL Aggregation functions](#video-33-cds-view---sql-aggregation-functions)
- [Video 34: CDS View AMDP Procedure - Exit handler](#video-34-cds-view---amdp-procedure---exit-handler)
- [Video 35: CDS View Ranking Functions](#video-35-cds-view---ranking-functions)
- [Video 35: CDS View $parameters options](#video-35-cds-view---parameters-options)
<!-- index-end -->

## Video:1 ABAP CDS Views Introduction
![alt text](images/image-5.png)
![alt text](images/image-6.png)

## Video 2 - HANA Studio Intro, Simple CDS Views, Access in SE38 & SE11

![alt text](images/image-7.png)

@AbapCatalog.sqlViewName: ''

## Video 3 - CDS with I/P, CDS in SE38, Call CDS from another CDS, CDS to ALV

![alt text](images/image-8.png)

Input parameters created in cds views are mandatory.

##  Video 4 - About Versions and Explore Standard CDS Views

![alt text](images/image-9.png)

## Video 5 - Session Variable & Simple Data Manipulation in CDS Views

![alt text](images/image-10.png)

    $session.client

![alt text](images/image-11.png)
![alt text](images/image-12.png)

## Video - 6 CDS Views Joins (Inner, left outer and right outer)

![alt text](images/image-13.png)

## Video 7 - CDS View Association Part 1

![alt text](images/image-14.png)

![alt text](images/image-15.png)
Unnecesarily all the data is pulled, also if someone is not authorized then also it will pull the data

![alt text](images/image-16.png)
Always make associations public to use them

You should not make any associations with the field which is available in the association part not with the source. Here the source is sheader other all four are association.You always make the connection between your source and association with your basic sheader only

All the fields used in the mapping of association, that should be avl in the projection list

![alt text](images/image-17.png)

## Video - 8 CDS View Association Part 2

![alt text](images/image-18.png)

![alt text](images/image-19.png)
inner join - changed assocition left outer join to inner join, do that the empty field will not come

![alt text](images/image-20.png)
we can use path expressions like this also

![alt text](images/image-21.png)
![alt text](images/image-22.png)

![alt text](images/image-23.png)
![alt text](images/image-24.png)
![alt text](images/image-25.png)

![alt text](images/image-26.png)
![alt text](images/image-27.png)
here due to 1..* cardnality we are geting duplicate records

## Video 9 - CDS View Table Function Part 1

![alt text](images/image-28.png)
![alt text](images/image-29.png)
![alt text](images/image-30.png)
![alt text](images/image-31.png)
![alt text](images/image-32.png)

## Video 10 - CDS View Table Function Part 2

![alt text](images/image-33.png)
![alt text](images/image-34.png)
![alt text](images/image-35.png)
![alt text](images/image-36.png)

## Video 11 - CDS View Table Function Part 3

![alt text](images/image-37.png)
![alt text](images/image-38.png)

Class methods declared for table funtion cannot be tested in SE24

We can simply use the cds for testing

## Video 12 CDS View - VDM Type and Data Category

![alt text](images/image-39.png)

    @VDM.Viewtype : #BASIC
    @Analytics.dataCategory : #DIMENSION
    @Analytics.dataCategory : #FACT
    @VDM.Viewtype : #COMPOSITE
    @Analytics.dataCategory : #CUBE
    @VDM.Viewtype : #CONSUMPTION
    @OData.publish : true
    
![alt text](images/image-41.png)
![alt text](images/image-42.png)
![alt text](images/image-43.png)
![alt text](images/image-40.png)
![alt text](images/image-44.png)

## Video 13 - CDS View - AMDP Procedure Part 1

![alt text](images/image-45.png)
![alt text](images/image-46.png)
![alt text](images/image-47.png)

## Video 14 CDS View - AMDP Procedure Part 2 (Import multiple records, select-options and ranges).

![alt text](images/image-48.png)
Class and method used in table function cannot be called in any abap object.

For procedure we can use it in abap objects

![alt text](images/image-49.png)
![alt text](images/image-50.png)
![alt text](images/image-52.png)
![alt text](images/image-51.png)
We can pass select option and range same way

## Video 15 - CDS View - AMDP CURD Operations

table function is an read-only function

Procedures supports CRUD operations

![alt text](images/image-53.png)
![alt text](images/image-54.png)

## Video 16 - CDS View - Extend View, Casting & Performance Measure

![alt text](images/image-55.png)
![alt text](images/image-56.png)
![alt text](images/image-57.png)

![alt text](images/image-58.png)
![alt text](images/image-59.png)

![alt text](images/image-60.png)
performance - ST05

![alt text](images/image-61.png)
Select sql trace in options and activate the trace 

then execute the cds once -> come back to st05 and deactivate the trace -> click on display trace

![alt text](images/image-62.png)
![alt text](images/image-63.png)

![alt text](images/image-64.png)
click in execution plan to see it
![alt text](images/image-65.png)

to open this in eclipse/hana studio

![alt text](images/image-66.png)
click on execution trace 

![alt text](images/image-67.png)
save the trace with plv extension

opren hana studio -> file menu -> open file
![alt text](images/image-68.png)

![alt text](images/image-69.png)

click on second tab(executed plan)
![alt text](images/image-70.png)

## Video 17 - CDS View consumption in OData Service

![alt text](images/image-71.png)
![alt text](images/image-72.png)

## Video 20: CDS View Cardinality in association process

![alt text](images/image-73.png)

## Video 21: CDS View with sorting process

![alt text](images/image-74.png)

Video 22 to 24 is not present
## Video 25: CDS View - Virtual Elements
![alt text](images/image-75.png)

We can use the abap object in cds view

![alt text](images/image-2.png)
![alt text](images/image-1.png)
![alt text](images/image-3.png)
![alt text](images/image-4.png)

![alt text](images/image-76.png)

![alt text](images/image-77.png)
![alt text](images/image-78.png)
Implement both the methods, even if you are not using it.

![alt text](images/image-79.png)
![alt text](images/image-80.png)

![alt text](images/image-81.png)
We have add a service for virtual elements to be used
![alt text](images/image-82.png)

![alt text](images/image-83.png)
We can test it using the odata services

## Video 26: CDS View - Invalid Key Predicate Issue

In case we are using cds views with parameter fields treat it as keys field also, because in cds views paramter fields are mandatory to pass.

Keep this in mind while creating odata services and while passing data via url.

## Video 27: CDS View - Date Functionalities

![alt text](images/image-84.png)
![alt text](images/image-85.png)
![alt text](images/image-86.png)

## Video 28: CDS Views - AMDP Exceptions

![alt text](images/image-87.png)
![alt text](images/image-89.png)
![alt text](images/image-88.png)
![alt text](images/image-90.png)
![alt text](images/image-91.png)
![alt text](images/image-92.png)

## Video 29: CDS Views - AMDP with Sub Query

![alt text](images/image-93.png)
![alt text](images/image-94.png)
![alt text](images/image-95.png)
![alt text](images/image-96.png)

## Video 30: CDS View - How to call a method from AMDP procedure?

![alt text](images/image-97.png)
![alt text](images/image-98.png)
![alt text](images/image-99.png)
![alt text](images/image-100.png)
![alt text](images/image-101.png)

## Video 31: CDS View - Migration to View Entities Part 1

![alt text](images/image-102.png)
![alt text](images/image-103.png)
CDS view also creates DDIC object 
![alt text](images/image-104.png) 
![alt text](images/image-105.png)
![alt text](images/image-107.png)
![alt text](images/image-108.png)
![alt text](images/image-106.png)
![alt text](images/image-109.png)
![alt text](images/image-110.png)
These program are for migration from cds to cds entity, downgrading is not possible with help of this program.

![alt text](images/image-111.png)
![alt text](images/image-112.png)

## Video 32: CDS View - Unit and Currency Conversion
![alt text](images/image-113.png)
![alt text](images/image-114.png)
![alt text](images/image-115.png)
![alt text](images/image-116.png)
![alt text](images/image-117.png)

## Video 33: CDS View - SQL Aggregation functions
![alt text](images/image-118.png)
![alt text](images/image-119.png)
![alt text](images/image-120.png)
![alt text](images/image-121.png)
![alt text](images/image-122.png)
![alt text](images/image-123.png)
![alt text](images/image-124.png)
![alt text](images/image-125.png)

## Video 34: CDS View - AMDP Procedure - Exit handler

![alt text](images/image-126.png)
![alt text](images/image-127.png)
![alt text](images/image-128.png)
![alt text](images/image-132.png)
![alt text](images/image-131.png)
this will continue the next steps

![alt text](images/image-129.png)
we can declare custom exception and raise it with signal statement

![alt text](images/image-133.png)
custom error code error code range [10000 - 19999]

![alt text](images/image-130.png)

re signal

![alt text](images/image-134.png)
![alt text](images/image-135.png)
![alt text](images/image-136.png)
![alt text](images/image-137.png)
in entire procedure we can have only 1 exit handler

![alt text](images/image-138.png)
![alt text](images/image-139.png)

![alt text](images/image-140.png)
![alt text](images/image-141.png)
![alt text](images/image-142.png)

![alt text](images/image-143.png)
![alt text](images/image-144.png)

![alt text](images/image-145.png)
![alt text](images/image-146.png)
![alt text](images/image-147.png)

Resignal needs to be in begin and end block
![alt text](images/image-148.png)
![alt text](images/image-149.png)

![alt text](images/image-150.png)
![alt text](images/image-151.png)

![alt text](images/image-152.png)
![alt text](images/image-153.png)

## Video 35: CDS View - Ranking Functions
![alt text](images/image-154.png)
![alt text](images/image-155.png)
Here when the result set is in groups then the ranking function will work like recursive and generate rank for each group
```
1 A
2 A
3 A
4 B
5 B
6 B
7 C
8 C
9 C

After grouping

1 A
2 A
3 A

1 B
2 B
3 B

1 C
2 C
3 C
```

![alt text](images/image-156.png)
![alt text](images/image-157.png)
![alt text](images/image-158.png)
![alt text](images/image-159.png)

![alt text](images/image-160.png)
After the ranking we are further partioning it

![alt text](images/image-161.png)
![alt text](images/image-162.png)
![alt text](images/image-163.png)

![alt text](images/image-164.png)

![alt text](images/image-165.png)

![alt text](images/image-166.png)
![alt text](images/image-167.png)
![alt text](images/image-168.png)

![alt text](images/image-169.png)
![alt text](images/image-170.png)
Here after partition it has created different result sets so ranking has been done on individual sets

![alt text](images/image-171.png)
![alt text](images/image-172.png)

![alt text](images/image-173.png)

![alt text](images/image-174.png)

![alt text](images/image-175.png)

![alt text](images/image-176.png)
![alt text](images/image-177.png)

![alt text](images/image-178.png)
![alt text](images/image-179.png)

![alt text](images/image-180.png)
![alt text](images/image-181.png)

![alt text](images/image-182.png)
![alt text](images/image-183.png)
here if duplicate is found, it skip the ranks

![alt text](images/image-184.png)

![alt text](images/image-185.png)

![alt text](images/image-186.png)
![alt text](images/image-187.png)
![alt text](images/image-188.png)

## Video 35: CDS View - $parameters options

![alt text](images/image-189.png)
![alt text](images/image-190.png)
![alt text](images/image-191.png)
![alt text](images/image-192.png)

![alt text](images/image-193.png)
![alt text](images/image-194.png)
![alt text](images/image-196.png)
![alt text](images/image-195.png)

![alt text](images/image-197.png)
![alt text](images/image-198.png)

![alt text](images/image-199.png)