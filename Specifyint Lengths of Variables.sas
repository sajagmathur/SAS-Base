*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
SET scoredata0;
	If gender = 'm' then gender_full = 'Male';
	Else if gender ='f' then gender_full = 'Female';
	Else gender_full = 'Missing';
run;

data scoredata2;
SET scoredata0;
Length gender_full $10;
	If gender = 'm' then gender_full = 'Male';
	Else if gender ='f' then gender_full = 'Female';
	Else gender_full = 'Missing';
run;

proc print data = scoredata1;
title "Truncated data";
run;

proc print data = scoredata2;
title "Non Truncated data";
run;



