data myprj2.exercisedata;
	set sashelp.cars;
	where Origin="USA" and msrp >40000;
run;

proc print data=myprj2.exercisedata;
run;

quit;