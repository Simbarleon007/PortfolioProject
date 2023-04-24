CREATE DATABASE example;
-- You use the 'CREATE DATABASE' command to create new database. For example,
-- the query above will create a new database called 'example', which we can then
-- use to store our data and perform further querying.

DROP DATABASE example;
-- The 'DROP DATABASE' will delete a specified database we have on our server.
-- In this case the 'example' database.

USE mydbl;
-- 'USE' command is used to specify the database you want to use,
-- in this case 'mydbl', before starting any query actions in mysql, you have to
-- specify this or you would get an error message if you try to
-- perform any commands, because mysql wouldnt know where to look for your tables.

SHOW TABLES;
-- The 'SHOW TABLES' command is used to display the tables in the database you have
-- chosen.

SELECT * FROM school;
-- The 'SELECT, command is used to return data in the database you have slected.
-- You use it with the 'FROM' command to specify the table in the database you
-- want to draw your data from. Just between the SELECT and FROM commands is where
-- where you specify if you want to return all the columns in the table or you want to 
-- return a particular column. To return all the columns in a particular table you use
-- the * sign; to select a specified column, you call out its name in place of the * signal.
-- The SELECT and FROM commands are also use with other Commands like 'WHERE' to filter the
-- data we want returned, and probably more as I'm just starting to know SQL commands and
-- their use.

CREATE TABLE more_examples (no int(3), type_of_ecample varchar(30));
-- Just like how you use CREATE to create a database, you also use it to create new tables
-- in your database. But when creating a new table you must add at least a column in the
-- table we want to create. In the examole above, we have created to data fields; 'no' and
-- 'type_of_ecample'. Another important to remember is that when creating new datafields/columns,
-- we have to specify the data type we want inside those fields. In the above example, we have
-- the interger (int) in our first data field and we further specified the number of values we
-- want in this fields and in this case (3). In the second column/data field we've added the 
-- data type 'varchar' specifying that the particular field will contain characters. There are other 
-- types of data types, we can go do further research on them later.

DROP TABLE more_examples;
-- Just like how we dropped the database we created in previous example, we can also use the 
-- DROP command to drop tables we no longer have a use for in our database, but in the place
-- DATABASE in our previous example, we substitute it for TABLES, just like the example in the 
-- query here, and also specifying the table we want to drop. The 'DROP TABLE' is one of three
-- ways to remove a table from a database, two others being 'TRUNCATE(add more info)' and 'DELETE FROM'
-- commands, all having specific implications.

-- ADDING NEW OBSERVATIONS/ROW TO OUR TABLE.
INSERT INTO school VALUES (9, 'Obadare Francis', 92);
-- The 'INSERT INTO' command is used to add new rows/observations into our existing table. There
-- are two methods of using the 'INSERT INTO' command to our table, the above method will add the 
-- data in the order we have specified it when creating our table. Then we follow up with the name
-- of the table we want to add the new observations into, in our case 'school'. After that, we follow
-- up with the VALUES command signifying the observations in a column just like in the above query.
-- The second method starts with the INSERT INTO command, but it follows with a method to

--                               FILTERING

-- FILTERING WITH ARITHMETIC OPERATORS
SELECT marks FROM school WHERE marks = 92;
-- So we have database containing the results of a national exam for students in the secondary level
-- and we want to know how many people scored 92 in the exam. What we want to do here is to filter 
-- our data, and in SQL we do this with the 'WHERE' command in additionn with the 'SELECT & FROM' commands.
-- We can use the WHERE command with a bunch of other operators like the Arithmetric Operators ('=' this
-- returns exact matches; '>' this returns results greater than the value we have specified after the 
-- sign; '<' this returns results lesser than the value we have specified after the sign; '>=' this
-- returns values greater than or equals to the value we have specified after the sign; '<=' this
-- returns values less than or equals to the value we have specified after the sign; '<>' this returns
-- values not equal to the value we have specified after the sign.

-- FILTERING WITH PATTERN MATCHING OPERATORS/WILDCARDS
-- The Pattern Matching Operators we have include:
-- '%' -> This means many characters
-- '_' This means one character and it can also be used with the '%' operator.
-- In other to use the Pattern Matching Operators to filter our data we need to add the LIKE command, the LIKE
-- command plus the operators work together to perform the Pattern Matching Operation.

SELECT * FROM school WHERE students_name Like ('%c');
-- This above query will filter our data to retreive data in the 'students_name' column that ends with the 
-- character 'c'. NOTE: The brackets surrounding the '%c' isn't neccessary, it works without it too.

SELECT * FROM school WHERE students_name Like ('c%');
-- This above query returns data starting with the 'c' character.

SELECT * FROM school WHERE students_name Like ('%c%');
-- This query returns data that has the character 'c' at any position in the string of characters.

select * from school
 where students_name like ('%paul%')
 and marks = 95;
-- The above query returns students name that has paul in it.
-- The '%' surrounding paul simply means many characters, and
-- it simply tells mysql to go through the data in the Students_name
-- field/column and look for names that has Paul in it.

SELECT * FROM school WHERE students_name Like ('c_');
-- The '_' works diffrent to the '%' operator as it only works with only one character. This above
-- query will only return a value if there is a student's name starting with the character 'c' and ending
-- with any other character.

SELECT * FROM school WHERE students_name Like ('_c');
-- This above query will only return a value if there is a student's name ending with the character 'c' 
-- and starting with any other character.

SELECT * FROM school WHERE students_name Like '_a%';
-- Just like we said previously, we can use the two operators togther. This particular example simply translates
-- as : Hey MySql go through all the data in the 'students_name' column of my 'school' table and help me
-- return all values that start with any character but followed by the character 'a' and can have any more
-- character after that.

SELECT * FROM school WHERE students_name Like 'paul %';
-- So in our 'students_name' column we have the full name of each students in this field, so we've been instructed
-- to retreive all data on students with the first name 'Paul'. The above query will assist on drawing this data.

INSERT INTO school VALUES(12, 'Paul-john Trevor', 93);
-- In other to fully demonstrate the above example, we added a new observation with the student having his first
-- name to be 'Paul-john', and after pulling the data, it only queried data with the first name Paul since we 
-- specified the delimeter 'space' just before the many (%) operator. If we remove the delimeter, the queried 
-- data will include the newly created 'Paul-john' observation.

ALTER TABLE school MODIFY COLUMN students_name VARCHAR(20);
-- In our attempt to add new observations to our school table, we got a prompt saying character in our new 
-- observation for the students_name field is more than the specified value for characters in the field. so,
-- using the ALTER TABLE plus MODIFY COLUMN  command we modified the field to take more characters. Just has
-- seen above.

-- FILTERING WITH BETWEEN & IN

SELECT * FROM school WHERE marks BETWEEN 84 AND 96;
-- So, we have a table that has the marks of students and we want return the students that scored in the
-- range 85:95, we do this with the above query. The 'BETWEEN' commands will populate data from one point 
-- to another. The other point is signified with the 'AND' command.

SELECT *FROM school WHERE marks IN (84, 92, 96);
-- So we have specific marks we are looking for, in other to call all that specific data we use the command
-- IN. This wll tell MySQL to go through the data and select those data wherever it sees one matching that
-- record.

-- FILTERING WITH LOGICAL OPERATORS

SELECT * FROM school WHERE marks = 84 or marks = 92 or marks = 96;
-- In the above query where we used the IN command to specify the the data we want, the OR operator is a longer
-- version of this since we will have to repeat this operator as well as the column field. But it works to. It can
-- can be applied other queries. The OR query simply tells MySQL to go through the data and select any of the
-- matching the values we have signified. It will execute as long as any of the requirements are met.

SELECT * FROM school WHERE students_name = 'john paul' AND marks = 95;
-- In an experiment to understand how the AND & OR operator works, I used the AND operator to try and return two
-- diffrent values from the same column, and it didnt return any values, but when I tried it with two seperate columns,
-- it returned a value that met the reqirements specified in the query argument.

SELECT * FROM school WHERE marks = 92 OR marks = 95;
-- But the OR operator worked perfectly for this.

SELECT * FROM school WHERE NOT marks = 95;
-- The NOT  operator on the other hand will look through the data and draw all data except from the values matching
-- the specified argument.

-- NOTE: Even though I have only used intergers in my above examples, the LOGICAL OPERATORS work on all data types.

set Autocommit =0;
SET SQL_SAFE_UPDATEs = 0;
DESCRIBE school;
-- The 'DESCRIBE' command is used to describe the datatype in the fields/columns we have in our data. This is very
-- useful when we are trying to add a new field into our table but we don't know what kinf of data are specified
-- in this field.

ALTER TABLE school RENAME COLUMN Students TO students_name;
-- So, one of the few things really emphasized on in Data Analytics is to always have our field name be indicative
-- of the data we want to store in it. We looked through our table and we see that the name SCHOOL doesn't indi-
-- cate the data we've stored in the field, so, we want it changed. We do this by using the ALTER TABLE plus RENAME
-- COLUMN  command. We specify the name of the field and use 'TO' to point to the new name we want our table to be
-- called.

RENAME TABLE SS3C_2015_2016_Results TO SS3C_Results;
-- Unlike when we want to rename a column where we first use the 'ALTER TABLE' here we simply use the RENAME plus 
-- TABLE to rename the table. The TO is constant sincce its pointing to the new table name

TRUNCATE TABLE SS3C_2015_2016_Results;
-- Previously, we talked about the 'DROP TABLE' that removes a table from a database. TRUNCATE also removes data
-- from a database but unlike DROP TABLE it retains the table structure. NOTE: We can also remove the TABLE after
-- the TRUNCATE and the query will still work.

DELETE FROM SS3C_Results;
-- This work just like the TRUNCATE command but unlike the TRUNCATE  command it allows for data rollback using 
-- the 'ROLLBACK;' command (even though I tried it previously and indeed confirmed that it works, it suddenly
-- didnt work when writing this command. I will make more research and correct this).

ROLLBACK;
-- This is for rolling back data that was removed using the DELETE command.

-- JOINS
/*
 Joins are exactly what they sound like, they are used to join tables. This tables can be 
in diffrent databases. As long as it is specified when writing the query there should be no
issue executing the query. There four types of join that I know of, they are:
 FULL OUTER JOIN - This joins all tables regardless of whether there are null values or not
 INNER JOIN - This joins tables that meets the same criteria and then return their results.
 LEFT OUTER JOIN - This joins every records on the left table, based on the unique key, with 
					overlapping data from the right table. The left table will be the first
                    table that we use while the right table will be the second table that we 
                    use.
RIGHT OUTER JOIN - This is the opposite of LEFT OUTER JOIN.
*/

SELECT  * 
from employee.employeedemographics
inner join employeesalary
on employeedemographics.employeeid = 
	employeesalary.employeeid
		join employeeperformance
			on employeedemographics.employeeid=
				employeeperformance.employeeid
					join employeestatus
						on employeedemographics.employeeid=
							employeestatus.employeeid
								;

/* UNIONS
Unions just like joins are used to combine two tables into one, but unlike JOINS, which typically use a UNIQUE column
to join two tables and ultimately creating new columns in the new table to store the results of the join clause the UNION 
combines two two tables into the same columns and also get rids of duplicates as it carries out its work. This doesn't create 
new fields just like the joins does but new records instead. The UNION ALL will return all results and not leave out duplicates.
One thing note remembering is that unions will work as long as the DATATYPES of the first table matches the second table regardless
of whether they hold the similar data. We want to always make sure that columns match before performing the UNION query. The UNION
clause is placed in between two SELECT clause.
*/
select employeeid, age
from employeedemographics
union
select employeeid, salary
from employeesalary;


/*
CASE STATEMENTS
The case statements allows users to specify conditions and also specify what you want returned when that condition is met.
The CASE statement consist of four main clauses: CASE, WHEN, THEN, ELSE and END. The CASE clause is what you use to start
your statement and the WHEN clause is used to state the parameters you want to check for, and the THEN clause to specify
what you want returned as a definition of that result. The ELSE clause is use to return something else if the WHEN clause
is not met. There can be more than one THEN clause.
*/

select employeeid, firstname, age,
case
	when age >=30 then 'old'
    when age between 21 and 25 then 'young adult'
    else 'adult'
end as seniority_status
from employeedemographics;

use employee;
select jobtitle, max(salary)
from employeesalary
group by jobtitle
having max(salary)

;


