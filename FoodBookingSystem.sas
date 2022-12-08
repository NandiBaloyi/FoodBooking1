/* Generated Code (IMPORT) */
/* Source File: food_booking.csv */
/* Source Path: /home/u62791621/Myfiles */
/* Code generated on: 05/12/2022 13:41 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u62791621/Myfiles/food_booking.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

Data FoodBooking; *Renaming data to/;
	set import; * old dataset name/;
run;

* Assigning  Libref ;
libname Myfiles "/home/u62791621/Myfiles";

*Save it as a sas document in my folder/;
Data Myfiles.FoodBooking; *moving data to/;
	set FoodBooking; * old dataset name/;
run;

*Time Formatting /;
data  NewFoodBooking;
 set Myfiles.FoodBooking;
 format Order_Time hhmm.;
Run;

*Renaming My dataset after Formating and saving it to my folder;
Data Myfiles.NewFoodBooking; *moving data to/;
	set NewFoodBooking; * old dataset name/;
run;

*Number of Unique Variables;
proc sql;
select count(distinct Item_Name) as NumOfItems
from myfiles.newfoodbooking;
run;

proc sql;
select count(distinct Order_Number) as NumOfOrderNo
from myfiles.newfoodbooking;
run;

*Checking for unique items;
proc freq data = myfiles.newfoodbooking;
table Item_Name;
run;

*Search for Order Number 16106 Items ;
proc print data = NewFoodBooking;
where Order_Number = 16106;
run;

*Printing Bottle Coke Item;
Proc print data = NewFoodBooking;
where Item_Name = 'Bottle Coke';
run;

*Deleting Bottle Coke Item/s;
data DeleteItem;
 set Myfiles.newfoodbooking;
 if  Item_Name= 'Bottle Coke' THEN DELETE;
 run;
 
 *Updating;
data UpdatingM;
   set  Myfiles.newfoodbooking;
   if Item_Name = 'Plain Rice' then Item_Name = 'Rice';
run;
 
data test;
set Myfiles.newfoodbooking;

*Cheching items that starting with chicken /;
data checking;
set myfiles.newfoodbooking;
Orders15=prxmatch("/^v/",Year);
run;

*Orders made in 2015; 
data Year2015;
 set myfiles.newfoodbooking;
 where Years = 2015;
 run;

*Items bought in bulks/;
data ItemsBought;
set myfiles.newfoodbooking;
where quantity > 10;
run;

*Which Items where bought in 50/;
data ItemsBought50;
set myfiles.newfoodbooking;
where quantity = 51;
run;

*Quantity 32 ;
data ItemsBought50;
set myfiles.newfoodbooking;
where quantity = 32;
run;

