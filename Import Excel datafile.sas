proc import datafile = "/home/u47497250/8. Import Datafile/excel_data.xlsx"
            out = newdataset
            dbms = xlsx
            replace;
run;

* Don't get headers;
proc import datafile = "/home/u47497250/8. Import Datafile/excel_data.xlsx"
            out = newdataset1
            dbms = xlsx
            replace;
getnames=no;          
run;

*get sheet name;

proc import datafile = "/home/u47497250/8. Import Datafile/excel_data.xlsx"
            out = newdataset2
            dbms = xlsx
            replace;
            sheet="name_class";        
run;

* get sheet range;


proc import datafile = "/home/u47497250/8. Import Datafile/excel_data.xlsx"
            out = newdataset3
            dbms = xlsx
            replace;
            range = "name_class$A1:B6";        
run;




