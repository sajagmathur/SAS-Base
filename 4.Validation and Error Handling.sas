/*Validation of data:
	1. Proc Print: 
		Used to validate data.
		It produces a listing of the data
		Use with:
			Var: to define included variables
			Where: To filter observations
	2. Proc Freq:
		Produces a frequency table
		Tables Statement: Specify variables included within the frequency table
		Nlevels: Shows number of distinct values
		Used to detect invalid character / numeric values as well as duplicate values
		
	3. Proc Means:
		Produces descriptive characterstics
		N - Number of non missing values, NMISS - Number of missing values, MIN, MAX - Minimum & Maximum Values
		Use with var to identify number of variables to be analyzed
		Detects numeric anamolies in the data
		
	4. Proc Univariate:
		Produces a summary report with descriptive statistics
		Use with VAR to specify variables you want to analyze
		Used to detect extremes, missing values

Cleaning of Data:
	1. Fix the source data outside sas:
		No problem at all.
		
	2. Viewtable (Windowing Version)
		Provides a tabular interface like excel to change the values of the data manually.
	
	3. Data Step:
		*Manually assign values
			Example: age = 33
				 	country_code = upcase(country_code);
		*Conditional Statements
			Example: if title_id=12345 then salary = 120000;
*/

