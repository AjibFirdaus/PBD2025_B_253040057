-- Menampilkan seluruh data
SELECT * FROM Dosen;

SELECT * FROM JadwalKuliah;

SELECT * FROM KRS;

SELECT * FROM Mahasiswa;

SELECT * FROM MataKuliah;

SELECT * FROM Nilai;

SELECT * FROM Ruangan;

-- Menampilkan data di tabel Mahasiswa kolom Nama Mahasiswa
SELECT NamaMahasiswa FROM dbo.Mahasiswa;

-- Cross Join
SELECT M.NamaMahasiswa, MK.NamaMK 
FROM Mahasiswa as M 
CROSS JOIN MataKuliah as MK

SELECT D.NamaDosen, R.KodeRuangan 
FROM Dosen as D 
CROSS JOIN Ruangan as R;

-- Left Join
INSERT INTO Mahasiswa (NamaMahasiswa, Prodi, Angkatan) VALUES ('Muhamad Ajib Firdaus', 'Informatika', 2025);

SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa as M
LEFT JOIN KRS as K ON M.MahasiswaID = K.MahasiswaID

-- TAMPILKAN SEMUA MATA KULIAH TERMASUK YANG BELUM PUNYA JADWAL
SELECT MK.NamaMK, JK.Hari, JK.JamMulai, JK.JamSelesai
FROM MataKuliah as MK
LEFT JOIN JadwalKuliah as JK ON MK.MataKuliahID = JK.MataKuliahID;

-- TAMPILKAN SEMUA HARI TERMASUK YANG TIDAK ADA MATAKULIAH NYA
SELECT JK.Hari, MK.NamaMK
FROM JadwalKuliah as JK
RIGHT JOIN MataKuliah as MK ON MK.MataKuliahID = JK.MataKuliahID;

-- TAMPILKAN SEMUA RUANGAN, APAKAH ADA DI JADWAL ATAU TIDAK 
SELECT R.KodeRuangan, JK.Hari
FROM JadwalKuliah as JK
RIGHT JOIN Ruangan as R ON JK.RuanganID = R.RuanganID

-- Inner Join

-- TAMPILKAN NAMA MAHASISWA DAN KRSID DI TABEL KRS
SELECT M.NamaMahasiswa, K.KRSID
FROM KRS as K
INNER JOIN Mahasiswa as M ON M.MahasiswaID = K.MahasiswaID;

-- TAMPILKAN SEMUA MATA KULIAH DENGAN JADWAL NYA
SELECT MK.NamaMK, JK.Hari, JK.JamMulai, JK.JamSelesai
FROM MataKuliah as MK
INNER JOIN JadwalKuliah as JK ON MK.MataKuliahID = JK.MataKuliahID;

-- TAMPILKAN MAHASISWA BESERTA NILAI NY
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa as M
INNER JOIN Nilai as N ON M.MahasiswaID = N.MahasiswaID
INNER JOIN MataKuliah as MK ON MK.MataKuliahID = N.MataKuliahID;

-- TAMPILKAN JADWAL MATA KULIAH + DOSEN + RUANGAN
SELECT MK.NamaMK, JK.Hari, R.Koderuangan, R.Gedung, D.NamaDosen
FROM JadwalKuliah as JK
INNER JOIN Dosen as D ON JK.DosenID = D.DosenID
INNER JOIN MataKuliah as MK ON MK.MataKuliahID = JK.MataKuliahID
INNER JOIN Ruangan as R ON JK.RuanganID = R.RuanganID