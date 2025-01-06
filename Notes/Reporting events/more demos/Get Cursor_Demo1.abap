REPORT  Z.

DATA: field_name(20), field_value(30),
      it TYPE STANDARD TABLE OF z104329emp
                     WITH HEADER LINE.

START-OF-SELECTION.
  SELECT * FROM z104329emp UP TO 6 rows
    INTO TABLE it.

  LOOP AT it.
    NEW-LINE.
    WRITE: it-empno,
           it-ename,
           it-sal,
           it-deptno.
    HIDE:  it-empno,it-deptno.
  ENDLOOP.

AT LINE-SELECTION.
  GET CURSOR FIELD field_name VALUE field_value.

  CASE field_name.
    WHEN 'IT-EMPNO'.
      WINDOW STARTING AT 10  50
             ENDING   AT 20  50.
      WRITE:  field_value.
    WHEN 'IT-DEPTNO'.
      WINDOW STARTING AT 10  50
             ENDING   AT 20  50.
      WRITE: /  field_value.
  ENDCASE.