/* One to One Merge */
/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/Exercise 10/score_data_id_class.xlsx" out = scoredata0 dbms = xlsx replace;
run;


/* print out scoredata0 */
/* gives out all the variables and all the observations */
proc print data = scoredata0;
run;

/* labelling the observation column */
proc print data = scoredata0 obs="Observation Number";
run;

/* Suppressing the obsedrvation coumn */
proc print data = scoredata0 noobs;
run;

/* emphasise the variable with id statement, obs is removed without the need of noobs */
proc print data = scoredata0;
/* ID name; the report emphasises student name */
run;

/* sort by name using proc sort procedure */
/* if you do not specify the output dataset, the proc sort procedure permananetly changes the input */
proc sort data= scoredata0;
by name;
run;

/* print sorted data */

proc print data= scoredata0;
id name;
run;

/* use var statement to only include few variables */
proc print data= scoredata0;
var score1 gender ;
id name;
run;

/* selecting values with where statement */
proc print data= scoredata0;
var name score1 gender class;
id name;
where gender ='m' and class in ('a', 'c') ;
run;
