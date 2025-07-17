/* 1. Do Loop: repeats something for a finite number of instances 
		do <index) from value -- to value <increment - optional>
			SAS Statements
			end;
	     - You can give an item list - can be all character or all numeric values.

	2.  Do while statement: You can give a while statement and sas executes it while the condition is true
		do while (condition);
		sas statements;
		end;
		NO Execution: Do loops are evaluated at the top. 
		Infinite Execution: You may give a condition that is always true.
							Thus, you need to write your statements carefully and not create an infinite loop.
	3. Use conditional clause within an iterative do statement:
	   do i = 1 to 4 while x <y;
	   sas statements;
	   run;
	   
	4. Do until loop in sas:
	   Do until calculates something until that condition is true
	   do until (condition);
	   sas statements;
	   end;
	   SAS finds out value at the bottom of the loop, thus, do until loop always executes atleast once.
	   Just like do while, do until can also be created to execute infinitely. Eg. Create something that never holds true in the condition.
	   
	5.  Nesting: Means do within do. You already know it, you don't need to build examples.
	    Things to keep in mind: 
	    	Use unique index variable for each layer of do loop
	    	Use end statement for each do loop

Proc SQL - Uses sql within sas   
	6. Retrieve data using proc sql:
	proc sql;
		select * from data name
		where
		<additional condition>;
	quit; 
	
	7. Querying using proc sql - you already did it
	8. Join table using proc sql

*/



/*1. Do Loop */
data trials;
set sashelp.cars;
Cyli = Cylinders;
 do i = 1 to 4;
	Cyli = Cyli+Cylinders;
 end;
run;



/* 2. Do while statement */


data trials_1;
set sashelp.cars;
Cyli = Cylinders;
i=1;
 do while(i<3);
	Cyli = Cyli+Cylinders;
	i=i+1;
 end;
run;



/* 3. Do statement (with a conditional clause)*/

data trials_2;
set sashelp.cars;
Cyli = Cylinders;
i=1;
 do i=1 to 30 while(i<40);
	Cyli = Cyli+Cylinders;
	i=i+1;
 end;
run;


/* 4. Do until statement */

data trials_10;
set sashelp.cars;
Cyli = Cylinders;
i=1;
 do until(i>40);
	Cyli = Cyli+Cylinders;
	i=i+1;
 end;
run;

/* 6. Proc SQL */

proc sql;
 select Cylinders, Horsepower from sashelp.cars
 where Cylinders = 4;
quit;


/*8. Do a join in sql*/

/*Step1: create first table*/

proc sql;
create table cars1 as
select model,type,origin from sashelp.cars;
quit;


proc sql;
create table cars2 as
select model, weight,length from sashelp.cars;
quit;


proc sql;
create table table3 as
select cars1.model, type, origin, weight, length from cars1 left join cars2 on cars1.model;
quit;