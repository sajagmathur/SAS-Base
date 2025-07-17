/* Appending and Merging SAS Datasets */

/*1. Appending SAS Datasets:
If dataset1 (Master):
A 1
B 2

dataset2:

C 3
D 4

Result will be the master set (dataset1):
A 1
B 2
C 3
D 4
This will add ds2 to ds 1 and ds1 will be the final.

2. Combining/ Concatinating sas datasets:
If dataset1:
A 1
B 2

dataset2:

C 3
D 4

Result will be a new dataset:
A 1
B 2
C 3
D 4

3. Merging:
Combines observations from 2 datasets
Set 1
A 1
B 2

Set 2
1 Y
2 Z

New Set
A 1 Y
B 1 Z

Merge can happen based on:
 1. Position in the dataset
 2. By one or more common variables (eg. 1 and 2 values in set 1 and set 2)

Examples:
1. Using Append to merge datasets- 
	Proc Append base (master dataset) =ds1 data = ds2;
	run;
	
	This is called like structured appending: If number of columns are same and structure is same
	If the datasets are not alike: 
		1. If we use base as larger dataset, it completes append and give missing to smaller datasets extra columns
 		2. If base is smaller datastet --> Variable was not found on this. Error: No appending was done due to anomalies.
 		
 	Condition of Append to work: Variables in base CANNOT change.
 	
 	For Condition 2: Use of Force option: Appends for common variables and all other become missing.
 	Used when:
 		- data=dataset has more variables than base=dataset
 		- data=dataset has DIFFERENT TYPE/ LONGER LENGTH than base=dataset (LONGER Length leads to truncation, Different type leads to missing value)
 		- data=dataset has DIFFERENT VARIABLES than base=dataset
 	Force option put in comment to understand syntax.

2. Using Set in Data Step to Concatinating datasets:
	data appendeddata;
		Set ds1 ds2;
	run;
	
	Difference from Append: 
		1. Concat creates a new dataset as final whereas append appends to the base.
		2. You will have all the columns, missing values will be marked missing
		3. Compile time error will occur if same variable is not same type in all sas datasets.

3. Using Rename to rename Variable name (rename = original_name new_name)
	- Used when we are concatinating datasets
	- If variables are same but their names are different, you just rename them and concatenate

Merging: 
	1. One to One Merge: 
		- A single observation in one dataset is related to one and only observation in another dataset.
		- Based on the values of one or more selected variables.
		- by statement variables must be common.
		- Datasets must be sorted in the order of the by statements
 
    
   2. One to many merge:
   	- A single observation in one dataset will be matched to more than one observation in other observation.
   	- Based on the values of one or more selected variables.
	- by statement variables must be common.
	- Datasets must be sorted in the order of the by statements
 	- No change in syntax, hence it hs not been listed separately
 	
 	
	3. Merging datasets with non matches
		- Matches when the matches are *not* found
		- Uses (in=) option
		- If ds1 contributed to merged dataset then in=inemps is set to one else 0. Simlar for ds2.
		- By using if =1 you can choose which dataset needs to contribute
 */

data cars1;
	Set sashelp.cars;
run;

data cars2;
	Set sashelp.cars;
run;

/*1. Append to merge datasets*/
Proc append base=cars2 data = cars1; *force;
run;

/*2. Set to combine datasets */
data concatds;
Set sashelp.cars work.cars1;
run;

/*3. Rename option */


data renamedcars (rename = (Make=CarMake));
Set sashelp.cars;
run;


/*Merging - 1. One to one merge */

Proc sort data = work.cars1;
by make;
run;


Proc sort data = work.cars2;
by make;
run;
data mergedonetoone;
merge work.cars1 work.cars2;
by make;
run;

/*2. Not Merge */


Proc sort data = work.cars1;
by make;
run;


Proc sort data = work.cars2;
by make;
run;

data mergednot;
merge work.cars1(in=inmakea) work.cars2(in=inmakeb);
by make;
if inmakea=1 and inmakeb=1;
run;