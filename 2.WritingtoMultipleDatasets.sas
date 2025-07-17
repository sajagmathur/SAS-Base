/*Write to multiple datasets using output statement 

Using IF Expression: 
 - Use output statement to write to multiple datasets just like below
 - If i use cars3, it writes to cars3 since only rear is left and leaves other blank
 - If i don't use cars3, it writes to rear :) Magnificent, isn't it


Using Select Expression (Select is eqv to if):
	- use when statements to write it out

*/

data cars1 cars2 cars3 other;
Set sashelp.cars;
	if drivetrain="All" then
		output cars1;
	else if drivetrain = "Front" then 
		output cars2;
/* 	else if drivetrain = "Rear" then  */
/* 		output cars3;	 */
	else output other;
run;



data cars1 cars2 cars3 other;
Set sashelp.cars;
	Select (drivetrain);
	when('All') output cars1;
	when('Front') output cars2;
/* 	when('Rear') output cars3; */
	otherwise output other;
	end;
run;