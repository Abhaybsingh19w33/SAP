1)Create table ZMT _FUZZY
create column table ZMT_FUZZY(
ID integer,
TXT varchar(20));


2) Insert records
insert into ZMT_FUZZY values(1,'hello');
insert into ZMT_FUZZY values(3,'hell');
insert into ZMT_FUZZY values(4,'hel');
insert into ZMT_FUZZY values(5,'ello');
insert into ZMT_FUZZY values(7,'hello world');
insert into ZMT_FUZZY values(8,'hell world');
insert into ZMT_FUZZY values(14,'helloworld');
insert into ZMT_FUZZY values(15,'hellworld');
insert into ZMT_FUZZY values(16,'HelloWorld');
insert into ZMT_FUZZY values(17,'HELLO');
insert into ZMT_FUZZY values(21,'world');
insert into ZMT_FUZZY values(22,'word');


3) write sql query

SELECT  * FROM ZMT_FUZZY

SELECT  * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(1.0))

SELECT  * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.8))


SELECT  * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.3))

SELECT SCORE() AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello')
ORDER BY score DESC;


SELECT SCORE() AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(1.0))
ORDER BY score DESC;

SELECT SCORE() AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(1.0))
ORDER BY score DESC;

SELECT SCORE() AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.8))
ORDER BY score DESC;

to_decimal (Score(),3,2) means 3 digits  out of which two will be the decimal value.
SELECT TO_DECIMAL(SCORE(),3,2) AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.8))
ORDER BY score DESC;


SELECT TO_DECIMAL(SCORE(),3,2) AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.8))
ORDER BY score DESC;

4) SELECT TO_DECIMAL(SCORE(),3,2) AS score, * FROM ZMT_FUZZY
WHERE CONTAINS(txt, 'Hello', FUZZY(0.3))
ORDER BY score DESC;


As the  fuzzy score changes,notice the  output in 3 and 4. 

Score 0 is  Least match
Score 1 is Exact Match