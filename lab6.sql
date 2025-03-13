-- LABY 6

-- 1.1
select IDPudelka, sum(Sztuk*Koszt) as cena from zawartosc join cukierki using(IDCukierka) group by IDPudelka order by cena desc limit 1;
-- 1.2
select IDPudelka, sum(Sztuk*Masa) as masa from zawartosc join cukierki c using(IDCukierka) where c.IDCukierka rlike 'C' group by IDPudelka order by masa desc limit 1;
-- 2.1
select sum(Stan*Sztuk*Masa) as masa from pudelka p join zawartosc z using(IDPudelka) join cukierki c using(IDCukierka); 
-- 2.2
select IDPudelka, sum(Sztuk) as suma from zawartosc group by IDPudelka order by suma desc limit 1;
-- 2.3
select IDPudelka, avg(Masa) as suma from zawartosc join cukierki using(IDCukierka) group by IDPudelka order by suma desc limit 1;
--	lub
select IDPudelka, sum(Masa*Sztuk)/sum(Sztuk) as suma from zawartosc join cukierki using(IDCukierka) group by IDPudelka order by suma desc limit 1;
-- 3
select avg(suma) from (select sum(Cena*Sztuk) as suma from artykuly join pudelka using(IDPudelka) group by IDZamowienia) as sub;
-- 4
select count(*) from (select count(IDPudelka) as c from zawartosc group by IDCukierka) as sub where c = (select max(suma) from (select count(IDPudelka) as suma from zawartosc group by IDCukierka) as m); 
-- 5
select IDPudelka, count(IDZamowienia) as p from artykuly group by IDPudelka order by p desc limit 1;