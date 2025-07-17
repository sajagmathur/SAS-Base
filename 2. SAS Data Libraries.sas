/*
Data Libraries are collection of files kept as unit. They can be files/ directory on a server
	- Analogous to folder. A library can contain files and folders of files.
	- Libref is used to reference a library
	- At startup, SAS creates one temporary and atleast one permanent libref
	- Work: Temporary Library
	- SASUSER: Permanent Library
	* Temporary Library - Any datasets created in this are destroyed when session ends
	* Permanent - Not destroyed this way, maintains the data even after the session is over

User Defined Library:
	Create libref with libname
	
	libname libref 'data library location' Options;
	libref - 1-8 Characters, begins with letter or _, 
	Options: Read Only, etc.
	*Note: Libref is a global statement. You do not need to use run statement with it. You can use global statements anywhere in a program.

Browse SAS Library -->
	- Navigation Pane --> Libraries --> My Libraries --> You can see all of the created datasets in this
	- Double click any dataset to open it


*/

/*
When you run proc contents on all. It gives the variables for each dataset.
	- To remove descriptor, type nods
*/
proc contents data = sashelp._all_ nods;
run;


