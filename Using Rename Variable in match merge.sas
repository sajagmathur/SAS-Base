/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/43. Using Rename option in Match Merge/score_data_id_partial_score4_genderNA.xlsx" out = scoredata_p_na dbms = xlsx replace;
run;

/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/37. One to One Merge/score_data_id.xlsx" out = scoredata dbms = xlsx replace;
run;

/* sort data score data p */
proc sort data= scoredata_p_na;
by stu_id;
run;

/* sort data score data */
proc sort data= scoredata;
by stu_id;
run;

/* match merge data */
data mma;
merge scoredata scoredata_p_na;
by stu_id;
run;

proc print data = mma;
title 'Match Merge Data in ascending order';
run;


proc print data = scoredata_p_na;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;

/* match merge data with rename*/
data mma;
merge scoredata scoredata_p_na (rename= (gender=gender_na));
by stu_id;
run;

proc print data = mma;
title 'Match Merge Data in ascending order';
run;


proc print data = scoredata_p_na;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;

