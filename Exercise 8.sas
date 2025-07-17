/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/Exercise 8/allscore_miss_text.xlsx" out = scoredata0 dbms = xlsx replace;
run;


data scoredata1 (drop = i);
set scoredata0;

array vars(4) read math science write;
array varsn(4) readn mathn sciencen writen;
Do i=1 to 4;
	If vars(i) = 'missing' Then vars(i) = ' ';
	varsn(i) = input(vars(i),15.);
end;

run;


proc print data = scoredata1;