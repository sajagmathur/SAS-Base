/*Data Manipulation*/
/*1.  Converting Values between Data Types
	- Implicit Conversion: SAS will try to convert on its own
	- Eg. If numeric is used in catx it will convert to char
	- To explicitly convert:
		- Input - Convert to Integer
		- Put - Convert to Character
	- In where operation, SAS cannot automatically perform conversions. Thus, you should always convert.
	- Where clause operator requires similar results.
	- While converting for where, make sure the width is same

2. Putlog - Gives us a flexibility to give error where there is an error
	- putlog 'Message in quotes'
	- if you put ERROR: then you get error in red`
	- If you put WARNING: then you get warning in green
	- If you want to set _ERROR_ as 1, then you need to 

3. Debugging logic errors:
	- SAS looks for 4 types of error:
		- SYNTAX Errors: when you write syntax wrong
		- Sementic Error: Statement is sementically correct, but the structure of the statement is incorrect
		- Execution Time Error: Compile statements are applied to data values. Eg. Div0 error
		- Data Error: Statement correct, data not valid
		- Logic Error: Statements and data is fine, logic is flawed. These do not get pointed out by SAS.
		How to Debug?
			By reviewing data manually
			
4. 
*/


data prj1;
set sashelp.cars;
charactered = put(Cylinders,$5.);
numefied = input(charactered,5.);


run;


/* 2. Debugging with putlog

*/

data putlogged;
set sashelp.cars;
If Enginesize <3 then 
	do;
		putlog 'ERROR: You are an idiot and equals ' Enginesize;
	end;
run;
