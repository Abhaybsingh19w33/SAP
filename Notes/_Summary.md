- Transaction Code
    - Acronym to access menu path
    - Sequence of Screens with Input and Output fields for Processing
        - SM35 - To run batch input and you can post the batches triggered
        - SM37 - Background job monitoring
        - SMOD - Locate Exit
        - CMOD - Implement Exit
        - SE09 - Transport Org
        - SE10 - Transport Org
        - SE24 - Class Builder - Used to create and maintain global classes and interfaces.
        - SE93 - Maintain Transaction Codes - Used to create a new transaction code for an ABAP program12.
        - SE80 - Object Navigator - Central tool for development, where you can create and manage various development objects.
        - SE38 - ABAP Editor - Used to create and edit ABAP programs.
        - SE11 - Data Dictionary - Used to create and maintain database objects like tables, views, and data elements.
        - SE37 - Function Builder - Used to create and manage function modules.
        - SE41 - Menu Painter - Used to create and maintain menus.
        - SE51 - Screen Painter - Used to create and maintain screens.
        - SE78 - SAPScript Graphics Management - Used to manage graphics for SAPScript - Upload Image to SAP.
        - SE71 - SAPScript Form Painter - Used to create and maintain SAPScript forms.
        - SE61 - SAPScript Text Management - Used to create and maintain standard texts.
        - SE91 - Message class
    - Possible Command Field Entries
        - /nxxxx – to call Transaction xxxx
        - /n – cancel Transaction
        - /oxxxx – to Call Transaction xxxx in a new Session
        - /o – display an overview of Sessions
        - Enter /nend in the command field to log off (prompt for confirmation)
        - Enter /nex in the command field to log off (not prompt for confirmation)
    - The Commonly Used Transaction Codes are
        - SE80 Object Navigator (ABAP Development Workbench)
        - SE21 Package Builder
        - SE51 Screen Painter
        - SE17 General Table Display
        - SM13 Update Records
        - SM39 Background Information
        - SM51 Server Overview
        - SP01 Spooler
        - ST03 Workload Analysis
        - ST10 Table Call Statistics
        - ST11 Trace Logs
        - ST22 ABAP Dump Analysis
        - SU50 View/set user defaults
        - SO10 Standard Text
        - SE10 Transport Organizer (to create)
        - SE09 Transport Organizer (to check)
        - SE41 Menu Painter
        - SE78 to import image
        - SE55 internal table view maintenance (generate table maintenance dialog)
        - XK01 Create Vendor
        - XK02 Change Vendor
        - XK03 Display Vendor
        - MM01 Create Material Data
        - MM02 Change Material Data
        - MM03 Display Material Data
        - ME21N Create Purchase Order
        - ME22N Change Purchase Order
        - ME23N Display Purchase Order
        - SMOD SAP Enhancement Management
        - CMOD Enhancements (Implement enhancement)
        - SE12 Single Transaction Analysis
        - SE63 Translation Editor
        - SMARTSTYLES For styles
        - SFP adobe forms
        - SE73 - Fonts
    - ABAP / Tables / Data Dictionary
        - SE11 − Dictionary definitions/ ABAP Dictionary
        - SE14 − Database utility
        - SE16 − Data Browser (display only)
        - SE16N − Modify: “&sap_edit” (uase16n)
        - SD11 − Data model
        - SM30/SM31 − SAP Table view maintenance
        - SE54 (SOBJ) − Table / View Cluster
        - SE37 − Function module editor
        - SE38 / SE39 - Program editor / split screen
        - SA38 − Program execution
        - SE80 − ABAP development workbench
        - SE84 − Object navigator / Repository Information System
        - SE18 − BAdI definitions
        - SE19 − BAdI implementations
        - SE24 − Class builder
        - SWO1/2 − Business object builder / browser
        - SMARTFORMS − Smart forms administration
        - SE71 − SAP script (Form painter)
        - SE43 − Area menu maintenance
        - SE91 − Message maintenance
        - SE93 − Transaction maintenance
    - Runtime / Logs / Database
        - SM21 − System log sm13 Update requests / System Log: Local Analysis
        - ST22 − ABAP Runtime Error (Dump Analysis)
        - SM12 − Table lock entries
        - SM56 − Number range buffers
        - SNRO − Number ranges
        - SAT/SE30 − ABAP Runtime Analysis (SQL statement compare)
        - ST01 − System trace
        - ST05 − SQL Trace / Trace Requests
        - DB02, ST04 or DBACOCKPIT − Database tools / performance
        - ST02, ST06 − Database tune summary
        - ST06 - Operating System Overview
        - SCU3 − Table logging (see V_DDAT_54)
    - Jobs / Batches / Events
        - SM36 − Job definition
        - SM37 /SMX − Job overview / Background job list
        - SM50 − Work Process overview
        - SM34 − View cluster maintenance
        - SM49/SM69 − External commands
        - SM66 − Process overview
        - SM62/SM64 − Event overview / administration
        - STVARV(C) − Selection fields variables
    - User Administration
        - SM04 − User overview / Current users on the current server
        - SU53 − Check authorization data for user
        - SUIM − User information / authorization
        - SU20 / SU21 − Authorization object and class / field
        - SU01 − User maintenance PFCG roles
        - SU03 − Authorization Archive Development Kit (ADK)
    - Batch Input
        - SM35 − Batch Input: session overview
        - SHDB − Batch input recorder
    - Direct Input Method
        - BMV0 / program RBMVSHOW - To start Direct Input Method Programs
    - Paths & Connections
        - AL11 − SAP file directory (Application server maybe)
        - FILE − Logical file path
        - SM58 − Transactional RFC
        - SM59 − RFC connections / Display and maintain RFC destinations
    - Spool (Print Output)
        - SP01 − Spool request selection
        - SP02 − List of own spool requests
        - SPAD − Spool administration

- Standard Tables
    - DD02L List of All Tables
    - TSTC List of All Tcodes
    - TADIR R/3 Repository Objects
    - T000 Clients

- Types of Tables
    - Transparent Tables
    - Pooled Tables 
        - Many-to-One Relationship with the table in Database
        - SAP Proprietary Construct
        - Stored in a Table Pool
        - Table Pools Hold large number of small Tables
        - When activated, a single table is created in database
        - Define Pooled tables within R/3 and assign them to the table pool
        - Holds CUSTOMIZING data
            - Codes, Field Validations, number ranges, parameters
            - Country Code table, Exchange Rate Table, etc..,
            - Data in Customizing Table is set by Functional Consultant during the initial Implementation
        - Definition of table pool contains 2 Key fields
            - Tabname
            - Varkey (Contains Entry from all key fields)
    - Cluster Tables
        - Many-to-One relationship with table in database
        - Cluster tables are stores in Table Cluster in Database
        - SAP Proprietary
        - Used when the tables have a part of Primary Key in common
        - Data accessed Simultaneously
        - Contain Fewer tables than Pool tables
        - In a single I/O, all the related rows in a cluster table are retrieved
        - Reduces the no. of Database reads and improves Performance
        - The records of all cluster tables with the same key are stored under one key in the assigned table cluster. The values of the key fields are stored in the corresponding key fields of the table cluster.

- Delivery Class

    The delivery class controls the transport of table data for installation, upgrade, client copy and when transporting between customer systems.

    There are the following development classes:
    - A: Application table (master and transaction data)
    - C: Customer table, data is only maintained by the customer.
    - L: Table for storing temporary data
    - G: Customer table, SAP may insert new data records but may not overwrite or delete existing ones
    - E: System table with its own namespace for customer entries. The customer namespace must be defined in table TRESC
    - S: System table, data changes have the status of program changes.
    - W: System table (e.g. table of the development environment) whose data is transported with its own transport objects (e.g. R3TR PROG, R3TR TABL, etc.).

- Data Class
    - The data class logically defines the physical area of the database where your base database table resided.
    - Hence, you should choose the data class correctly, the table will automatically created in the appropriate area on the database when it is activated in the dictionary.
    - The most important data classes are master data, transaction data, organizational data and system data
    - The data class determines the table space that the table is assigned to.
    - A tablespace is a physical file on the disk which is used to hold tables
    - Every table is assigned to one tablespace
    - If you choose the data class correctly, your table is automatically assigned to the correct area (tablespace or DBspace ) of the database when it is created.
    - Each data class corresponds to a physical area in which all the tables assigned to this data class are stored.
    - There are the following data classes:
        - APPL0 (Master Data): Data which is seldom changed. An example of master data is the data contained in an address file, such as the name, address and telephone number.
        - APPL1 (transaction data): Data that is frequently changed. An example of transaction data is the goods in a warehouse, which change after each purchase order.
        - APPL2 (organizational data): Customizing data that is defined when the system is installed and seldom changed. An example is the table with country codes.

- ALV
    ```
    Reuse_alv_fieldcatalog_merge

    CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
        EXPORTING
            i_callback_program = sy-repid             " current program name
            i_callback_pf_status_set = 'ZSTANDARD'    " pf status for list alv
            it_fieldcat = IT_fieldcat                 " field catalog
            i_callback_user_command = 'USER_COMMAND'  " user command
        TABLES
            t_outtab = IT_TAB.                        " data table
    ```
    ```
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_CALLBACK_PROGRAM = SY-REPID
      IT_FIELDCAT        = LT_FIELDCAT
    TABLES
      T_OUTTAB           = LT_OUT
    EXCEPTIONS
      PROGRAM_ERROR      = 1
      OTHERS             = 2.
    ```

- OOALV
    ```
    CL_GUI_ALV_GRID
    CL_GUI_CUSTOM_CONTAINER - Container

    Inheritance Hierarchy
    CL_GUI_OBJECT <- CL_GUI_CONTROL <- CL_GUI_ALV_GRID_BASE <- CL_GUI_ALV_GRID

    Method CL_GUI_ALV_GRID -> SET_TABLE_FOR_FIRST_DISPLAY
    Method CL_GUI_ALV_GRID -> REFRESH_TABLE_DISPLAY
    ```

- ALVIDA

    ```
    TRY.
        cl_salv_gui_table_ida=>create_for_cds_view(
        EXPORTING
            iv_cds_view_name               = 'ZDEMO_CDS_PURCHASE_HEADER'
        *    io_gui_container               =
        *    io_calc_field_handler          =
        RECEIVING
            ro_alv_gui_table_ida           = DATA(o_alv)
        ).
        CATCH cx_salv_db_connection.
            MESSAGE 'DB connection failed' TYPE 'E'.
        CATCH cx_salv_db_table_not_supported.
            MESSAGE 'DB connection failed' TYPE 'E'.
        CATCH cx_salv_ida_contract_violation.
            MESSAGE 'IDA contract violation' TYPE 'E'.
        CATCH cx_salv_function_not_supported.
            MESSAGE 'Function not supported' TYPE 'E'.
    ENDTRY.

    CL_SALV_GUI_TABLE_IDA class has method create which returns RO_ALV_GUI_TABLE_IDA.
    RO_ALV_GUI_TABLE_IDA is of type IF_SALV_GUI_TABLE_IDA.
    IF_SALV_GUI_TABLE_IDA has method FULLSCREEN.
    IF_SALV_GUI_TABLE_IDA has method SET_SELECT_OPTIONS.

    SET_SELECT_OPTIONS has parameter IT_RANGES
    IT_RANGES has an IMPORTING PARAMETER of TYPE IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES
    IF_SALV_SERVICE_TYPES IS AN INTERFACE WHIUCH HAS THE TYPE YT_NAMED_RANGES

    CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method ADD_RANGES_FOR_NAME
    ADD_RANGES_FOR_NAME has an Importing parameter IV_NAME
    IV_NAME is of type string
    ADD_RANGES_FOR_NAME has an Importing parameter IT_RANGES
    IT_RANGES is an Internal table (ANY TABLE) type

    CL_SALV_RANGE_TAB_COLLECTOR is a class which has the method GET_COLLECTED_RANGES
    GET_COLLECTED_RANGES has Exporting parameter with name ET_NAMED_RANGES
    ET_NAMED_RANGES is of type IF_SALV_SERVICE_TYPES=>YT_NAMED_RANGES
    'Z7674_CDSVW1'
    ```

- ADBC
     - GET_CONNECTION IS A STATIC METHOD OF CLASS CL_SQL_CONNECTION
     - IT HAS importing parameter CON_NAME which is of type DBCON_NAME
     - IT has returning parameter CON_REF which if of type CL_SQL_CONNECTION

     ```
     o_conn   TYPE REF TO cl_sql_connection,
     o_sql    TYPE REF TO cl_sql_statement,
     o_result TYPE REF TO cl_sql_result_set,
     v_sql    TYPE string,
     o_data   TYPE REF TO data
     ```
- Enhancement
    - What is Customer Exits ?
        - Customer exits are "hooks" provided by SAP within many standard programs, screens and menus on which customers may "hang" custom functionality to meet business requirements.

- There are three main types of customer exits
    1. Function Module Exit - It  allows customer to add code via a function module at a specific location in an SAP application programs
    2. Screen Exit -  It allows customer to add fields to a screen in an SAP program via a subscreen. The subscreen is called within the standard screen's flow logic.
    Ex - CALL CUSTOMER-SUBSCREEN CUSTSCR2
    3. Menu Exit - It  allows customer to add items to a pulldown menu in a standard SAP program. These items may be used to call add-on programs or custom screens.

- Performance Tuning
    - ST05 is the performance trace. It contains the SQL Trace plus RFC, enqueue and buffer trace. Mainly the SQL trace is used to measure the performance of the select statements of the program.
    - SE30 is the Runtime Analysis transaction and can be used to measure the application performance. 
    - SAT transaction is the replacement of the pretty outdated SE30. Provides same functionality as SE30 plus some additional features.
    - ST12 transaction (part of ST-A/PI software component) is a combination of ST05 and SAT. Very powerful performance analysis tool used primarily by SAP Support.
    - One of the best tools for static performance analyzing is Code Inspector (SCI). There are many options for finding common mistakes and possible performance bottlenecks.

- Types of Requests
    1. Workbench Request - A source of information in the transport organizer that records and manage all the modifications made to repository and customizing settings during a development work.
    2. Customizing Request - Customizing request record client-specific customizing settings made in a single client and usually these will be done in transaction SPRO.
    3. Transport Of Copies 
    - Transport object to a specified SAP system. 
    - Objects are transported with the current version in SAP system.
    - Original location of the object will remain 
    - No delivery to another SAP System
    - A transport of copies will move the latest version of an object included to the system of your choice but will not assume that you want to move it to production. Therefore, it transports a “copy” of the object but assumes that its final destination is only the system that you are moving it to.

- Global Data Types
    - Elementary Type
    - Structure Type
    - Table Type

- System Fields for Interactive Lists
    - SY-LSIND Index for the current list.
    - SY-LISTI Index of the last list displayed.
    - SY-LILLI Absolute number of a selected line in the list displayed.
    - SY-CPAGE Number of the upper-most displayed line in the list displayed.
    - SY-LISEL Contents of the line from which the event was triggered.
    - SY-CUCOL Number of the column in the window where the cursor was last positioned in the list displayed.
    - SY-CUROW Number of the line in the window where the cursor was last positioned in the list displayed.
    - SY-STACO Number of the first column displayed in the list displayed.
    - SY-STARO Number of the first visible line in the top displayed page
    - (SY- PAGE) in the list displayed (not including header lines).
    - SY-UCOMM Function code that triggered the interactive event in the list displayed.
    - SY-PFKEY Status of the list displayed.

- System Variable
    - SY-CPAGE – Holds Current Page Number
    - SY-CPROG – Contains Program Name
    - SY-CUCOL – Cursor Position (Column)
    - SY-CUROW – Cursor Position (Line)
    - SY-DATLO – Local Date for User
    - SY-DATUM – System Date
    - SY-DATUD – Global Date Related To UTC (GMT )
    - SY-DBCNT – Number of entries read by DB Operation
    - SY-DBNAM - Logical DB for ABAP/4 Program
    - SY-DBSYS – System DB System
    - SY-DYNNR - Number of Current Screen
    - SY-INDEX – Number Of Loop passes
    - SY-LANGU - SAP Log on Language Key
    - SY-LILLI – Number Of Current List Line
    - SY-LINCT – Number Of List Lines
    - SY-LINNO – Current Line for List Creation
    - SY-LINSZ – Line Size of List
    - SY-LISEL – Selected Line For Interactive List
    - SY-LSIND – Number Of Secondary List
    - SY-MANDT – Client Number For SAP Log On
    - SY-MSGID – Message ID
    - SY-MSGTY – Message Type
    - SY-MSGNO – Message Number
    - SY-MSGV1 – Message Variable1
    - SY-MSGV2 – Message Variable2
    - SY-MSGV3 – Message Variable3
    - SY-MSGV4 – Message Variable4
    - SY-OPSYS – Operating System
    - SY-PAART – Print Format
    - SY-PAGCT – Page Size of List in Report Program
    - SY-PAGNO – Current Page in the List
    - SY-PDEST – Print Output Device
    - SY-PFKEY – Run time Current F key Status
    - SY-REPID – Report Name in ABAP
    - SY-SAPRL – SAP Release
    - SY-SUBRC – Return Value after specific ABAP Statement
    - SY-SYSID – SAP system ID
    - SY-TABIX – Current line of Internal Table
    - SY-TCODE – Current Transaction Code
    - SY-TIMLO – Local Time Of User
    - SY-TITLE – Title of ABAP Program
    - SY-TMAXL – Maximum entries in a Internal Table
    - SY-TNAME – Name Of Internal Table after first Access
    - SY-UCOMM - Interact : Command field Function entry / Function code
    - SY-ULINE – Underline
    - SY-UNAME – Session : SAP user from Log On
    - SY-UZEIT – System Time
    - SY-VLINE – Vertical Bar

- Subroutine
    Addition            Method
    Using               -> v1 Pass by reference
    Changing            -> v1 Pass by reference
    Using value(v1)     -> Pass by value
    Changing value(v1)  -> Pass by value and result

- OOABAP
    - Class
        - Multiple Instances
        - Encapsulation
        - Inheritance
        - Polymorphism
        - Compatibility
        - Maintainability
    
    A class is a set of objects that have the same structure and the same behaviour. A class is therefore like a blueprint, in accordance with which all objects in that class are created. 
    
    The components of the class are defined in the definition part. The components are attributes, methods, events, constants, types, and implemented interfaces. Only methods are implemented in the implementation part. 
    
    The CLASS statement cannot be nested, that is, you cannot define a class within a class.
