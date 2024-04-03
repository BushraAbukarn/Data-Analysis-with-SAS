data docvisits;
 input patientID$ weekday$5-13 score;
cards;
101 Friday 15
163 Wednesday 11
104 Friday 23
163 Thursday 13
123 Tuesday 10
104 Monday 20
157 Friday 21
101 Monday 10
112 Tuesday 11
157 Tuesday 10
123 Monday 9
123 Friday 9
101 Tuesday 11
112 Monday 9
157 Thursday 18
174 Monday 12
;
proc sql;
 select count(distinct patientID) as NumberOfPatients
 from docvisits;
quit;
 proc sql;
 select patientID, count(weekday) as TotalVisits
 from docvisits
 group by weekday
 order by patientID;
quit;
 proc sql;
 select weekday, count(distinct patientID) as TotalPatientsVisited
 from docvisits
 group by weekday
 order by weekday;
quit;

data record;
input ID$ Gender$ Age Score;
cards;
259632 F 56 58
259632 F 56 41
259632 F 56 39
577763 F 67 40
577763 F 67 50
577763 F 67 39
577763 F 67 33
279645 M 52 24
279645 M 52 65
279645 M 52 66
279645 M 52 74
279645 M 52 85
694797 F 48 37
694797 F 48 85
684516 M 57 81
760076 M 62 45
760076 M 62 35
760076 M 62 38
760076 M 62 65
745795 F 74 85
745795 F 74 82
745795 F 74 77
745795 F 74 81
506301 M 78 70
506301 M 78 70
506301 M 78 71
506301 M 78 67
406126 M 62 60
406126 M 62 50
477908 M 70 50
477908 M 70 63
477908 M 70 51
188994 F 58 43
188994 F 58 34
;
proc sql;
 select count(distinct ID) as TotalPatients
 from record;
quit;
 proc sql;
 select Gender, count(distinct ID) as TotalPatients
 from record
 group by Gender;
quit;
 proc sql;
 select count(distinct ID) as TotalPatients
 from record
 where Age > 62;
quit;
 proc sql;
 select count(distinct ID) as TotalPatients
 from record
 where Age > 62 and Gender = 'F';
quit;
 proc sql;
 select ID, count(ID) as NumberOfVisits
 from record
 group by ID;
quit;
 proc sql;
 select ID, score, count(ID) as NumberOfVisits
 from record
 where score > 45
 group by ID;
quit;
 proc sql;
select ID, min(score) as MinScore, mean(score) as AvgScore, max(score) as
MaxScore
from record
group by ID;
quit;
 proc sql;
select ID, mean(score) as AvgScore
from record
group by ID
Having AvgScore > 60;
quit;

data TSLA;
input date mmddyy10. open close;
cards;
12/30/2021 1061.32 1070.33
12/31/2021 1073.43 1056.78
1/3/2022 1147.75 1199.78
1/4/2022 1189.55 1149.58
1/5/2022 1146.65 1088.11
1/6/2022 1077.00 1064.69
1/7/2022 1080.36 1026.95
1/10/2022 1000.00 1058.11
1/11/2022 1053.67 1064.40
;
data AMZN;
input date mmddyy10. open close;
cards;
12/23/2021 3408.56 3421.37
12/27/2021 3420.73 3393.38
12/28/2021 3403.64 3413.21
12/29/2021 3416.80 3384.02
12/30/2021 3394.00 3372.88
12/31/2021 3379.12 3334.34
1/3/2022 3351.00 3408.09
1/4/2022 3408.76 3350.44
;
proc sql;
 create table InnerJoin as
 select T.date, T.open as TSLA_Open, T.close as TSLA_close, A.open as
AMZN_open, A.close as AMZN_close
 from TSLA as T
 inner join AMZN as A
 on T.date = A.date;
quit;
proc print data=InnerJoin;
run;
 proc sql;
 create table LeftJoin as
 select T.date, T.open as TSLA_Open, T.close as TSLA_close, A.open as
AMZN_open, A.close as AMZN_close
 from TSLA as T
 left join AMZN as A
 on T.date = A.date;
quit;
proc print data=LeftJoin;
run;
 proc sql;
 create table RightJoin as
 select T.date, T.open as TSLA_Open, T.close as TSLA_close, A.open as
AMZN_open, A.close as AMZN_close
 from TSLA as T
 right join AMZN as A
 on T.date = A.date;
quit;
proc print data=RightJoin;
run;
 proc sql;
 create table FullJoin as
 select T.date as TSLA_date, T.open as TSLA_Open, T.close as TSLA_close,
A.date as AMZN_date, A.open as AMZN_open, A.close as AMZN_close
 from TSLA as T
 full join AMZN as A
 on T.date = A.date;
quit;
proc print data=FullJoin;
run;
