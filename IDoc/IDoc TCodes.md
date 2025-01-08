1. WE02: Display IDocs 
    - This t-code allows you to display IDocs based on different criteria such as IDoc number, message type, partner number, etc.

2. WE05: List of IDocs
    - With this t-code, you can view a list of IDocs based on specific search criteria.

3. WE09 -  Search IDoc using segment value
    - with this tcode you can Search idoc using particular segment value. 

4. WE11 - Delete IDoc
    - with this tcode you can delete idoc 

5. WE14: Process IDoc in test mode
    - This t-code allows you to process IDocs in a test mode without actually posting any data to the system. For testing and debugging purposes, it is helpful.

6. WE19: Test tool for IDocs
    - It provides a testing environment where you can create or modify IDocs manually and simulate the   processing of IDocs.

7. WE20: Partner profiles
    - This t-code is used to configure partner profiles, which define the communication settings for exchanging iDocs with different partners.

8. WE21: IDoc port
    - using this tcode you can create idoc Port

9. WE30: IDoc types
    - It allows you to define or modify iDoc types, which represent the structure and format of the data being exchanged.

10. WE31: IDoc segments
    - With this t-code, you can define or modify iDoc segments, which are the building blocks of iDocs and represent individual fields or groups of fields.

11. WE41: Outbound Process code 
    - This t-code provides documentation for process codes, which are used to determine the processing logic for outbound iDocs.

12. WE42: Inbound Process code
    - This t-code provides documentation for process codes, which are used to determine the processing logic for inbound iDocs.

13. WE57 : IDoc - assignment Fm to log.  message and idoc type
    - using this tcode we can establishing the relationship between function module and message type. 

14. WE60: IDoc documentation
    - It provides detailed documentation for IDoc types, segments, and fields, helping you understand the structure and usage of IDocs.

15. WE81 - logical message type
    - using this tcode you can create message type

16. WE82 -  Message type assignment to idoc types
    - using this tcode you can assign message type to basic type and extension.

17. BD10 - Send material
    - using this tcode you can send material to other sytem.

18. BD11 - Get Material
    - using this you can get matrial

19. BD12 - Send Customer
    - using this tcode you can send Customer to other sytem.

20. BD13 -Get Customer
    - using this you can get customer

21. BD14 - Send Vendor
    - using this tcode you can send Vendor to other sytem.

22. BD15 - Get Vendor 
    - using this you can get vendor

23. BD16 - Send cost center
    - using this tcode you can send cost center to other sytem.

24. BD17 - Get Cost center
    - using this you can get cost center
25. BD18 -  Send General Ledger Account
    - using this tcode you can send Send General Ledger Account to other sytem.

26. BD19 - Get General Ledger Account
    - using this tcode you can get General Ledger Account.

27. BD21 - Change pointer idoc trigger for message type
    - using this tcode you can trigger idoc for change pointer for particular message type.

28. BD22 - Delete changes pointer entries from BDCP2 table  
    - using this tcode you can Delete changes pointer entries from BDCP2 table.
 
29. BD50 - Activate change pointer for message type
    - using this tcode you can activate change pointer for particular message type

30. BD51 - Maintain characteristric of inbound function module.
    - using this tcode you can register characteristic of inbound function module.

31. BD52 - Activate change pointer at field level
    - using this tcode you can activate change pointer at field level

32. BD54 - Logical system
    - using this tcode you can check or create logical system

33. BD55 – Assign conversion rules to sender and receiver system for particular message type.
    - using this tcode you can Assign conversion rules to sender and receiver system for particular message type.
 
34. BD56 - Segment filtering
    - using this you can restrict segment for particular message type and receiver system.

35. BD62 - Create conversion rules name, description and segment.
    - using this tcode you can Create conversion rules name, description and segment

36. BD64 - Distribution channel.
    - using this tcode you can filter idoc base on value.

37. BD79 – Maintain condition values or constant values.
    - using this tcode you can Maintain condition values or constant values for change pointer.

38. BD87 - IDoc Reprocessing
    - Using this tcode you can reprocess idoc which is in error status.

## ALE
    - WE31 – IDoc segments 
    - WE60 – IDoc types documentation / Process codes
    - WE30 – IDoc types - Creating IDoc extension type
    - WE81 – Message types
    - WE82 – IDoc Type / Message
    - WE41 – Outbound process code
    - WE57 – Message / application object
    - WE09 – Find IDoc in database
    - WE19 – test tool
    - WE20 – Partner profiles / type
    - WE21 – Ports in IDoc processing
    - SBWP – SAP Business Work Place
    - SALE – ALE IMG - Logical Systems - R/3 Clients involved in data exchange
    - BD67 – Function modules for inbound ALE-EDI: details
    - BD64 – Maintain Distribution Model and Distribute Views
    - PFTC_DIS – Maintain Task
    - PFAC_DIS – Maintain Rule
    - PPOSW– Maintain Organization Structure
    - WE47 – IDOC status maintenance
    - SWO1 – business object builder
    - SE37 – function module builder
    - SE91 – messages
    - WE30 - Used to create the Basic Idoc type
    - WE20 - For creating partner profile
    - WE81 - To create message type
    - WE82 - Used to associate the message type and the idoc type
    - SM59 - To give the name of the logical destination
    - WE41 - To create Outbound Process Code
    - WE02 - To check the status of IDOC
    - WE05 - To check the status of IDOC
    - WE42 - To create Inbound Process Code
    - BD51 - To define the function module characteristics
    - WE02	List Of All Idocs Created. (Default, Additional, EDI)
    - WE05	List Of Idocs Created. (Standard, Additional)
    - WE06	Active Monitoring For Idoc Processing.
    - WE07	Idoc Statistics.
    - WE08	Display View “File Status”:Overview-Path Name.
    - WE09	Idoc Search For Business Contents (Database).
    - WE10	Idoc Search For Business Contents (Archive).
    - WE12	Modification Of Outbound File, Triggering Inbound Processing.
    - WE14	Process All Selected Idocs.
    - WE15	Selection Program For Issuing Output.
    - WE16	Trigger Inbound Processing.
    - WE17	Trigger Status Processing.
    - WE18	Generate Test Status File For Outbound Idocs.
    - WE19	Test Tool For Idoc Processing
    - WE20	Partner Profile.
    - WE21	Ports In Idoc Processing.
    - WE23	Display Test Catalog Test Idoc Interface.
    - WE24	Maintain Table View. Direction-1.(Outbound)
    - WE27	Maintain Table View. Direction-2.(Inbound)
    - WE30	Develop Idoc Type.
    - WE31	Develop Idoc Segments.
    - WE32	View Development.
    - WE33	Maintain Table Views.
    - WE34	Change View “Table Of Style Ids With The Objects To Be Loaded”
    - WE40	Display System Process Code.
    - WE41	Display View: Logical Msg Overview. For Outbund.
    - WE42	Display View: Logical Msg Overview. For Inbound.
    - WE43	Display Status Records.
    - WE44	Display Partner Types
    - WE45	Maintenance Interface: Forwarding Inbound/EDILOGADR For Application
    - WE46	Global Parameter For Idoc Interface.
    - WE47	Status Maintenance.
    - WE50	Display Text For Process Code System.
    - WE54	Idoc Function Module For File Name
    - WE56	Display Status Process Code
    - WE57	Idoc Assignment Of FM To Log. Message And Idoc Type.
    - WE58	Text For Process Code Status.
    - WE60	Documentation For Idoc Type.
    - WE61	Documentation For Idoc Record Type.
    - WE62	Documentation For Idoc Segment Type.
    - WE63	Documentation For Idoc Record Types And Idoc Types (Parser).
    - WE64	Process Code In Idoc Inbound And Outbound.
    - WE70	Conversion Table For Basic Types.
    - WE71	Conversion Table For Extensions.
    - WE72	Conversion Table For Field DOCTYP.
    - WE73	Conversion Table For Logical Message Type.
    - WE81	EDI:Logical Message Type.
    - WE82	Message Types And Assignment To Idoc Types.
    - WE84	Assignment Table Between Idoc And Application Field.
    - BD10	Send Material (Matmas)
    - BD11	Get Material.
    - BD12	Send Customer.
    - BD13	Get Customers
    - BD14	Send Vendor.
    - BD15	Get Vendor.
    - BD16	Send Cost Center. (Cosmas)
    - BD17	Request Cost Center.
    - BD18	Send G/L Accounts.
    - BD19	Get Master Data G/L Accounts.
    - BD20	Inbound Processing Of Idocs Ready For Transfer.
    - BD21	Creating Idoc Types For Change Pointers.
    - BD22	Delete Change Pointers.
    - BD23	Serialization Using Time Stamp: Deletion Of Old Time Stamp.
    - BD24	Send Cost Elements.
    - BD25	Send Activity Type (COAMAS)
    - BD26	Request Activity Type
    - BD27	Cost Center/Activity Types: Transmit Plan Quantities And Acty Prices.
    - BD28	Cost Center/ Cost Elements: Send Control Records.
    - BD30	Material Bom Distribution. (Bommat).
    - BD31	Document Structure Distribution. (Bomdoc)
    - BD32	Plant Allocation To Material Boms Distribution.
    - BD33	Distribution Of Material Variants. (STTMAT)
    - BD34	Distribution Of Boms (BOMORD)
    - BD35	ALE: Send Business Process Group.
    - BD36	ALE: Send Business Process.
    - BD37	ALE: Send Business Process Price.
    - BD40	Generate Idocs For Serialization Group From Change Pointers.
    - BD41	Dispatch Of Idocs Of Serialization Group.
    - BD42	Check Dispatch Status Of Idocs Of Serialization Group.
    - BD43	Processing Inbound Idocs Of Serialization Group.
    - BD44	Change View “Serialization Group”.
    - BD47	Dependence Between Methods.
    - BD48	Dependence Between Methods And Message Type.
    - BD50	Activate Change Pointers For Message Type.
    - BD51	Characteristics Of Inbound Function Module.
    - BD52	Determine Work Area.
    - BD53	Reduce Message Type.
    - BD54	Change View: Logical Systems
    - BD55	Idoc Conversion.
    - BD56	Maintain Idoc Segment Filters.
    - BD57	Link Type And Serialization Type Of Message Type.
    - BD58	Convert Organizational Unit.
    - BD59	Allocation Of Object Type.
    - BD60	Additional Data For Message Type.
    - BD61	Activate Change Pointers Generally.
    - BD62	Display Conversion Rule.
    - BD63	Transport Of Ale Tables For A Message Type.
    - BD64	Display Distribution Model.
    - BD65	Maintain Idoc Type Required Fields.
    - BD66	Change Idoc Fields.
    - BD67	Function Module For ALE/EDI Overview.
    - BD68	Maintain List.
    - BD69	Assignment Of Idoc Type To Message Type.
    - BD70	Cross-System Comparison Of Number Range Objects.
    - BD71	Attributes For Receiver Determination.
    - BD72	Active Events For ALE/EDI
    - BD73	Start Error Handling For Non-Posted Idocs.
    - BD75	Status Conversion With Trfc Execution.
    - BD77	Generate Transport Requests For Distributing ALE Customizing Data.
    - BD78	Monitoring Ale Customizing Data Transport
    - BD79	ALE IDOC Segments – Conversion Rule
    - BD81	Filter Objects For BAPI Parameter Filtering
    - BD82	Generating Partner Profile
    - BD83	Re-Processing Incorrect Outbound Odocs.
    - BD84	Re-Processing Of Idocs After ALE Input Error.
    - BD85	Consistency Check: Reassignment Between Two System.
    - BD86	ALE Consistency Check: Create Purchase Order From Sales Order.
    - BD87	Select Idocs
    - BD89	Customizing Data Modeling For Distribution Model.
    - BD91	Distribute All Characteristics Via ALE.
    - BD92	Distribute Class Via ALE: Send Direct.
    - BD93	Distribution Of Classification Data Via ALE.
    - BD95	Ale Object View
    - BD96	Filter Object For Receiver Determination Of Methods.
    - BD97	Assign RFC Destination For Synchronous Method Calls.
    - BD98	Consistency Check With Workflow Link
    - BD99	Dependencies Between Message Types.
    - BD100	Display Serialized Idocs. (Serialization Using Object Types)
    - BD101	Serialization Using Object Types: Consistency Check.
    - BD102	Ale: Outbound Channel Registry.
    - BD51	Maintain function modules (inbound)
    - BD55	Maintain IDoc Conversion
    - BD62	Define Segment Conversion Rule
    - BD79	Maintain IDoc Conversion Rules
    - BD87	Status Monitor for ALE Messages
    - BDM2	Monitoring: IDocs in Receiving Sys.
    - BDM7	ALE Audit: statistical analyses
    - IDOC	IDoc: Repair and check programs
    - SM58	Asynchronous RFC Error Log
    - SM59	RFC Destinations (Display/Maintain)
    - WE02	Display IDoc
    - WE05	IDoc Lists
    - WE06	Active IDoc monitoring
    - WE07	IDoc statistics
    - WE09	Search for IDocs by Content
    - WE10	Search for IDocs by Content
    - WE11	Delete IDocs
    - WE12	Test Modified Inbound File
    - WE14	Test Outbound Processing
    - WE15	Test Outbound Processing from MC
    - WE16	Test Inbound File
    - WE17	Test Status File
    - WE18	Create Status File
    - WE19	Test tool
    - WE20	Partner Profiles
    - WE21	Port definition
    - WE24	DefaultValuesForOutboundParameters
    - WE27	DefaultValues for Inbound Parameters
    - WE30	IDoc Type Development
    - WE31	Development IDoc Segment
    - WE32	Development IDoc View
    - WE34	Object for Display of XML IDocs
    - WE41	Process codes, outbound
    - WE42	Process codes, inbound
    - WE43	Funct.module: Status record display
    - WE44	Partner Types and Checks
    - WE45	Forward (inbound) (V3, EDILOGADR)
    - WE47	Status Maintenance
    - WE55	Function Module for Path Names
    - WE57	Assignment Messages for Appl. Objs
    - WE60	Documentation for IDoc types
    - WE64	Documentation message types
    - WE70	Conversion: Basic types
    - WE71	Conversion: Extensions
    - WE72	Conversion: IDoc types
    - WE73	Conversion: Logical messages
    - WE81	Logical message types
    - WE82	Assign Messages for IDoc Type
    - WELI	Define Status Groups
    - WLF_IDOC	IDoc Processing