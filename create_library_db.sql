-- Instruksi 1
CREATE DATABASE perpustakaan;

CREATE TABLE perpustakaan.buku (
    id_buku VARCHAR (255) NOT NULL PRIMARY KEY,
    judul_buku VARCHAR (255) NOT NULL,
    nama_penulis VARCHAR (255) NULL,
    jumlah INTEGER NULL
);

-- Mengecek apakah tabel sudah terbentuk
SELECT
    *
FROM
    perpustakaan.buku;

-- Instruksi 2
ALTER TABLE
    perpustakaan.buku
ADD
    lokasi VARCHAR (255);

-- Mengecek hasil perubahan
SELECT
    *
FROM
    perpustakaan.buku;

-- Instruksi 3
CREATE TABLE perpustakaan.peminjaman (
    no_peminjaman VARCHAR (255) NOT NULL PRIMARY KEY,
    nama_peminjam VARCHAR (255) NOT NULL,
    id_buku VARCHAR (255) NOT NULL,
    jumlah_buku INTEGER NOT NULL,
    tgl_pinjam DATE NOT NULL,
    tgl_ekspektasi_kembali DATE NULL,
    tgl_aktual_kembali DATE NULL,
    FOREIGN KEY (id_buku) REFERENCES perpustakaan.buku(id_buku)
);

-- Mengecek apakah tabel sudah terbentuk
SELECT
    *
FROM
    perpustakaan.peminjaman;

-- Jawaban 1
EXPLAIN perpustakaan.peminjaman;

/* Primary key dan foreign key akan terbentuk setelah instruksi 1, 2 dan 3 dijalankan*/
-- Jawaban 2
/*Jalankan instruksi pada file entri_buku.sql*/
-- Periksa apakah data sudah masuk dengan menggunakan query berikut:
SELECT
    *
FROM
    perpustakaan.buku;

-- Jawaban 3
/*Jalankan instruksi pada file entri_peminjaman.sql*/
-- Periksa apakah data sudah masuk dengan menggunakan query berikut:
SELECT
    *
FROM
    perpustakaan.peminjaman;

-- Jawaban 4 
INSERT INTO
    perpustakaan.peminjaman (
        no_peminjaman,
        nama_peminjam,
        id_buku,
        jumlah_buku,
        tgl_pinjam,
        tgl_ekspektasi_kembali,
        tgl_aktual_kembali
    )
VALUES
    (
        'A0000000004',
        'Adi',
        'A234133',
        1,
        '2022-10-10',
        '2022-10-17',
        NULL
    );

-- Query ditolak / data tidak berhasil masuk ke dalam tabel
-- Penyebabnya adalah karena id_buku yang dimasukkan tidak ada di tabel buku
-- id_buku itu sendiri merupakan foreign key yang merefer ke tabel buku pada kolom id_buku