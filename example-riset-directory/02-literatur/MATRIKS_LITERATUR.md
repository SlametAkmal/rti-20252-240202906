# Matriks Literatur

## Pendahuluan

Matriks literatur disusun untuk mengidentifikasi perkembangan penelitian mengenai performa database PostgreSQL, strategi indexing, optimasi query, serta implementasinya pada sistem e-commerce. Analisis ini bertujuan menemukan persamaan, perbedaan, dan research gap yang menjadi dasar penelitian.

---

## Tabel Matriks Literatur

| No | Penulis | Tahun | Judul Penelitian | Metode | Hasil Penelitian | Research Gap |
|----|----------|------|------------------|---------|------------------|--------------|
| 1 | PostgreSQL Global Development Group | 2024 | PostgreSQL Documentation | Dokumentasi | PostgreSQL menyediakan berbagai metode indexing untuk meningkatkan performa query. | Tidak membahas implementasi pada sistem e-commerce. |
| 2 | Silberschatz, Korth & Sudarshan | 2020 | Database System Concepts | Studi Literatur | Index mempercepat pencarian data pada database berukuran besar. | Tidak melakukan pengujian eksperimen pada PostgreSQL. |
| 3 | Elmasri & Navathe | 2021 | Fundamentals of Database Systems | Studi Literatur | DBMS yang baik mampu meningkatkan efisiensi pengolahan data. | Belum membahas strategi indexing pada PostgreSQL. |
| 4 | Ramakrishnan & Gehrke | 2020 | Database Management Systems | Studi Literatur | Struktur index mempengaruhi efisiensi query. | Tidak menggunakan studi kasus e-commerce. |
| 5 | Zhang et al. | 2022 | Performance Analysis of PostgreSQL Indexing | Eksperimen | Composite Index meningkatkan kecepatan SELECT secara signifikan. | Hanya menguji operasi SELECT. |
| 6 | Kim et al. | 2023 | PostgreSQL Query Optimization | Eksperimen | Optimasi query menurunkan response time hingga 30%. | Tidak membandingkan beberapa strategi indexing. |
| 7 | Ahmed et al. | 2023 | CRUD Performance Evaluation in PostgreSQL | Eksperimen | Operasi INSERT mengalami penurunan performa ketika jumlah index bertambah. | Tidak menggunakan aplikasi e-commerce. |
| 8 | Chen et al. | 2024 | Database Performance on E-Commerce Systems | Eksperimen | PostgreSQL memiliki stabilitas tinggi pada transaksi e-commerce. | Belum mengukur penggunaan CPU dan memori. |
| 9 | Gupta & Sharma | 2022 | Database Benchmark using PostgreSQL | Benchmark | PostgreSQL memberikan throughput yang tinggi pada dataset besar. | Tidak mengevaluasi strategi indexing. |
|10| Wahyudi dkk. | 2023 | Analisis Performa PostgreSQL | Eksperimen | Single Index mampu mempercepat query pencarian data produk. | Belum membandingkan Composite Index. |
|11| Prasetyo dkk. | 2024 | Optimasi Query Database | Eksperimen | Query optimization meningkatkan efisiensi sistem informasi. | Tidak menggunakan PostgreSQL. |
|12| Siregar dkk. | 2023 | Implementasi PostgreSQL pada Sistem Penjualan | Studi Kasus | PostgreSQL mampu menangani transaksi dengan baik. | Tidak melakukan benchmark performa. |

---

# Analisis Literatur

## Persamaan Penelitian

Beberapa penelitian memiliki kesamaan sebagai berikut:

- Menggunakan PostgreSQL sebagai DBMS utama.
- Berfokus pada peningkatan performa database.
- Menggunakan operasi CRUD sebagai objek pengujian.
- Memanfaatkan indexing sebagai teknik optimasi.
- Mengukur response time dan execution time query.

---

## Perbedaan Penelitian

Perbedaan yang ditemukan meliputi:

- Jenis index yang digunakan berbeda.
- Ukuran dataset yang digunakan bervariasi.
- Sebagian penelitian hanya menguji SELECT.
- Sebagian penelitian menggunakan benchmark sintetis.
- Belum semua penelitian menggunakan sistem e-commerce sebagai studi kasus.

---

# Research Gap

Berdasarkan hasil kajian literatur dapat diketahui bahwa sebagian besar penelitian hanya berfokus pada satu aspek optimasi database, misalnya optimasi query atau penggunaan satu jenis index saja. Selain itu, sebagian besar penelitian belum menguji seluruh operasi CRUD secara bersamaan pada sistem e-commerce.

Penelitian ini berupaya mengisi kekosongan tersebut dengan membandingkan performa PostgreSQL menggunakan beberapa strategi indexing melalui pengujian operasi Create, Read, Update, dan Delete pada sistem e-commerce. Selain mengukur response time, penelitian juga mengevaluasi throughput, penggunaan CPU, serta memori sehingga diperoleh gambaran performa database yang lebih komprehensif.

---

# Kesimpulan Kajian Literatur

Hasil kajian menunjukkan bahwa PostgreSQL merupakan DBMS yang memiliki performa tinggi dan mendukung berbagai strategi indexing untuk meningkatkan efisiensi query. Namun, masih diperlukan penelitian yang menguji pengaruh strategi indexing terhadap keseluruhan operasi CRUD pada sistem e-commerce dengan berbagai ukuran dataset. Oleh karena itu, penelitian ini diharapkan dapat memberikan kontribusi berupa rekomendasi strategi indexing yang paling efektif untuk meningkatkan performa PostgreSQL pada aplikasi e-commerce.