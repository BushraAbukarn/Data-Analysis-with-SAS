%macro Final;
%let myname=Bushra Abukarn;
%let mylastname=%scan(&myname,2);
title1 "This Problem 3 part 2 completed by &myname, on &sysday,
&sysdate";
%mend;
%Final;
proc import out=NBA
datafile="C:/Users/bushr/OneDrive/Desktop/NBAroster.csv"
dbms=csv
replace;
getnames=yes;
run;
proc sql;
select season, team_abbreviation, player_name, age, min(player_height)as
MinPlayerHeight from NBA
group by season
having player_height=min(player_height);
quit;
proc sql;
select season, team_abbreviation, player_name, age, max(player_height)as
MaxPlayerHeight from NBA
group by season
having player_height=max(player_height);
quit;
proc sql;
select season, team_abbreviation, player_name, age, min(player_weight)as
MinPlayerWeight from NBA
group by season
having player_weight=min(player_weight);
quit;
proc sql;
select season, team_abbreviation, player_name, age, max(player_weight) as
MaxPlayerWeight from NBA
group by season
having player_weight=max(player_weight);
quit;

data ExamEx1;
input ID $ Group $ Sex $ Age Race $ Visit1 Visit2 Visit3 Visit4;
cards;
01 Tx F 62 W 16.5 13.8 17.7 14.6
02 Cx F 53 H 15.8 13.4 16.7 12.8
03 Cx M 44 H 13.0 13.1 9.5 11.6
04 Cx F 20 H 13.0 13.1 9.5 11.6
05 Tx M 57 B 16.5 13.0 10.5 13.5
06 Tx M 41 W 19.0 . 13.2 15.7
07 Tx F 25 B 15.0 14.9 13.1 12.7
08 Cx F 75 B 16.0 13.0 12.9 12.5
09 Cx F 30 B 12.0 12.4 . 13.5
10 Cx M 42 W 10.0 12.4 11.9 13.8
11 Cx M 42 W 17.5 20.0 14.9 16.0
12 Tx M 42 W 16.3 14.3 14.4 12.2
13 Tx M 52 H 26.0 . . .
14 Cx M 52 B 23.5 18.3 17.1 17.2
15 Tx F 29 W 15.5 16.1 15.5 15.5
16 Tx M 33 W 14.0 15.5 13.1 13.3
17 Tx F 54 B 23.5 19.6 22.5 17.4
18 Cx F 68 H 20.0 19.4 18.5 16.9
19 Tx M 43 W 15.0 . 15.4 14.8
20 Cx F 50 W 15.0 17.0 . 16.6
;
proc means n mean median std min max range MAXDEC= 2;
var age Visit1 Visit2 Visit3 Visit4;
class Group;
run;

data int;
input ID$ GROUP$ BMI_base BMI_3mos BMI_9mos;
BMI_change= BMI_9mos-BMI_base;
cards;
101 int 34.5 33.8 31.1
102 int 30.7 29.6 27.3
103 int 32.0 30.7 27.5
105 int 34.6 33.5 33.3
106 int 37.6 34.9 30.1
107 int 30.2 29.2 28.7
108 int 37.2 36.0 35.1
109 int 35.2 33.3 33.7
111 int 32.3 31.4 29.4
;
data cnt;
input ID$ GROUP$ BMI_base BMI_3mos BMI_9mos;
BMI_change= BMI_9mos-BMI_base;
cards;
401 cnt 33.7 33.4 33.2
402 cnt 31.2 30.1 29.8
404 cnt 30.8 31.1 31.8
406 cnt 29.2 29.0 28.9
408 cnt 27.7 27.3 27.9
409 cnt 33.8 32.9 31.4
;
data concat;
set int cnt;
run;
proc print;
run;

data ExamEx4;
input id $ knee_number preop one_day one_week one_month;
cards;
01 1 0 5 7 10
02 1 0 10 15 15
02 2 3 5 8 10
03 1 0 3 3 3
03 2 0 6 9 9
04 1 0 4 10 10
;
data satisfactionscore (drop= i);
set ExamEx4;
if knee_number = 1;
array x{4} preop one_day one_week one_month;
do visit = 1 to 4;
score= x{visit};
output;
end;
drop knee_number preop one_day one_week one_month;
proc print noobs;
run;

data satisfactionscore (drop= i);
set ExamEx4;
if knee_number = 2;
array x{4} preop one_day one_week one_month;
do visit = 1 to 4;
score= x{visit};
output;
end;
drop knee_number preop one_day one_week one_month;
proc print noobs;
run;

data ExamEx4;
input id $ knee_number preop one_day one_week one_month;
cards;
01 1 0 5 7 10
02 1 0 10 15 15
02 2 3 5 8 10
03 1 0 3 3 3
03 2 0 6 9 9
04 1 0 4 10 10
;
data Knee_satisfactionscore1;
set ExamEx4;
if knee_number = 1;
array x{4} preop one_day one_week one_month;
do visit = 1 to 4;
score = x{visit};
output;
end;
run;
data Knee_satisfactionscore2;
set ExamEx4;
if knee_number = 2;
array x{4} preop one_day one_week one_month;
do visit = 1 to 4;
score = x{visit};
output;
end;
run;
data merged;
merge Knee_satisfactionscore1(rename=(score=score_knee1))
 Knee_satisfactionscore2(rename=(score=score_knee2));
by id visit;
run;
proc format;
value when
1 = 'pre op'
2 = 'day 1'
3 = 'week 1'
4 = 'month 1'
;
run;
proc print noobs data=merged;
format visit when.;
var id visit score_knee1 score_knee2;
run;
