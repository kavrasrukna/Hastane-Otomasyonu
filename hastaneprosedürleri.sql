--KULLANICI EKLE
create proc kullaniciekle(--personelno identity old. için eklemedim

@kullaniciadi varchar(50),
@sifre varchar(50),
@mail varchar(50),
@telefon char(20)
)
as begin 
insert into Kullanýcýlar(kullaniciadi,sifre,mail,telefon) values (@kullaniciadi,@sifre,@mail,@telefon)
end
exec kullaniciekle 'akintoþ öz',70,'akintos@gmail.com',5369596598 --values içindeki deðerlere atýyor,values içindeki deðerlerde personellerde insert ediliyor
--programmability stored procedures dbo personelekle prsedürüm eklenmiþ
--exec yada execute

--DOKTOR EKLE
create proc doktorekle(--personelno identity old. için eklemedim

@doktoradsoyad varchar(50),
@tc varchar(50),
@uzmanlikalani varchar(50),
@unvani char(20),
@telefon char(11),
@adres varchar(50),
@dogumtarihi date,
@polno int
)
as begin 
insert into Doktorlar(doktoradsoyad,tc,uzmanlikalani,unvani,telefon,adres,dogumtarihi,polno) values (@doktoradsoyad,@tc,@uzmanlikalani,@unvani,@telefon,@adres,@dogumtarihi,@polno)
end
exec doktorekle 'akintoþ öz',70056989659,'dahiliye','prof dr',5369896598,'Sancaktepe','1999.01.02',1


--DOKTOR LÝSTELE
create proc doktorlistele
as begin
select * from Doktorlar --parametresiz prosedür
end
exec doktorlistele


--DOKTOR SÝLME
create proc doktorsilme
@doktorno int
as begin
delete from Doktorlar where doktorno=@doktorno
end

exec doktorsilme 5
select * from Doktorlar

--DOKTOR GÜNCELLEME
create proc doktoryenile 
 --TCNO ya göre güncelleme yapmak istediðim için aldým
@tc varchar(50),
@uzmanlikalani varchar(50),
@unvani char(20),
@telefon char(11),
@adres varchar(50),
@dogumtarihi date,
@polno int

 as begin
 update Doktorlar set tc=@tc, uzmanlikalani=@uzmanlikalani, unvani=@unvani,telefon=@telefon,adres=@adres,dogumtarihi=@dogumtarihi,polno=@polno where tc=@tc
 end
 exec doktoryenile 15265989659,'göz','prof dr',5369596598,'Baðcýlar','1991-02-03',3
 select *from Doktorlar

 

 --HASTA EKLE
create proc hastaekle(--personelno identity old. için eklemedim

@hastaadsoyad varchar(50),
@tcno char(11),
@dogumtarihi date,
@boy int,
@yas int,
@recete varchar(50),
@rapordurumu varchar(50),
@doktorno int,
@randevuid int
)
as begin 
insert into Hastalar(hastaadsoyad,tcno,dogumtarihi,boy,yas,recete,rapordurumu,doktorno,randevuid) values (@hastaadsoyad,@tcno,@dogumtarihi,@boy,@yas,@recete,@rapordurumu,@doktorno,@randevuid)
end
exec hastaekle 'akintoþ öz',70056989659,'1999.01.02',160,32,'var','raporlu',1,2
select *from Hastalar

--HASTA  LÝSTELE
create proc hastalistele
as begin
select * from Hastalar --parametresiz prosedür
end
exec hastalistele


--HASTA  SÝLME
create proc hastasilme
@hastano int
as begin
delete from Hastalar where hastano=@hastano
end

exec hastasilme 5
select * from Hastalar

--HASTA  GÜNCELLEME
create proc hastayenile 
 --TCNOY göre güncelleme yapmak istediðim için aldým
@hastaadsoyad varchar(50),
@tcno char(11),
@dogumtarihi date,
@boy int,
@yas int,
@recete varchar(50),
@rapordurumu varchar(50),
@doktorno int,
@randevuid int

 as begin
 update Hastalar set hastaadsoyad=@hastaadsoyad, tcno=@tcno, dogumtarihi=@dogumtarihi,boy=@boy,yas=@yas,recete=@recete,rapordurumu=@rapordurumu,doktorno=@doktorno,randevuid=@randevuid where tcno=@tcno
 end
 exec hastayenile 'akintoþ öz',70056989659,'1991-02-03',160,25,'yok','raporsuz',2,1
 select *from Hastalar



  --POLÝKLÝNÝK EKLE
create proc poliklinikekle(--personelno identity old. için eklemedim

@poladi varchar(50),
@poluzmansayisi int,
@polbaskan varchar(50),
@polbashemsire varchar(50),
@yataksayisi int
)
as begin 
insert into Poliklinikler(poladi,poluzmansayisi,polbaskan,polbashemsire,yataksayisi) values (@poladi,@poluzmansayisi,@polbaskan,@polbashemsire,@yataksayisi)
end
exec poliklinikekle 'kadýn hastalýklarý',5,'Ali Günaydýn','Selma Bayan',5
select *from Poliklinikler

--POLÝKLÝNÝK  LÝSTELE
create proc polikliniklistele
as begin
select * from Poliklinikler --parametresiz prosedür
end
exec polikliniklistele


--POLÝKLÝNÝK  SÝLME
create proc polikliniksilme
@poladi varchar(50)
as begin
delete from Poliklinikler where poladi=@poladi
end

exec polikliniksilme 'kadýn hastalýklarý'
select * from Poliklinikler

--POLÝKLÝNÝK GÜNCELLEME
create proc poliklinikyenile 
 --TCNOY göre güncelleme yapmak istediðim için aldým
@poladi varchar(50),
@poluzmansayisi int,
@polbaskan varchar(50),
@polbashemsire varchar(50),
@yataksayisi int

 as begin
 update Poliklinikler set poladi=@poladi, poluzmansayisi=@poluzmansayisi, polbaskan= @polbaskan,polbashemsire =@polbashemsire ,yataksayisi=@yataksayisi where poladi=@poladi
 end
 exec poliklinikyenile 'kadýn hastalýklarý',6,'Ali Gün','Selma Güneþ',6
 select *from Poliklinikler



  --RANDEVU EKLE
create proc randevuekle(--personelno identity old. için eklemedim

@hastano int,
@polno int,
@doktorno int,
@randevutarih date
)
as begin 
insert into Randevular(hastano,polno,doktorno,randevutarih) values (@hastano,@polno,@doktorno,@randevutarih)
end
exec randevuekle 3,2,1,'2022-12-01'
select *from Randevular

--RANDEVU  LÝSTELE
create proc randevulistele
as begin
select * from Randevular --parametresiz prosedür
end
exec randevulistele


--RANDEVU  SÝLME
create proc randevusilme
@randevutarih date
as begin
delete from Randevular where randevutarih=@randevutarih
end

exec randevusilme '2022-12-01'
select * from Randevular

--RANDEVU GÜNCELLEME
create proc randevuyenile 
 --TCNOY göre güncelleme yapmak istediðim için aldým
@hastano int,
@polno int,
@doktorno int,
@randevutarih datetime

 as begin
 update Randevular set hastano=@hastano, polno=@polno, doktorno=@doktorno,randevutarih=@randevutarih where hastano=@hastano
 end
 exec randevuyenile 1,2,3,'2022-01-17'
 select *from Randevular



 

 

 