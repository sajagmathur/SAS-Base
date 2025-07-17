data otherdelimiter;
infile "/home/u47497250/3. Import from any other delimiter/other_del_data.txt" dsd dlm = ":";
input name $ gender $ age income;
run;

proc print data= otherdelimiter;
run;