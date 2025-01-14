# BADI (Business Add-in)
- BADI is another way of implementing enhancements to the standard programs without modifying the original code.
- BADI's are implemented using OO programming technique Technically a BADI is nothing but an interface.
- Each BADI consists of the method without implementation called as BADI definition.
- We need to create classes to write the ABAP code by implementing the methods called as BADI implementation.

SE18 is the T-code for BADI definition, SE19 is the T-code for BADI implementation.

## Advantages of BADI
- The main advantage of using BADI's is, we can create multiple implementations for a single BADI definition.
- Whereas with the exits, we can create a single implementation I.e. a single project for an enhancement.
- We cannot create another project (implementation) for enhancement which is already used. That is why we go for BADI's.

## Types of BADI
- Single implementation BADI.
- Multiple implementations BADI.
- Filter BADI.
- Custom BADI (Not used/Rarely used)

### Single implementation BADI: 
- A BADI which has only one implementation (single class) is called single implementation BADI.

### Multiple implementations BADI: 
- A BADI which has multiple implementations is called multiple implementations BADI. By default all the implementations will be executed.
- We cannot control the sequence of execution of multiple implementations.

### Filter BADI 
- It is type of BADI which has a filter value so that only those implementations which satisfy the filter value are executed. The remaining implementations are not executed this type of BADI is called a filter BADI.
    ![alt text](image-1.png)

## Properties of BADI
- If WITH IN SAP checkbox is selected then this BADI is only used by sap.
- If multiple use checkbox is selected then it is a multiple implementation BADI.
- If multiple use checkbox is not selected then it is a single implementation BADI.
- If filter dependent checkbox is selected then it is filter dependent BADI. We need to specify the filter type such as land1, bukrs and werks for the filter BADI.