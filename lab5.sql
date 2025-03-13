-- LABY 5

-- 2.1
select count(*) from zamowienia where year(DataRealizacji) = 2016 and month(DataRealizacji) = 9;
-- 2.2
select count(distinct IDKlienta) from zamowienia join artykuly using(IDZamowienia) join pudelka using(IDPudelka) where Nazwa = 'Zestaw lizakow' or Nazwa = 'Pianki ogniskowe';
-- 2.3
select count(distinct IDKlienta) from zamowienia join artykuly using(IDZamowienia) join pudelka using(IDPudelka) where (Nazwa = 'Lizaki swiateczne' or Nazwa = 'Czekoladowe melodie') and Sztuk >= 2;
-- 2.4
select count(distinct IDKlienta) from zamowienia join artykuly using(IDZamowienia) join zawartosc using(IDPudelka) join cukierki using (IDCukierka) where Barwniki rlike 'niebieski';
-- 2.5
select count(distinct IDKlienta) from zamowienia;
-- 2.6
select count(*) from klienci where IDKlienta not in (select distinct IDKlienta from zamowienia);
-- 2.7
select count(*) from (select IDKlienta from zamowienia group by IDKlienta having count(*) = 5) as sub;
