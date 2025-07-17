/*
Go to my libraries and expand it.
-- See autoexec file
Syntax libname myprj1 [name] [location];

Permananent Library: Comes inbuilt into SAS. Eg. SASHELP. Helps your practice your programming bu using its datasets. Eg. SASHELP.CARS

SASUSER: To store and access sas datasets durihng sas session
Webwork: Default library in interactive mode
Work: Default library in non interactive mode --> Temporary library. Once the session ends, SAS will delete the work library and its contents
Create library by right clicking, New Library --> Give Libref, Path

Export: to export sashelp.cars dataset 
Properties: Shows Path, Engine, Name 
*/


libname lib1 "/home/u47497250/0.SASSkillSoft -- SAS Interface";
