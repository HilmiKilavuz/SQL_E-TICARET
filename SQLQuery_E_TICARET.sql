
--MÜÞTERÝ TABLOSUNUN TANIMLANMASI Musteri (id, ad, soyad, email, sehir, kayit_tarihi)
CREATE TABLE Musteri(
id INT IDENTITY(1,1) PRIMARY KEY,
 ad VARCHAR(50) NOT NULL ,
 soyad VARCHAR(50) NOT NULL ,
 email VARCHAR(50) NOT NULL,
 sehir VARCHAR(50),
 kayit_tarihi DATETIME DEFAULT GETDATE() 

)


--KATEGORÝ TABLOSUNUN TASARLANMASI  Kategori (id, ad)
CREATE TABLE  Kategori (
id INT PRIMARY KEY IDENTITY(1,1) ,
ad VARCHAR(100) 
)
--KATEGORÝ TABLOSUNUN MODÝFÝYE EDÝLMESÝ
ALTER TABLE Kategori
ALTER COLUMN ad NVARCHAR NOT NULL

--SATICI TABLOSNUN TASARLANMASI  Satici (id, ad, adres)
CREATE TABLE  Satici (
id INT IDENTITY(1,1) PRIMARY KEY ,
ad VARCHAR(50) NOT NULL ,
adres VARCHAR(200) NOT NULL
)

--ÜRÜN TABLOSUNUN TASARLANMASI - Urun (id, ad, fiyat, stok, kategori_id, satici_id)

CREATE TABLE  Urun (
id INT IDENTITY(1,1) PRIMARY KEY,
ad VARCHAR(50) NOT NULL ,
fiyat DECIMAL(10,2) NOT NULL ,
stok INT NOT NULL,
kategori_id INT NOT NULL,
satici_id INT NOT NULL
FOREIGN KEY (kategori_id) REFERENCES Kategori(id),
FOREIGN KEY (satici_id) REFERENCES Satici(id)
)

-- SÝPARÝÞ TABLOSNUN TASARLANMASI Siparis (id, musteri_id, tarih, toplam_tutar, odeme_turu)
CREATE TABLE  Siparis (
id INT IDENTITY(1,1) PRIMARY KEY ,
musteri_id INT NOT NULL,
tarih DATE DEFAULT GETDATE() ,
toplam_tutar DECIMAL(15,2),
odeme_turu VARCHAR(30)
   FOREIGN KEY (musteri_id) REFERENCES Musteri(id)
)

--SÝPARÝÞ DETAY TABLOSUNUN TASARLANMASI Siparis_Detay (id, siparis_id, urun_id, adet, fiyat)
CREATE TABLE Siparis_Detay (
id INT IDENTITY(1,1) PRIMARY KEY ,
siparis_id INT NOT NULL ,
urun_id INT NOT NULL ,
adet INT NOT NULL,
fiyat DECIMAL(15,2)
FOREIGN KEY (siparis_id) REFERENCES Siparis(id),
FOREIGN KEY (urun_id) REFERENCES Urun(id)
)



-- 1. Kategori Tablosuna Veri

INSERT INTO Kategori (ad) VALUES
('Elektronik'),
('Giyim'),
('Kitap'),
('Ev & Yaþam'),
('Spor');


-- 2. Satici Tablosuna Veri

INSERT INTO Satici (ad, adres) VALUES
('ABC Maðaza', 'Ýstanbul'),
('Moda Dünyasý', 'Ankara'),
('Kitap Evi', 'Ýzmir'),
('Spor Market', 'Bursa'),
('Ev Dünyasý', 'Antalya');


-- 3. Musteri Tablosuna Veri

INSERT INTO Musteri (ad, soyad, email, sehir) VALUES
('Ahmet', 'Yýlmaz', 'ahmet@gmail.com', 'Ýstanbul'),
('Ayþe', 'Kara', 'ayse@hotmail.com', 'Ankara'),
('Mehmet', 'Demir', 'mehmet@yahoo.com', 'Ýzmir'),
('Elif', 'Çelik', 'elif@gmail.com', 'Bursa'),
('Murat', 'Aslan', 'murat@hotmail.com', 'Antalya'),
('Zeynep', 'Þahin', 'zeynep@gmail.com', 'Ýstanbul'),
('Ali', 'Koç', 'ali@gmail.com', 'Ankara'),
('Fatma', 'Güneþ', 'fatma@hotmail.com', 'Ýzmir'),
('Kerem', 'Yýldýz', 'kerem@gmail.com', 'Bursa'),
('Derya', 'Polat', 'derya@yahoo.com', 'Antalya');

-- 4. Urun Tablosuna Veri

INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES
('Laptop', 15000, 10, 1, 1),     -- Elektronik, ABC Maðaza
('Telefon', 10000, 15, 1, 1),
('T-Shirt', 200, 50, 2, 2),      -- Giyim, Moda Dünyasý
('Pantolon', 300, 40, 2, 2),
('Roman Kitap', 50, 100, 3, 3),  -- Kitap, Kitap Evi
('Çocuk Kitap', 30, 80, 3, 3),
('Tencere', 300, 20, 4, 5),      -- Ev & Yaþam, Ev Dünyasý
('Koltuk', 2000, 5, 4, 5),
('Koþu Ayakkabýsý', 500, 30, 5, 4), -- Spor, Spor Market
('Basketbol Topu', 300, 25, 5, 4),
('Klavye', 800, 20, 1, 1),
('Mouse', 300, 25, 1, 1),
('Mont', 400, 35, 2, 2),
('Mutfak Robotu', 1200, 10, 4, 5),
('Yoga Matý', 250, 40, 5, 4);


-- 5. Siparis Tablosuna Veri

INSERT INTO Siparis (musteri_id, toplam_tutar, odeme_turu) VALUES
(1, 16000, 'Kredi Kartý'),
(2, 500, 'Nakit'),
(3, 350, 'Kredi Kartý'),
(4, 800, 'Kredi Kartý'),
(5, 2300, 'Nakit'),
(6, 1000, 'Kredi Kartý'),
(7, 400, 'Nakit'),
(8, 2500, 'Kredi Kartý'),
(9, 1500, 'Nakit'),
(10, 700, 'Kredi Kartý');


-- 6. Siparis_Detay Tablosuna Veri

INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES
(1, 1, 1, 15000),
(1, 11, 1, 800),
(2, 3, 2, 400),
(3, 5, 7, 350),
(4, 4, 2, 600),
(4, 13, 1, 400),
(5, 7, 1, 300),
(5, 8, 1, 2000),
(6, 12, 2, 600),
(7, 14, 1, 1200),
(8, 10, 2, 600),
(8, 15, 1, 250),
(9, 9, 3, 1500),
(10, 6, 5, 150),
(10, 3, 1, 200)

--Veri Sorgulama ve Raporlama

--En çok sipariþ veren 5 müþteri
SELECT TOP 5 M.id, M.ad, M.soyad, COUNT(S.id) AS siparis_sayisi
FROM Musteri M
INNER JOIN Siparis S ON M.id = S.musteri_id
GROUP BY M.id, M.ad, M.soyad
ORDER BY siparis_sayisi DESC;

-- En çok satýlan ürünler
SELECT TOP 5 U.id, U.ad, SUM(SD.adet) AS toplam_satis
FROM Urun U
INNER JOIN Siparis_Detay SD ON U.id = SD.urun_id
GROUP BY U.id, U.ad
ORDER BY toplam_satis DESC;

--En yüksek cirosu olan satýcýlar
SELECT TOP 5 S.id, S.ad, SUM(SD.adet * SD.fiyat) AS toplam_ciro
FROM Satici S
INNER JOIN Urun U ON S.id = U.satici_id
INNER JOIN Siparis_Detay SD ON U.id = SD.urun_id
GROUP BY S.id, S.ad
ORDER BY toplam_ciro DESC;

--Aggregate & Group By:

--Þehirlere göre müþteri sayýsý
SELECT sehir, COUNT(*) AS musteri_sayisi
FROM Musteri
GROUP BY sehir
ORDER BY musteri_sayisi DESC;

--Kategori bazlý toplam satýþlar
SELECT K.ad AS kategori, SUM(SD.adet * SD.fiyat) AS toplam_satis
FROM Kategori K
INNER JOIN Urun U ON K.id = U.kategori_id
INNER JOIN Siparis_Detay SD ON U.id = SD.urun_id
GROUP BY K.ad
ORDER BY toplam_satis DESC;

--Aylara göre sipariþ sayýsý
SELECT YEAR(tarih) AS yil, MONTH(tarih) AS ay, COUNT(*) AS siparis_sayisi
FROM Siparis
GROUP BY YEAR(tarih), MONTH(tarih)
ORDER BY yil, ay;

--JOIN’ler
--Sipariþlerde müþteri + ürün + satýcý bilgisi
SELECT S.id AS siparis_id,
       M.ad AS musteri_ad, M.soyad AS musteri_soyad,
       U.ad AS urun_ad, SD.adet, SD.fiyat,
       Sa.ad AS satici_ad
FROM Siparis S
INNER JOIN Musteri M ON S.musteri_id = M.id
INNER JOIN Siparis_Detay SD ON S.id = SD.siparis_id
INNER JOIN Urun U ON SD.urun_id = U.id
INNER JOIN Satici Sa ON U.satici_id = Sa.id;

--Hiç satýlmamýþ ürünler
SELECT U.id, U.ad
FROM Urun U
LEFT JOIN Siparis_Detay SD ON U.id = SD.urun_id
WHERE SD.urun_id IS NULL;

--Hiç sipariþ vermemiþ müþteriler
SELECT M.id, M.ad, M.soyad
FROM Musteri M
LEFT JOIN Siparis S ON M.id = S.musteri_id
WHERE S.id IS NULL;


--En çok kazanç saðlayan ilk 3 kategori
SELECT TOP 3 K.ad AS kategori, SUM(SD.adet * SD.fiyat) AS toplam_ciro
FROM Kategori K
INNER JOIN Urun U ON K.id = U.kategori_id
INNER JOIN Siparis_Detay SD ON U.id = SD.urun_id
GROUP BY K.ad
ORDER BY toplam_ciro DESC;

--Ortalama sipariþ tutarýný geçen sipariþleri bul
SELECT *
FROM Siparis
WHERE toplam_tutar > (SELECT AVG(toplam_tutar) FROM Siparis);

--En az bir kez elektronik ürün satýn alan müþteriler
SELECT DISTINCT M.id, M.ad, M.soyad
FROM Musteri M
INNER JOIN Siparis S ON M.id = S.musteri_id
INNER JOIN Siparis_Detay SD ON S.id = SD.siparis_id
INNER JOIN Urun U ON SD.urun_id = U.id
INNER JOIN Kategori K ON U.kategori_id = K.id
WHERE K.ad = 'Elektronik';

