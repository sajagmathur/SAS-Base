/* SAS Programs:
- Data Step: Perform Operations on Data, put data into tables, fix errors in data, combine, manipulate data etc.
- Proc Step:Process Data --> Analyze, Generate Statistics, Summarize, Create Reports

*/

/*Data Step */
/*work is the default library --> sashelp cars gets set to autos*/
data work.Autos;
	set sashelp.Cars;
run;
/*After each statement, there is a run statment --> Tells sas to run tht step */


/*Proc Step */
/*Proc Print- List the data defined by autos */
proc print data = work.Autos;
run;


/*Running SAS Program:
- Use F3
- Select part of program and run run
- Each step should have a run statement
- Each command is followed by a semicolon
- Logs has the summary
- To run one step at a time, highlight the part you need to run and click F3.
*/