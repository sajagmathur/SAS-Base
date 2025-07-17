/*User Defined Formats--
Used in two steps:
1. Build a user defined format
2. Apply it to a dataset

Step1: Building a User Defined Format
	- Use Proc Format
	- To write a format use value keyword then type format name
	
	Character Formats:
	- $ --> Used in case of character values
	- regionfmt (Format Name) - Cannot be more than 256 characters, should start with letter or underscore
	- Character Value: Should have discrete Values --> These values can have labels --> 'AU'='Australia'
	  Labels can have a huge length. Thus, australia is a legal label
	- other --> Keyword that tells sas that any other value in this format that doesn't have the discrete values
	  should be transformed as the label name Incorrect Region Code
	  
	Numeric Formats:
	- Can work on discrete values, ranges and list of values
	- No dollar needed in format name. Name should start with letter / underscore. It cannot end in a number
	  It cannot be the name of an existing sas format and it should not end with a period (.).

Step2: Apply format:
format [Variable Name] [FormatName];
Example: format Region $regionfmt.;
*/


/* Step 1 */
proc format;
	value $regionfmt 'AU'='Australia'
					 'UK'='United Kingdom'
					 other = 'Incorrect Region Code';
					 
	value salespref low-4999 = 'Needs Improvement'
					5000-7499 = 'Good'
					7500-high = 'Excellent';
/* Other way to write this 

Way1: (< symbol excludes value from ranges. Here 5000,8000,7999 are excluded):
value salespref 0-<5000 = 'Needs Improvement'
					5000-<8000 = 'Good'
					7999<-10000 = 'Excellent';
Way2: Replace lowest by low and highest by high if we don't want to specify highest and lowest values.
value salespref low-<5000 = 'Needs Improvement'
					5000-<8000 = 'Good'
					7999<-high = 'Excellent';
*/
run;


data ds1;
Set sashelp.cars;
run;

proc print data=ds1 label noobs;
format MSRP salespref.;
run;
