# Exploring ABAP on HANA [8] : Introduction to AMDP

## Only Variables and Tables are allowed as parameters. We can not use structures or nested tables.
- Generic types can not be used for parameters. For example Type Any can not be used.
- Only elementary data types and table types with a structured row type can be used.
- The table type components must be elementary data types and it can not have elements which are table types. 

## Additional restrictions on method parameters
- Only pass by value can be used. Pass by reference is not permitted. Using VALUE keyword for all parameters is required.
- RETURNING parameters are not allowed. We can use EXPORTING or CHANGING to receive the values.
- Only input parameters can be flagged as optional with a DEFAULT value ( literals/constants )
- In RAISING clause, only class based exceptions are allowed from a specific exception list.
- Parameter names can not start with %_. I like this rule as it does not affect me.
- Some keywords like connection, client, endmethod are reserved. Do not use such names for parameters.

## Allowed Exception List
```
CX_ROOT
  |
  |--CX_DYNAMIC_CHECK
       |
       |--CX_AMDP_ERROR
           |
           |--CX_AMDP_VERSION_ERROR
           |    |
           |    |--CX_AMDP_VERSION_MISMATCH
           |
           |--CX_AMDP_CREATION_ERROR
           |    |
           |    |--CX_AMDP_DBPROC_CREATE_FAILED
           |    |
           |    |--CX_AMDP_NATIVE_DBCALL_FAILED
           |    |
           |    |--CX_AMDP_WRONG_DBSYS
           |
           |--CX_AMDP_EXECUTION_ERROR
           |    |
           |    |--CX_AMDP_EXECUTION_FAILED
           |    |
           |    |--CX_AMDP_IMPORT_TABLE_ERROR
           |    |
           |    |--CX_AMDP_RESULT_TABLE_ERROR
           |
           |--CX_AMDP_CONNECTION_ERROR
                |
                |--CX_AMDP_NO_CONNECTION
                |
                |--CX_AMDP_NO_CONNECTION_FOR_CALL
                |
                |--CX_AMDP_WRONG_CONNECTION
```
(Source : https://help.sap.com/doc/abapdocu_740_index_htm/7.40/en-US/index.htm?file=abenamdp.htm )

## Important
- Every AMDP method will have below addition. READ-ONLY is only the optional addition and is used for methods that only read the data.
    - BY DATABASE PROCEDURE
    - FOR HDB
    - LANGUAGE SQLSCRIPT
    - READ-ONLY

- It is also mandatory to specify all the database objects and other AMDP methods that are used within the SQLSCRIPT code.
- No ABAP statements can be written in the method code.
- AMDP methods do not have any implicit enhancement options.

## Restrictions
- DDL statements that create/change/delete database objects can not be used.
- The statements COMMIT and ROLLBACK are not permitted
- Write access to database tables, for which SAP buffering is activated, is not permitted.

# Exploring ABAP on HANA [9] : Calling an AMDP

## Important
- Use Static Method to implement AMDP
- The AMDP to be called, needs to be specified in USING as class_name=>method_name.
- Specifiying importing, exporting is not required, but the parameter list is separated with comma (,)
- SQL Script statements end in semi-colon (;)