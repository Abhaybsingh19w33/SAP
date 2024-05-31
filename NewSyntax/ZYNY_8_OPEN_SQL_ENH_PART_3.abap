*&---------------------------------------------------------------------*
*& Report ZYNY_8_OPEN_SQL_ENH_PART_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zyny_8_open_sql_enh_part_3.

*Link - https://discoveringabap.com/2021/09/23/abap-7-4-and-beyond-8-open-sql-enhancements-part-3/

*This post uses custom table ZMMOVIE to explain the concepts – so here
*is how the table looks like.

*Case Insensitive Search
*Earlier, to search for a text, you would get the data into internal
*table, loop through the table, change the content of the field to be
*searched in to upper case, also translate search string to upper case
*and then perform the ‘CS’ like operation.

*Now, just use below,

"Search string - this can be a parameter as well
DATA(search_string) = 'IRon'.

"Code to search using the search string
DATA(str_for_db) = '%' && to_upper( search_string ) && '%'.
SELECT movie FROM zmmovie
  WHERE upper( movie ) LIKE @str_for_db
  INTO TABLE @DATA(lt_movie).

*The results is as below. (This is output written to console in a Cloud
*ABAP system) https://discoveringabap.com/wp-content/uploads/2021/09/abap7.4_12_03.jpg?ezimgfmt=ng:webp/ngcb2

*Where clause
*Arithmetic operations in where clause

*Operations like addition, subtraction and multiplication are allowed
*between fields in the where clause.

SELECT movie FROM zmmovie
  WHERE ( grosscol - openingcol ) > 10000000
  INTO TABLE @DATA(lt_movie).

*Note that operations +, – and * are allowed to be used in where clause
*for table fields at the moment. Division ( / ) is not allowed.

*Method call within a where clause, select list and on condition

*Imagine a functional method get_hulk_movie that returns a movie
*featuring a fictional character ‘Hulk’. This returning value can
*directly be used in where clause.

SELECT movie FROM zmmovie
  WHERE movie = @( get_hulk_movie( ) )
  INTO TABLE @DATA(lt_movie).

* IS INITIAL or IS NOT INITIAL in WHERE clauses

*As of ABAP 1809, you can use IS INITIAL or IS NOT INITIAL in WHERE
*clauses.

"Select movies where gross collection data is available
SELECT movie from zmmovie
  where grosscol is not initial
  INTO TABLE @DATA(lt_movie).

*Code Completion in Select Query
*As the syntax has been enhanced to allow us to write SELECT FROM
*<tablename> FIELDS… , when you are typing fields, you can use code
*completion easily. Look at below example to understand the field
*suggestions. (Use Ctrl + Space to get the suggestion)