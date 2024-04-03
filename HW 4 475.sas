proc sql;
select count(grades484.ID) as Total_Num
from grades484, grades550
where grades484.ID = grades550.ID;
quit;
proc sql;
select grades484.ID as ID, grades484.GRADE as GRADE484,
grades550.GRADE as GRADE550
from grades484, grades550
where grades484.ID=grades550.ID;
quit;
proc sql;
select count(grades550.ID) as Total_Num
from grades550, grades695
where grades550.ID = grades695.ID;
quit;
proc sql;
select grades550.ID as ID, grades550.GRADE as GRADE550,
grades695.GRADE as GRADE695
from grades550, grades695
where grades550.ID=grades695.ID;
quit;
proc sql;
select count(grades484.ID) as Total_Num
from grades484, grades695
where grades484.ID = grades695.ID;
quit;
proc sql;
select grades484.ID as ID, grades484.GRADE as GRADE484,
grades695.GRADE as GRADE695
from grades484, grades695
where grades484.ID=grades695.ID;
quit;
proc sql;
select count(grades484.ID) as Total_Num
from grades484, grades550, grades695
where grades484.ID = grades550.ID = grades695.ID ;
quit;
proc sql;
select grades484.ID as ID, grades484.GRADE as GRADE484,
grades550.GRADE as GRADE550, grades695.GRADE as GRADE695
from grades484, grades550, grades695
where grades484.ID = grades550.ID = grades695.ID;
quit;

data Ex3;
input Name$;
cards;
Bushra
;
proc print;
run;
%macro Ex3;
%let myname=Bushra Abukarn;
%let mylastname=%scan(&myname,2);
%let i=1;
%let variable=&i+1
%let count=%eval(&i + 1);
title1 "This assignment is completed by Bushra Abukarn on &sysday,
&sysdate";
title2 "&variable=&count";
%put &count;
%mend;
%Ex3;

%macro LLN(n, p);
 call streaminit(445588);
 data bernoullis;
 call streaminit(445588);
 do i = 1 to &n;
 sum + rand("Bernoulli", &p);
 xbar = sum / i;
 output;
 end;
 run;
 symbol interpol = join value = none color = red width = .7;
 title 'Illustration of LLN';
 proc gplot data = bernoullis;
 plot xbar * i / vref = &p;
 run;
%mend;
%LLN(3000, 0.50);

data pets;
input gender $ pet $ 6-15 number;
cards;
boy cockatiel 1
boy turtle 3
boy rabbit 4
girl cockatiel 2
girl turtle 3
girl rabbit 7
;
proc format;
value $genderfmt 'boy'
'girl';
run;
proc format;
value $petfmt
'cockatiel'='C:/Users/bushr/OneDrive/Desktop/cockatiel.jpg'
'turtle'='C:/Users/bushr/OneDrive/Desktop/turtle.jpg'
'rabbit'='C:/Users/bushr/OneDrive/Desktop/rabbit.jpg';
run;
proc tabulate data=pets ;
class gender pet;
classlev gender/s=[foreground=white background=purple just=c];
classlev pet/s=[foreground=white background=green just=c postimage=$petfmt.];
var number;
table gender={s=[foreground=white background=blue just=c]},
pet={s=[foreground=white background=lightpink
just=c]}*number=''*sum=''/box='# of Pets';
title "Number of Cute Pets Owned by Families of 3rd Grades";
run;

data products;
input prodnum 1-4 prodname$ 8-29 manunum 32-35 prodtype$ 38-49 rtlcost
dollar12.;
cards;
5009 Dream Machine 500 Workstation $3,200
4506 Business Machine 450 Workstation $3,345
2101 Travel Laptop 400 Laptop $2,760
2212 Analog Cell Phone 230 Phone $35
4509 Digital Cell Phone 245 Phone $175
5003 Office Phone 560 Phone $145
1110 Spreadsheet Software 134 Software $300
1200 Database Software 113 Software $799
3409 Statistical Software 243 Software $1,899
2102 Wordprocessor Software 245 Software $345
2200 Graphics Software 246 Software $599
;
proc sql;
 insert into products
 values (3480, 'Desktop Computer', 780, 'Workstation', 1799);
 select * from products;
quit;

proc sql;
 update products
 set rtlcost = rtlcost * 1.2
 where prodtype = 'Software';
 update products
 set rtlcost = rtlcost * 0.8
 where prodtype ne 'Software';
 select * from products;
quit;

proc sql;
 title 'Product Information';
 footnote 'UPDATED 2DEC2023';
 select
 *,
 rtlcost format=dollar12.2
 from
 products;
quit;
