/*
SAS processes data in data sets that may come from:
	- Raw Data File (Delimited)
	- Another SAS Data Set
	- MS Excel File

* For All inputs, we convert to sas dataset using a data step. Data step runs in two parts -- compilation and execution

Infile: statement is used for raw datafile. eg. csv
Set: Used to read sas as input

Data Statement:

-- Dataset name have a libref.datasetname. End data statement with semicolons
-- If you only mention fwd_autos: This is a one level name
-- If there is a permanenet library, use two level name
-- Where: puts a condition on what data you want to bring
-- Data step ends with run statement
-- You would need to print data using proc print

Using Set statement:
-- Set is used to read observations from different dataset
-- You have already used this down here
-- Set can also be used to read from multiple datasets

Using Where Statement:
- Subsets observations

Drop and Keep Variables:
*/

data work.fwd_auotos;
set sashelp.cars;
where drivetrain = "Front";
run;



/*
Drop and keep statements:
- Without these statements, sas keeps every single observation
- Drop: Used to drop certain number of variables into the code
How to use? 
	After conditionals, use drop mpg_city mpg_highway to drop these variables
	Separate them by space
	End by semicolon
- Specify keep instead of drop to keep specific variables
- Use Keep statement instead of drop statement
Note: Drop and keep have not impact on input dataset
*/
data work.autos;
set sashelp.cars;
where origin = "Europe" and MSRP >80000;
keep make model type msrp;
run;


proc print data = autos;
run;


/*
Label Statement:
- Can be used in a proc step or a data step
- If you use in proc step, it wouold be a temporary label
- If you use in a data step, it would be a permanent label
- A label property will get assigned.
- To use in proc print, you use the label option and then specify the label. If you specify the label using label option,
It will give that in output. Basically, in label option, it will use labels. Without label option, it wont print labels but names.

*/


data work.label_autos;
set sashelp.cars;
where origin = "Europe" and MSRP >80000;
keep make model type msrp;
label type = 'Style' msrp  = 'Price';
run;


proc print data = label_autos label;
label msrp = 'Retail Price';
run;