-- CARA MEMBUAT VARIABLE
-- CARA PERTAMA
DECLARE @Nilai INT = 100;
PRINT @Nilai;

-- CARA KEDUA
DECLARE @Nama CHAR(5);
SET @Nama = 'Ajib';
PRINT @Nama;

-- JIKA NILAINYA DIATAS 80
-- MAKA TAMPILKAN 'LULUS'
-- JIKA TDAK MAKA TAMPILKAN 'TIDAK LULUS'
DECLARE @Nilai INT = 50;
IF @Nilai > 80
    PRINT('Lulus')
ELSE 
    PRINT('Tidak Lulus')

-- JIKA HARGA BARANG > 100RB MAKA TAMPILKAN MAHAL JIKA TIDAK BELI
DECLARE @HargaBarang FLOAT = 100001;
IF @HargaBarang > 100000
    PRINT 'MAHAL'
ELSE
    PRINT 'BELI'

-- VIEW

-- TANPA VIEW
SELECT * FROM Mahasiswa;

SELECT * FROM Mahasiswa
INNER JOIN Nilai ON Mahasiswa.MahasiswaID = Nilai.MahasiswaID;

-- VIEW
CREATE OR ALTER VIEW vw_mahasiswanilai
AS 
SELECT M.NamaMahasiswa, M.Prodi, M.Angkatan, N.NilaiAKhir FROM Mahasiswa AS M
INNER JOIN Nilai AS N ON M.MahasiswaID = N.MahasiswaID

-- CARA PANGGGIL VIEW NYA
SELECT * FROM vw_mahasiswanilai;

-- BUAT VIEW vw_mahasiswasmt yang dimana ketika dipangill
-- menampilkan nama mahasiswa dan juga semester yang di ambil
CREATE OR ALTER VIEW vw_mahasiswasmt
AS
SELECT M.NamaMahasiswa, K.Semester FROM Mahasiswa AS M
INNER JOIN KRS AS K ON M.MahasiswaID = K.MahasiswaID;

SELECT * FROM vw_mahasiswasmt;

-- STORE PROCEDURE
CREATE OR ALTER PROCEDURE sp_LihatMahasiswa
AS
    BEGIN
    SELECT * FROM Mahasiswa;
END

EXEC sp_LihatMahasiswa;

-- BUAT PROCEDURE 'sp_nilai'
-- YANG DIMANA JIKA NILAI AKHIR NYA ADALAH 'A'
-- TAMPILKAN 'LULUS' BESERTA MAHASISWA NILAI 'A'
-- JIKA TIDAK, TAMPILKAN 'TIDAK LULUS'

CREATE OR ALTER PROCEDURE sp_nilai
AS 
    BEGIN
    DECLARE @NilaiAkhir CHAR(1) = 'A'
    IF @NilaiAkhir = 'A'
        SELECT M.NamaMahasiswa, M.Prodi, M.Angkatan, N.NilaiAKhir FROM Mahasiswa AS M
        INNER JOIN Nilai AS N ON M.MahasiswaID = N.MahasiswaID WHERE N.NilaiAkhir = 'A';
    ELSE
        PRINT 'TIDAK LULUS'
END

EXEC sp_nilai;