libname score "/home/u47497250/7. Create permanent datasets using libname";

* Permanent dataset;
Data score.stu_math;
input name $ mathscore;
Datalines;
Sajag 90
Apoorva 25
;
run;

* Temporary dataset;
Data temp_mathstu;
input name $ mathscore;
Datalines;
Sajag 90
Apoorva 25
;
run;
