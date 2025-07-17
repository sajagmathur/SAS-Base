/* Length statemnt helps you define the length of a variable in sas
Make sure you use length statement before you set the dataset.
PDV - Program Data Vector: Spacing of memory will be given to make first, then to anything else. Thats why choose length statement before. 
Important: Length statement tells sas how to store names. SO if you type them uppercase or lowercase, that is how they would be stored.
 */

data cars1;
	length make $ 40.;
	Set sashelp.cars;
run;