/* One to One Merge */
/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/42. Types of Merge/score_data_id_gender_only.xlsx" out = scoredata_g dbms = xlsx replace;
run;

/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/42. Types of Merge/score_data_id_no_gender.xlsx" out = scoredata dbms = xlsx replace;
run;

/* sort data score data p */
proc sort data= scoredata_g;
by stu_id;
run;

/* sort data score data */
proc sort data= scoredata;
by stu_id;
run;

/* onetoone*/
data onetoone;
merge scoredata_g scoredata;
by stu_id;
run;

proc print data = onetoone;
title 'Match one to one';
run;


proc print data = scoredata_g;
title "Data with Gender.";
run;


proc print data = scoredata;
title "Score Data.";
run;


/* One to Many Merge */
proc import datafile = "/home/u47497250/42. Types of Merge/score_data_id_gender_only_dup.xlsx" out = scoredata_g_dup dbms = xlsx replace;
run;

/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/42. Types of Merge/score_data_id_no_gender.xlsx" out = scoredata dbms = xlsx replace;
run;

/* sort data score data p */
proc sort data= scoredata_g_dup;
by stu_id;
run;

/* sort data score data */
proc sort data= scoredata;
by stu_id;
run;

/* onetomsny*/
data onetomany;
merge scoredata_g_dup scoredata;
by stu_id;
run;

proc print data = onetomany;
title 'Match one to many';
run;


proc print data = scoredata_g_dup;
title "Data with Gender.";
run;


proc print data = scoredata;
title "Score Data.";
run;
