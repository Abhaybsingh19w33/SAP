1) If a DBView points to 2 tables 
    - table maintainance generator is greyed out
    - Can a se38 program insert records in DB view and hence the DB table through internal tables
        - Yes.

2) If a DBView points to a single table
    - can table maintainance generator be used
        - No. Table maintainance generator is greyed out.
        - This happens even if Access is read and change and Display/Maintainance is allowed.
    - Can a se38 program insert records in DB view and hence the DB table through internal tables 

<!-- ------------------------------------------------------------------------- -->

1) If a ProjView points to 2 tables
    - can table maintainance generator be used
        - No ProjView is based only on one table.
    - Can a se38 program insert records in ProjView view and hence the DB table?
        - No. Error . View is write-protected if maint status is read-only.
        - Record can be inserted if maint status is read-change.
    - - Can a se38 program insert records in DB view and hence the DB table through internal tables

2) If a ProjView points to a single table
    - can table maintainance generator be used
        - No. table maintainance generator is greyed out.
    - Cannot Create Entries
        - This happens even if Access is read and change and Display/Maintainance is allowed.
    - Can a se38 program insert records in DB view and hence the DB table through internal tables

<!-- ------------------------------------------------------------------------- -->

DB View based on a single table.
1) Create a DBview which contains few fields only of emp table. 
    - View records of the view using Display contents in SE11.
    - View records of the view using se38.

    - Add a record to this view thru SE11. 
    - Not possible. Even if Maint Status is read-change.

    - Add a record to this view thru SE38 program. Yes.
    - check sysubrc after insert statement. Sy-subrc is 0.

<!-- ------------------------------------------------------------------------- -->

DB View based on a multiple tables.
1) Can a DBView be created on tables which do not have a foreign key relationship? 
    - Yes

2) Create a DBview which contains fields of emp and dept view records using se38.
    - Observe that TMG is greyed. Maintainance status is read only.
    - It is greyed and cannot be changed.

3) Add a record to this view thru se38 program.
    - check sysubrc after insert statement

4) Create a DBView based on scarr,spfli, sflight table.
    - Write a SE38 pgm to retrieve records from the table

<!-- ------------------------------------------------------------------------- -->

1) Create a Maint view which contains few fields only of Emp table. 
    - View records of the view using SE11.
        - NO
    - View records of the view using SE38.
        - NO
    - Add a record to this view thru SE38 program.
        - check sysubrc after insert statement.
        - NO
    - After TMG can see records in SE11
    - Add a record to this view thru TMG. 

2)  Create a Maint view which contains  fields of emp and dept. 
    - View records thru se11.
        - No.
    - view records using se38.
        - No
    - Can view records thru SE11 after TMG is done.
    
    - Add a record to this view thru se38 program.
        - Gives error during check. 
        - View is not defined as DataBase or Projection view
    
    - Add a record to this view thru TMG.
        - Adds record in emp table.
        - Check in dept table.