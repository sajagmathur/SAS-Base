proc sql;
	Select age, height, name from sashelp.classfit;
	Select age, height, name from sashelp.class;
quit;

	/*
	- You open program in SAS studio code tab
	- Autocomplete: Gives you details on how to complete a particular statement.
	Also gives product documentation, Samples and SAS Notes
	- Run Button: Used to run code;
	- Submission History: Gives how many time and at what timestamps the code is run;
	- Save / Save As: Similar to word / Excel
	- Program Summary: Gives summary of program-- Version, Code, Log, Result
	- Add to my snippet: If you have a code the you would like to save for future, add it to my snippets and save it for the future.
	- Print: Print the code
	- Undo / Redo / Cut / Copy Code / Paste -- All functions similar to word.
	- Specify a Line Number Field: You cna specify a Line number here --> Play button takes you to that line
	- xx -- Clears all code
	- Binoculors: Find and Replace *Ctrl+F
	- Format Code: Formats the code for us
	- Maximise view: Maximises the view for us. Exit Maximised view --> Exits the maximised view.
	- Go Interactive: SAS Studio doesn't add any automatically generated code, results are generated in html
					  It appends log to the currently generated log
	  (non iteractive mode) If we run proc sql in first two lines, we get a result set. Then proc sql gets terminated. Not if we run last two lines, we cant run.
	  (interactive mode) We can run.
	*/