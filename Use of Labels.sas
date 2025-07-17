*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

Data scoredata1;
Set scoredata0;

	label score1 = "Maths Score"
		  score2 = "Science Score"
		  score2 = "English Score";
		  
run;

proc print data = scoredata1 label;
run;

*Use of label within proc print;

proc print data = scoredata1 label;
	label name= "Student Name";
run;


* use label option;

proc means data = scoredata1;
var score1;
run;

*Use Label with Split;

proc print data = scoredata1 label split= "*";
	label name= "Student * Name";
run;

