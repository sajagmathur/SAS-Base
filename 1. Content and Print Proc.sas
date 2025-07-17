/*
Components of SAS Datasets:
  - Dataset is a proprietory file format recognized by sas
  - It has data and metadata, procedures and data steps
  - Columns: Called Variables
  - Rows: Called Observations
  - A SAS Dataset contains descriptor and data section:
  	- Descriptor segment has: Name of Dataset, Number of Observations (Rows), Variable Information (Columns): Name, Type, Length
  - To browse the descriptor: Use contents procedure
  		Proc Contentes data = datasetname;
*/

/*Proc contents on sashelp.cars
Copy: Do using windows ctrl+c
Usually there are 3 tables in result: 
	1. Name, Number of Observations, Modified Date, etc.
 	2. Gives operating Environment Information: File Size, Physical File Location etc.
 	3. Alphabetical List of Variables and Attributes: Lists all variables with variable name, type, length, format and label
	4. Since the table is sorted, we have another table that shows the sort information.
	
*/

proc contents data = sashelp.cars;
run;

/* Proc Print on SAShelp.cars

Displays the contents of the data.
	1. By default, all observations are displayed
	2. Character Variables are left aligned, numeric variables are right aligned
	
*/
proc print data = sashelp.cars;
run;