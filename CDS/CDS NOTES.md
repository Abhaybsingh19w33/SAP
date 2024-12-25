# Just2Share
## Video:1 ABAP CDS Views Introduction
![alt text](image-5.png)
![alt text](image-6.png)

## Video 2 - HANA Studio Intro, Simple CDS Views, Access in SE38 & SE11

![alt text](image-7.png)

@AbapCatalog.sqlViewName: ''

## Video 3 - CDS with I/P, CDS in SE38, Call CDS from another CDS, CDS to ALV

![alt text](image-8.png)

Input parameters created in cds views are mandatory.

##  Video 4 - About Versions and Explore Standard CDS Views

![alt text](image-9.png)

## Video 5 - Session Variable & Simple Data Manipulation in CDS Views

![alt text](image-10.png)

    $session.client

![alt text](image-11.png)
![alt text](image-12.png)

## Video - 6 CDS Views Joins (Inner, left outer and right outer)

![alt text](image-13.png)

## Video 7 - CDS View Association Part 1

![alt text](image-14.png)

![alt text](image-15.png)
Unnecesarily all the data is pulled, also if someone is not authorized then also it will pull the data

![alt text](image-16.png)
Always make associations public to use them

You should not make any associations with the field which is available in the association part not with the source. Here the source is sheader other all four are association.You always make the connection between your source and association with your basic sheader only

All the fields used in the mapping of association, that should be avl in the projection list

![alt text](image-17.png)

## Video - 8 CDS View Association Part 2

![alt text](image-18.png)

![alt text](image-19.png)
inner join - changed assocition left outer join to inner join, do that the empty field will not come

![alt text](image-20.png)
we can use path expressions like this also

![alt text](image-21.png)
![alt text](image-22.png)

![alt text](image-23.png)
![alt text](image-24.png)
![alt text](image-25.png)

![alt text](image-26.png)
![alt text](image-27.png)
here due to 1..* cardnality we are geting duplicate records































































![alt text](image-2.png)
![alt text](image-1.png)
![alt text](image-3.png)
![alt text](image-4.png)