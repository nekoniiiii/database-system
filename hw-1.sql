CREATE TABLE kelompokfilm(
jenis VARCHAR2(20) NOT NULL,
harga_sewa NUMBER(6) NOT NULL,
CONSTRAINT jenis_pk PRIMARY KEY (jenis)
);

CREATE TABLE film(
kode_film VARCHAR2(3) NOT NULL,
jenis VARCHAR2(20) NOT NULL,
judul VARCHAR2(50) NOT NULL,
jml_keping NUMBER(3) NOT NULL,
jml_film NUMBER(3) NOT NULL,
CONSTRAINT kode_film_pk PRIMARY KEY (kode_film),

CONSTRAINT FK_jenis FOREIGN KEY (jenis)
    REFERENCES kelompokfilm(jenis)
);

CREATE TABLE customer(
no_identitas VARCHAR2(3) NOT NULL,
jenis_identitas VARCHAR2(20) NOT NULL,
nama VARCHAR2(20) NOT NULL,
alamat VARCHAR2(50),
CONSTRAINT no_identitas_pk PRIMARY KEY (no_identitas)
);

CREATE TABLE menyewa(
kode_sewa VARCHAR2(5) NOT NULL,
no_identitas VARCHAR2(3) NOT NULL,
tgl_sewa VARCHAR2(10) NOT NULL,
tot_film NUMBER(3) NOT NULL,
tgl_kembali VARCHAR2(10) NOT NULL,
tot_hrg NUMBER(7) NOT NULL,
denda NUMBER(6) NOT NULL,
CONSTRAINT kode_sewa_pk PRIMARY KEY (kode_sewa),

CONSTRAINT FK_no_identitas FOREIGN KEY (no_identitas)
    REFERENCES customer(no_identitas)
);

CREATE TABLE detailmenyewa(
kode_sewa VARCHAR2(5) NOT NULL,
kode_film VARCHAR2(3) NOT NULL,

CONSTRAINT FK_kode_sewa FOREIGN KEY (kode_sewa)
    REFERENCES menyewa(kode_sewa),
CONSTRAINT FK_kode_film FOREIGN KEY (kode_film)
    REFERENCES film(kode_film)
);


INSERT ALL
  INTO kelompokfilm (jenis, harga_sewa) VALUES ('action', 3000)
  INTO kelompokfilm (jenis, harga_sewa) VALUES ('drama', 3500)
  INTO kelompokfilm (jenis, harga_sewa) VALUES ('horor', 3000)
SELECT * FROM dual;

SELECT * FROM kelompokfilm;

INSERT ALL
  INTO film (kode_film, jenis, judul, jml_keping, jml_film) VALUES ('A01', 'action', 'Spiderman', 2, 3)
  INTO film (kode_film, jenis, judul, jml_keping, jml_film) VALUES ('A02', 'action', 'Spiderman 2', 2, 5)
  INTO film (kode_film, jenis, judul, jml_keping, jml_film) VALUES ('D01', 'drama', 'Love Story', 2, 3)
  INTO film (kode_film, jenis, judul, jml_keping, jml_film) VALUES ('H01', 'horor', 'Evil Death', 2, 2)
SELECT * FROM dual;

SELECT * FROM film;

INSERT ALL
  INTO customer (no_identitas, jenis_identitas, nama, alamat) VALUES ('001', 'SIM', 'Andi', 'pontianak')
  INTO customer (no_identitas, jenis_identitas, nama, alamat) VALUES ('002', 'SIM', 'Budi', 'pontianak')
SELECT * FROM dual;

SELECT * FROM customer;

INSERT ALL
  INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda) VALUES ('S0001', '001', '01/01/2007', 2, '02/01/2007', 6000, 0)
  INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda) VALUES ('S0002', '002', '03/01/2007', 1, '03/01/2007', 3500, 0)
  INTO menyewa (kode_sewa, no_identitas, tgl_sewa, tot_film, tgl_kembali, tot_hrg, denda) VALUES ('S0003', '001', '06/01/2007', 3, '08/01/2007', 9000, 0)
SELECT * FROM dual;

SELECT * FROM menyewa;

INSERT ALL
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0001', 'A01')
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0001', 'A02')
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0002', 'D01')
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0003', 'A02')
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0003', 'D01')
  INTO detailmenyewa (kode_sewa, kode_film) VALUES ('S0003', 'H01')
SELECT * FROM dual;

SELECT * FROM detailmenyewa;

ALTER TABLE customer 
ADD no_hp varchar2(12);

ALTER TABLE customer 
RENAME COLUMN no_hp TO no_wa;

ALTER TABLE customer DROP COLUMN jenis_identitas;
