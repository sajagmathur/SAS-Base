/*Helps in overriding the default way in which sas functions:
	- First statement: 
		-It selects the column drivetrain and if the drivetrain is all, it outputs finalcars dataset
		-If it is not 'all', it outputs other
		- Otherwise statement is optional, if you remove it, it will simply create finalcars and not other (See Step 3)
	
	- Second Statement:
		- If the drivetrain statement is All, it outputs finalcars
		- If its not all then it outputs other

Note: All statements that are there in output statement should also be there in data step statement

What happens if the dataset name is not mentioned in the output clause:
	- It outputs to all the datasets
*/

data finalcars other;
set sashelp.cars;
	select(drivetrain);
	when('All') output finalcars;
	otherwise output other;
	end;
run;


data finalcars other;
set sashelp.cars;
	If drivetrain = 'All' then
		output finalcars;
run;

/*Step 3*/
data finalcars other;
set sashelp.cars;
	select(drivetrain);
	when('All') output finalcars;
	otherwise;
	end;
run;