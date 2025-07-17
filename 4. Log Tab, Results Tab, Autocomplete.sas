data myprj2.usautos;
	set sashelp.cars;
	where origin = "USA";
run;

proc print data = myprj2.usautos;
run;

da

/*
Gives the errors, warnings and notes associated with the program.
 - Syntax error in where clause: If you remove semicolon, it gives an error.
 - my_autos replaced by usautos in line 6
 
 Go to Logs:
  - Read out errors
  - Save to disk by using save log as --> It will create a .log file
  - Download this as an html file
  - Open in new browser tab
  - Maximize it 
 
 Autocomplete: 
 - Provides you with information relating to what needs to be filled in --> You can view syntax, inforamtion, product documentation, samples and sas notes, proc statement
*/