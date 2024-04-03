data car_prices;
input make $ nyclinders $ horsepow citympg highway price;
cards;
audi five 110 19 25 17710
audi five 110 19 25 18920
audi five 140 17 20 23875
audi five 160 16 22 17859
bmw four 101 23 29 16430
bmw six 121 20 25 24565
bmw six 182 16 22 30760
bmw six 182 16 22 41315
bmw six 182 15 20 36880
honda four 86 27 33 10295
honda four 101 24 28 12945
honda four 100 25 31 10345
mazda two 101 17 23 10945
mazda four 84 26 32 11245
mazda four 120 19 27 18280
;
run;
proc print data=car_prices;
run;
data car_prices1;
infile 'C:\Users\bushr\OneDrive\Desktop\car_prices.txt';
input make $ nyclinders $ horsepow citympg highway price;
proc print data=car_prices1;
run;
proc import out=car_prices2
 datafile="C:\Users\bushr\OneDrive\Desktop\car_prices.xlsx"
 dbms=xlsx replace;
run;
proc print data=car_prices2;
run;
data exercise2;
do counter= 1 to 54;
 response='yes';
 group='surgical';
output;
end;
do counter= 1 to 31;
 response='yes';
 group='nonsurgical';
output;
end;
do counter= 1 to 1092;
 response='no';
 group='surgical';
output;
end;
do counter= 1 to 769;
 response='no';
 group='nonsurgical';
output;
end;
run;
proc print data=exercise2;
run;
data fifa;
input name $ 1-17 age 19-21 nationalities $ 23-31 club $ 33-50 jersey_number
52-55
highet $ 57-60 weight $ 62-69;
cards;
L. Messi 31 Argentina FC Barcelona 10 5'7 159lbs
Cristiano Ronaldo 33 Portugal Juventus 7 6'2 183lbs
Neymar Jr 26 Brazil Paris Saint-Germain 10 5'9 150lbs
De Gea 27 Spain Manchester United 1 6'4 168lbs
K. De Bruyne 27 Belgium Manchester City 7 5'11 154lbs
E. Hazard 27 Belgium Chelsea 10 5'8 163lbs
L. Modri? 32 Croatia Real Madrid 10 5'8 146lbs
L. Suarez 31 Uruguay FC Barcelona 9 6'0 190lbs
Sergio Ramos 32 Spain Real Madrid 15 6'0 181lbs
J. Oblak 25 Slovenia Atletico Madrid 1 6'2 192lbs
R. Lewandowski 29 Poland FC Bayern Munchen 9 6'0 176lbs
T. Kroos 28 Germany Real Madrid 8 6'0 168lbs
;
proc print data=fifa;
run;
