# [Just2Share](https://www.youtube.com/watch?v=KrEVuuuiXfI&list=PLmajIBPiks11NU41T8G149D5hf-o1oBqs&ab_channel=Just2Share)

<!-- index-start -->
## Index

- [Video 1: OData Service Introduction
](#video-1-odata-service---introduction)
- [Video 2: OData Service Model, Entity and MPC & DPC Class
](#video-2-odata-service---model-entity-and-mpc--dpc-class)
- [Video 3: OData Service Filter and Multiple Entity Sets
](#video-3-odata-service---filter-and-multiple-entity-sets)
- [Video 4: OData Service Association & Navigation
](#video-4-odata-service---association--navigation)
- [Video 5: OData Service CURD Operations & HTTP method
](#video-5-odata-service---curd-operations--http-method)
- [Video 6: OData Service Deep Entity Set Part 1
](#video-6-odata-service---deep-entity-set-part-1)
- [Video 7 OData Service - Deep Entity Set Part 2
](#video-7---odata-service---deep-entity-set-part-2)
- [Video 8: OData Service Deep Entity Set Part 3
](#video-8-odata-service---deep-entity-set-part-3)
- [Video 9 OData Service - Function Import
](#video-9---odata-service---function-import)
- [Video 11 OData Service - Consumed in Excel - not completed
](#video-11---odata-service---consumed-in-excel---not-completed)
- [Video 12 OData Service - Gateway Server Config. to get OData Service from different source system.
](#video-12---odata-service---gateway-server-config-to-get-odata-service-from-different-source-system)
- [Video 13: OData ETag Functionality Part 1
](#video-13-odata---etag-functionality-part-1)
- [Video 14: OData Multilevel Deep Entity Set (GET) Method
](#video-14-odata---multilevel-deep-entity-set-get-method)
- [Video 15: OData Dynamic Where Condition, Sort and Filter Process
](#video-15-odata---dynamic-where-condition-sort-and-filter-process)
- [Video 16: OData Service Batch Process (GET) Part 1
](#video-16-odata-service---batch-process-get-part-1)
- [Video 17: OData Service Batch Process Part2
](#video-17-odata-service---batch-process-part2)
- [Video 18: OData Service Media Handling
](#video-18-odata-service---media-handling)
- [Video 19: OData Service Exception handling
](#video-19-odata-service---exception-handling)
- [Video 20: OData Service UI File to DMS Server
](#video-20-odata-service---ui-file-to-dms-server)
<!-- index-end -->

## Video 1: OData Service - Introduction

![alt text](image.png)
![alt text](image-1.png)

Model - structure of the attributes to be sent or received

Runtime Artifacts - place to add custom code

![alt text](image-2.png)
![alt text](image-3.png)

## Video 2: OData Service - Model, Entity and MPC & DPC Class

![alt text](image-4.png)
![alt text](image-5.png)
![alt text](image-6.png)
![alt text](image-7.png)
entity sets methods are need to be redefined

## Video 3: OData Service - Filter and Multiple Entity Sets

![alt text](image-8.png)
![alt text](image-9.png)

## Video 4: OData Service - Association & Navigation

![alt text](image-10.png)
![alt text](image-11.png)
![alt text](image-12.png)
![alt text](image-13.png)

## Video 5: OData Service - CURD Operations & HTTP method

![alt text](image-14.png)
![alt text](image-15.png)
![alt text](image-16.png)
![alt text](image-17.png)
![alt text](image-18.png)

## Video 6: OData Service - Deep Entity Set Part 1

![alt text](image-19.png)
![alt text](image-21.png)
![alt text](image-20.png)
![alt text](image-22.png)
for deep entity set we have to modify dpc_ext
![alt text](image-23.png)

![alt text](image-24.png)
![alt text](image-25.png)
![alt text](image-26.png)
![alt text](image-27.png)
![alt text](image-28.png)
![alt text](image-29.png)
![alt text](image-30.png)
![alt text](image-31.png)
![alt text](image-32.png)

![alt text](image-33.png)
![alt text](image-34.png)
here the name is important so that it could match the paths it should be same as name provided to navigation property set

![alt text](image-35.png)

redefine basic methods in dpc_ext

![alt text](image-36.png)
redefine the get_expanded_entity_set

![alt text](image-37.png)
![alt text](image-38.png)
![alt text](image-39.png)

![alt text](image-40.png)
metadata

![alt text](image-42.png)
expand

get_expand will be called 2 time
![alt text](image-43.png)

here 3 times
![alt text](image-44.png)


## Video 7 - OData Service - Deep Entity Set Part 2

![alt text](image-41.png)
![alt text](image-45.png)
![alt text](image-46.png)
![alt text](image-47.png)
additional step

in url we pass entity name, based on that we have to register it here, then bind the structure

![alt text](image-49.png)
![alt text](image-48.png)
![alt text](image-50.png)

![alt text](image-51.png)

## Video 8: OData Service - Deep Entity Set Part 3

![alt text](image-52.png)
![alt text](image-53.png)
![alt text](image-54.png)
![alt text](image-55.png)
![alt text](image-56.png)
![alt text](image-57.png)
![alt text](image-58.png)
![alt text](image-59.png)
![alt text](image-60.png)
![alt text](image-61.png)
![alt text](image-62.png)

![alt text](image-63.png)
![alt text](image-64.png)
![alt text](image-65.png)

![alt text](image-66.png)
![alt text](image-67.png)
![alt text](image-68.png)

## Video 9 - OData Service - Function Import

![alt text](image-69.png)
![alt text](image-70.png)
For UI action like Search/Value Help we have to create multiple methods to handle these actions.

Better we should use these methods provided
![alt text](image-80.png)
![alt text](image-81.png)
![alt text](image-82.png)
![alt text](image-71.png)
![alt text](image-72.png)
![alt text](image-73.png)
![alt text](image-74.png)
![alt text](image-75.png)
![alt text](image-76.png)
![alt text](image-77.png)
![alt text](image-78.png)
![alt text](image-79.png)
mapping is mandatory

![alt text](image-83.png)
redefine the method

![alt text](image-84.png)
![alt text](image-85.png)
![alt text](image-86.png)
![alt text](image-87.png)

## Video 11 - OData Service - Consumed in Excel - not completed

![alt text](image-88.png)

## Video 12 - OData Service - Gateway Server Config. to get OData Service from different source system.

![alt text](image-89.png)
![alt text](image-90.png)
![alt text](image-91.png)
![alt text](image-92.png)

SPRO Config
![alt text](image-93.png)
also can be done from SM30

Green colour here is gateways Server

creating RFC using SM59

![alt text](image-94.png)
![alt text](image-95.png)
![alt text](image-96.png)
![alt text](image-97.png)
![alt text](image-98.png)

![alt text](image-99.png)
![alt text](image-100.png)


Example
![alt text](image-101.png)
![alt text](image-102.png)

added new alias
![alt text](image-103.png)

to delete the Service
- remove the alias
- deactivate the icf node and delete it
- then delete the srv in maint_service tcode

## Video 13: OData - ETag Functionality Part 1

![alt text](image-104.png)
![alt text](image-105.png)
![alt text](image-106.png)
![alt text](image-107.png)
![alt text](image-108.png)

![alt text](image-109.png)
If-match in header

if etag field is added, pass the value it is mandatory

if etag is found, then make changes

If-None-Match - then it will skip if etag not found and make changes

![alt text](image-110.png)

![alt text](image-111.png)
![alt text](image-112.png)
![alt text](image-113.png)
![alt text](image-114.png)
register from here 

![alt text](image-115.png)
![alt text](image-116.png)
![alt text](image-117.png)

## Video 14: OData - Multilevel Deep Entity Set (GET) Method

![alt text](image-118.png)
![alt text](image-119.png)
![alt text](image-120.png)
![alt text](image-123.png)
![alt text](image-122.png)

![alt text](image-124.png)
changes to
![alt text](image-126.png)
![alt text](image-125.png)
![alt text](image-127.png)

![alt text](image-128.png)
![alt text](image-129.png)

## Video 15: OData - Dynamic Where Condition, Sort and Filter Process

![alt text](image-130.png)
![alt text](image-131.png)
iv_filter_string - dynamic where condition

![alt text](image-132.png)
![alt text](image-134.png)
![alt text](image-133.png)

![alt text](image-135.png)
![alt text](image-137.png)
![alt text](image-136.png)

![alt text](image-138.png)
![alt text](image-139.png)
![alt text](image-140.png)
![alt text](image-141.png)

![alt text](image-142.png)
![alt text](image-143.png)
![alt text](image-145.png)
![alt text](image-146.png)

![alt text](image-147.png)
![alt text](image-148.png)
![alt text](image-144.png)

![alt text](image-149.png)

## Video 16: OData Service - Batch Process (GET) Part 1

![alt text](image-150.png)
![alt text](image-151.png)
![alt text](image-152.png)
![alt text](image-153.png)
![alt text](image-154.png)
![alt text](image-155.png)

![alt text](image-156.png)

## Video 17: OData Service - Batch Process Part2
![alt text](image-157.png)
give separate changeset for post, put, delete. not needed for get

![alt text](image-158.png)
![alt text](image-159.png)
![alt text](image-161.png)
![alt text](image-160.png)

## Video 18: OData Service - Media Handling

![alt text](image-162.png)
![alt text](image-163.png)
![alt text](image-164.png)

![alt text](image-165.png)
![alt text](image-166.png)
mark media for entity type

![alt text](image-167.png)
![alt text](image-168.png)
![alt text](image-169.png)
we will receive image file name in iv_slug parameter

![alt text](image-170.png)
![alt text](image-171.png)
![alt text](image-172.png)
Here we have not implemented the get_entity_set method, but we can get the imae with the /$value url

![alt text](image-173.png)

## Video 19: OData Service - Exception handling

![alt text](image-174.png)
![alt text](image-175.png)
![alt text](image-176.png)
![alt text](image-177.png)
![alt text](image-178.png)

![alt text](image-179.png)
![alt text](image-180.png)
![alt text](image-181.png)
![alt text](image-182.png)
![alt text](image-183.png)

![alt text](image-184.png)
Multiple message returned from method

![alt text](image-185.png)
message text only

![alt text](image-186.png)
exception raised
![alt text](image-187.png)

![alt text](image-188.png)
![alt text](image-189.png)

## Video 20: OData Service - UI File to DMS Server

![alt text](image-190.png)