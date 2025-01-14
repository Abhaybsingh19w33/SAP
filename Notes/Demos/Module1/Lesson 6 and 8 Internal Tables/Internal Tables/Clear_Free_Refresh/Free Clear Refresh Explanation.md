Even though clear, refresh and free are used in same context in ABAP, there is a difference between all three.

Clear is used to clear the contents of variables, work areas.
    Ex: clear lv_test. 

We can also use clear to clear the contents of internal table by specifying [] in the end of Internal Table name.
    Ex: clear it_mara[]. 

Just "clear it_mara." will clear the header line contents and not the body contents and hence if it_mara is a internal table without header line then no action will be done.

So its important to specify [] if you are using clear to clear the contents of internal table.

Or we can use refresh to clear the contents of the body of IT.
Ex: refresh it_mara.
No explicit [] is requried.

Clear and refresh will clear the data stored but will not de-allocate the memory.
Free will de allocate the memory 
( In simple words destroy the variable/internal table etc). It should be used only when you are sure that the variable will never be used after that point.
Ex: free it_mara.

FREE- You can use FREE to initialize an internal table and release its memory space without first using the REFRESH or CLEAR statement. 
Like REFRESH, FREE works on the table body, not on the table work area. After a FREE statement, you can address the internal table again. It still occupies the amount of memory required for its header (currently 256 bytes). When you refill the table, the system has to allocate new memory space to the lines.

REFRESH- This always applies to the body of the table. As with the CLEAR statement, the memory used by the table before you initialized it remains allocated
