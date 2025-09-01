-- Query 1: Menampilkan daftar anggota yang saat ini sedang meminjam buku
-- Mengambil nama anggota, judul buku, dan tanggal peminjaman
-- Filter hanya status yang masih 'Dipinjam'

SELECT m.nama, b.judul, l.tgl_pinjam
FROM loans l
JOIN members m ON l.id_member = m.id_member
JOIN books b ON l.id_book = b.id_book
WHERE l.status = 'Dipinjam';

-- ----------------------------------------------------------------------------------

-- Query 2: Menampilkan 5 buku yang paling sering dipinjam
-- Menghitung jumlah peminjaman per judul buku
-- Diurutkan dari yang paling sering dipinjam
-- ⚠️ Pastikan alias 'jumlah_dipinjam' digunakan dengan benar di ORDER BY

SELECT b.judul, COUNT(*) AS jumlah_dipinjam
FROM loans l
JOIN books b ON l.id_book = b.id_book
GROUP BY b.judul
ORDER BY jumlah_dipinjam DESC
LIMIT 5;

-- ----------------------------------------------------------------------------------

-- Query 3: Menampilkan jumlah peminjaman per bulan
-- Menggunakan fungsi DATE_FORMAT untuk mengambil format 'YYYY-MM'
-- Berguna untuk melihat tren bulanan peminjaman buku

SELECT DATE_FORMAT(tgl_pinjam, '%Y-%m') AS bulan, COUNT(*) AS jumlah_pinjam
FROM loans
GROUP BY bulan
ORDER BY bulan;

-- ----------------------------------------------------------------------------------

-- Query 4: Menampilkan daftar buku yang belum pernah dipinjam
-- LEFT JOIN digunakan untuk mencocokkan data buku dengan peminjaman
-- Jika tidak ditemukan id_book di tabel loans (NULL), artinya belum pernah dipinjam

SELECT b.judul
FROM books b
LEFT JOIN loans l ON b.id_book = l.id_book
WHERE l.id_book IS NULL;
