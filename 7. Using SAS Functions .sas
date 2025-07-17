/* SAS Functions: 
		How to find the functions?
			- Go to support.sas.com --> Knowledge Base --> Documentation --> Documentation by Title
			  --> SAS 9.4 Functions and Call Routines will have all the functions

Using Functions:
	- Target Variable (Var) is used to store results of functions
	- Var (Function Name) = Function (argument1, argument2, argument3...)
	- If target variable is a new variable: Type and length of the variable will be set to the right variable's type and length
	- If target variable is a previously defined variable, then in case it is different, the value will be truncated

SAS Functions:
	1. Upcase: Converts to Upper Case
	2. Lowcase: Converts to Lower Case

Character String based Functions: 
	1. Substring: Extracts string from and to a particular string (string -- starts from, length of string)
	2. PropCase: Converts to proper case -- first character of word is converted to upcase
	3. Char - Returns the character at a specific point in string. For a position that is negative / 0 it 
		it returns a blank. Larger than length of string -- returns a blank. Else it retuns length of string.
	4. Left and Right - Pretty useless -- left -- removes leading blanks, right - removes trailing blanks

Separating and Concatenating Character Values: 
	1. Trim - trims trailing blanks from character string
	2. Strip - Trims leading and trailing blanks from character strings
	3. Concatenation Operator - Concatenate two strings together -- ||
	4. Scan -- To take out data from a dataset which is separated by delimiters -- Arguments: String, Word Count, Delimiter
		If you don't specify comma, default delimiter is the space
	5. Concatenation Functions:
		i. Cat: Does not remove leading or trailing blanks
		ii. Catt: Removes trailing blanks
		iii. Cats: Strips leading and trailing blanks
		iv. Catx: Strips leading and trailing blanks and inserts a separator
*/

data work.mycars1;
Set sashelp.cars;
ModelFin = upcase(Model);
ModelFin1 = lowcase(Model);
ModelSubstr = substr(Model,1,3);
ModelChar = char(Model,2);
ModelLeft = left(Model);
ModelRight = right(Model);
ModelTrim = trim(Model);
ModelStrip = strip(Model);
ModelScan = scan(Model,1,'.');
Modelcat = cat(Model, Model);
ModelCatt = catt(Model,Model);
ModelCatx= catx(' ',Model,Model);
ModelCats = cats(Model, Model);
Modelcompress = compress(Model,' ');
Modelcompressx = compress(Model,,'d');
substr(Model,1,3) = "Hol";

run;

data xyz;
set sashelp.cars;
ModelFind = Find(Model,'1');
ModelTranwrd = tranwrd(Model,'1','0');
run;


/* Find and Modify Character Values
1. Find: find(string, substring, modifiers) - Searches for a substring and returns the first position of the substring. If it doesn't find it then it returns the value of 0
2. Modifying using Substring: assign something to a part of the string by using substirng as referred above
3. Compress: compress(source, <chars>, <modifiers>) - Removes characters from chars, 
			 If you dont specify chars, it will remove all blanks from source
			 Modifier: You can specify a modifier, eg. d will remove any digits
			 
4. Tranward: Replaces all occurances of a word / character with something else

Descriptive Statistics Functions:
Sum, Min, Max, Mean - YOu know how to use these
*/


/*Truncating Numeric Values:
1. Round: Rounds to the nearest integer.
2. Int: Calculates integer part
3. Floor: Calculates floor
4. Ceil: Calculates ceiling
*/

data work.mycarsfinal ;
set sashelp.cars (keep = enginesize);
enginerounded = round(enginesize);
engineint = int(enginesize);
enginefloor = floor(enginesize);
engineceil = ceil(enginesize);
run;





