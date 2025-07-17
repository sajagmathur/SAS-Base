* Task 1;

data patient_age;
infile "/home/u47497250/Exercise 1/Patient_HD_age.txt";
input 
@1 Pid 1.
@2 Sdate mmddyy10.
@12 Edate mmddyy10.
@22 age 2.
;
format Sdate mmddyy10.;
format Edate mmddyy10.;
run;


* Task 2;
proc print data= patient_age;
format Sdate date9.;
format Edate date9.;
run;

* Task 3;

libname final "/home/u47497250/Exercise 1";


data final.patient_age1;
infile "/home/u47497250/Exercise 1/Patient_HD_age.txt";
input 
@1 Pid 1.
@2 Sdate mmddyy10.
@12 Edate mmddyy10.
@22 age 2.
;
format Sdate mmddyy10.;
format Edate mmddyy10.;
run;