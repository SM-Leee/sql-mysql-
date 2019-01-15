select abs(10), abs(-10);
select mod(234, 10), 254 % 10;
select floor(1.23), floor(-1.23);
select ceil(3.14), ceiling(3.14),
       ceil(-3.14), ceiling(-3.14);
select round(-1.23), round(-1.58), round(1.58);
select round(1.298, 1), round(1.298, 0);
select pow(2, 2), power(2, -2);
select sign(-10), sign(0), sign(100);
select greatest(5, 4, 3, 2, 1),
       greatest(3.14, 4.26, 5.8),
       greatest("ABCD", "ABCF", "ABCG");
select least(5, 4, 3, 2, 1),
       least(3.14, 4.26, 5.8),
       least("ABCD", "ABCF", "ABCG");


 

