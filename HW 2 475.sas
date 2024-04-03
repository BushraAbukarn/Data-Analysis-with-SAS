data earthquakes;
infile 'C:\Users\bushr\OneDrive\Desktop\earthquakes_Ex1.txt';
input @1 Date mmddyy10. @12 Time TIME11. @24 Magnitude @29 Latitude @36
Longitude;
Proc print;
format Date DATE9. Time TIME5.;
run;
data exercise2;
input @1 Patient @5 Weight @8 Hieght @11 Age @15 BMI Smoking $ 27-39 @40
Asthma $;
cards;
1 143 64 55 24.5432129 occasionally no
2 152 67 60 23.8039657 heavy smoker yes
3 190 69 63 28.0550305 never no
4 165 65 25 27.4544379 occasionally no
5 220 70 58 31.5632653 occasionally no
6 182 64 26 31.2368164 never no
7 148 71 61 20.6395556 occasionally yes
8 190 66 74 30.6634527 occasionally yes
9 . 74 64 . never yes
10 152 65 61 25.291360 never yes
11 281 69 45 41.4919135 heavy smoker yes
12 . . 39 . occasionally yes
13 161 70 77 23.0985714 occasionally yes
14 167 70 65 23.9593878 never no
15 148 67 53 23.177545 never yes
16 182 172 58 27.43554 occasionally no
;
proc sort;
by Smoking;
run;
proc print label noobs;
by Smoking;
Format BMI 4.1;
var Patient Asthma Age BMI;
run;
data states;
input State_Name $ 1-14 State_Abbrev $ 15-21 Postal_Abbrev $ 22-24 Area 25-34
Population 35-44;
cards;
Alabama Ala. AL 52423 4040587
Alaska Alaska AK 656424 550043
Arizona Ariz. AZ 114006 3665228
Arkansas Ark. AR 53182 2350725
California Calif. CA 163707 29769021
Colorado Colo. CO 104100 3294394
Connecticut Conn. CT 5544 3287116
Delaware Del. DE 2489 666168
Florida Fla. FL 65756 12937926
Georgia Ga. GA 59441 6478216
Hawaii Hawaii HI 10932 1108229
Idaho Idaho ID 83574 1006749
Illinois Ill. IL 57918 11430602
Indiana Ind. IN 36420 5544159
Iowa Iowa IA 56276 2776755
Kansas Kans. KS 82282 2477574
Kentucky Ky. KY 40411 3685296
Louisiana La. LA 51843 4219973
Maine Maine ME 35387 1227928
Maryland Md. MD 12407 4781468
Massachusetts Mass. MA 10555 6016425
Michigan Mich. MI 96705 9295297
Minnesota Minn. MN 86943 4375099
Mississippi Miss. MS 48434 2573216
Missouri Mo. MO 69709 5117073
Montana Mont. MT 147046 799065
Nebraska Nebr. NE 77358 1578385
Nevada Nev. NV 110567 1201833
New Hampshire N.H. NH 9351 1109252
New Jersey N.J. NJ 8722 7730188
proc report data=states nowd;
column State_Name State_Abbrev Postal_Abbrev Area Population;
define State_Name/ center;
define State_Abbrev/ center;
define Postal_Abbrev/ center;
define Area/ format=comma7. center;
define Population / format=comma12. center;
run;
