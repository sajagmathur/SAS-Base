/*Create variables using assignment statement:
	1. Just assign using assignment statement in a data step. Eg. age=22
	2. Use conditions to assign
	3. Create values using operators and sas functions
*/


data cars1;
set sashelp.cars;
/*Example 1: Assignment */
age =22;
dage = age*2;
/*Example 2: Conditional*/
if length>180 then dage = age*3;

/*Example 3: Function or Operator*/

sumage = sum(dage,age);

run;

proc print data =cars1;
run;