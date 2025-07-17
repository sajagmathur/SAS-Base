/* Characterstics of array in sas
	- Array should have a single unique name and that name should be different from any variable
	  name in the data
	- All variables grouped in array must be same type:
		Either all character or all numeric
	- Arrays can be one dimentional or multi dimentional
	
How to create array
	Array arrayname[dimensions] <elements> <initial values>;
    SAS determines in case of a * the number of variables by variable names in array elements
    <elements> referes to the elements of array
    <initial values> you can specify initial vlaue of each array element
    All elemets should have same data type






 */



data cars1;
set sashelp.cars;
array a[*] $10. Length;

do i = 1 to dim(a);
	Length1=a[i]*1,5;
end;
run;