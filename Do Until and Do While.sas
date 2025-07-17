/* Do Until */
data invest;
capital = 0;
 do until(capital>=50000);
 	 capital = capital + 2000;
 	 capital = capital*(1.1);
 	 year+1;
 end;
run;

proc print data = invest;

 


/* Do While */
data invest1;
capital = 0;
 do while(capita>=50000);
 	 capital = capital + 2000;
 	 capital = capital*(1.1);
 	 year+1;
 end;
run;

proc print data = invest1;

/* Do until with normal iteration */
data invest2 (drop=counter);
capital = 0;
 do counter = 1 to 10 until(capital>=50000);
 	 capital = capital + 2000;
 	 capital = capital*(1.1);
 	 year+1;
 end;
run;

proc print data = invest2;

