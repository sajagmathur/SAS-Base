data importfromcsv;
infile "/home/u47497250/2. Import csv data/DATA_commas.csv" dsd;
input name $ gender $ age income;
run;

proc print data = importfromcsv;
run;