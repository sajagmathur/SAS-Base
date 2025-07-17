Data stu_name;
input stu_name $ math_score;
* datalines are inbuilt within sas;
Datalines;
Speedy 90
Tim 91
;
run;

proc print data= stu_name;
run;

