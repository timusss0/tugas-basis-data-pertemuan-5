CREATE TABLE dosen (
    nip varchar(12)NOT NULL,
    Nama_dosen varchar(25)
)

CREATE TABLE matakuliah(
Kode_MK varchar(6)NOT NULL,
nama_MK varchar(20)NOT NULL,
sks int(2)NOT NULL,
PRIMARY KEY(kode_MK)
)

CREATE TABLE perkuliahan (
nim varchar(9)DEFAULT NULL,
kode_MK varchar(7)DEFAULT NULL,
nip varchar(12)DEFAULT NULL,
kehadiran decimal(6,2)
)

CREATE TABLE mahasiswa (
nim varchar(9)NOT NULL,
nama_mhs varchar(25)NOT NULL,
tanggal_lahir date NOT NULL,
alamat varchar(50)NOT NULL,
jenis_kelamin enum("laki-laki","perempuan") NOT NULL,
ipk decimal (10,2),
PRIMARY KEY(nim)
)

ALTER TABLE perkuliahan(
ADD Nilai_Bobot char(1) NOT NULL,
ADD Nilai_Angka decimal(6,2),
ADD Poin varchar(1),
ADD KEY Nip (Nip),
ADD KEY Nim (Nim),
ADD KEY Kode_MK (Kode_MK),
ADD CONSTRAINT perkuliahan_ibfk_1 FOREIGN KEY (Nip) REFERENCES dosen (Nip) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT perkuliahan_ibfk_2 FOREIGN KEY (Nim) REFERENCES mahasiswa (Nim) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT perkuliahan_ibfk_3 FOREIGN KEY (Kode_MK) REFERENCES matakuliah (Kode_MK) ON DELETE CASCADE ON UPDATE CASCADE
);


SELECT * FROM Dosen

SELECT * FROM Dosen
WHERE Nip = “0429038801”;

INSERT INTO dosen (nip, Nama_Dosen) VALUES ('0429038801', 'Mariana S.Kom. MMSI.');

INSERT INTO mahasiswa (nim, nama_mhs, tanggal_lahir, alamat, jenis_kelamin, ipk) 
VALUES ('202307001', 'Budi Santoso', '2000-05-15', 'Jl. Merdeka 123', 'Laki-laki', 3.60);

INSERT INTO matakuliah (Kode_MK, nama_MK, sks) VALUES ('INF-01', 'Pemrograman', 3);


UPDATE dosen SET Nama_Dosen = 'Nurita S.Kom. MMSI.' WHERE Nip = '0429038801';

DELETE FROM Dosen
WHERE Nip = '0429038801';

INSERT INTO perkuliahan (nim, Kode_MK, kehadiran, Nilai_Bobot, Nilai_Angka, Poin) VALUES
('202307001', 'INF-02', 90, NULL, 93.59, NULL),
('202307001', 'INF-03', 65, NULL, 82.71, NULL),
('202307001', 'INF-04', 75, NULL, 90.00, NULL),
('202307001', 'INF-05', 70, NULL, 85.00, NULL),
('202307001', 'INF-06', 80, NULL, 75.00, NULL);


SELECT * FROM dosen;
SELECT * FROM mahasiswa WHERE Nim = '202307001';

UPDATE perkuliahan SET Nilai_Angka = Nilai_Angka * 0.65 WHERE Kehadiran < 75;


