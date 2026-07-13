# Analysis Overview

## Pendahuluan

Tahap analisis dilakukan setelah seluruh proses benchmark selesai dilaksanakan. Data hasil pengujian dikumpulkan untuk mengetahui pengaruh strategi indexing terhadap performa Database PostgreSQL pada sistem E-Commerce. Analisis difokuskan pada pengukuran waktu eksekusi setiap operasi CRUD, penggunaan sumber daya sistem, serta efektivitas masing-masing strategi indexing.

## Tujuan Analisis

Analisis dilakukan untuk:

- Membandingkan performa PostgreSQL pada setiap strategi indexing.
- Mengukur waktu eksekusi operasi Create, Read, Update, dan Delete.
- Mengukur penggunaan CPU dan memori selama benchmark berlangsung.
- Mengidentifikasi strategi indexing yang memberikan performa terbaik.
- Memberikan rekomendasi penerapan indexing pada sistem E-Commerce.

---

# Parameter Analisis

Parameter yang digunakan pada penelitian ini meliputi:

| Parameter | Keterangan |
|-----------|------------|
| Response Time | Waktu yang dibutuhkan untuk menyelesaikan query |
| Throughput | Jumlah query yang dapat diproses setiap detik |
| CPU Usage | Persentase penggunaan prosesor selama benchmark |
| Memory Usage | Penggunaan memori PostgreSQL |
| Query Execution Time | Lama eksekusi setiap query CRUD |

---

# Operasi yang Dianalisis

Analisis dilakukan terhadap empat operasi utama database.

## Create

Mengukur waktu yang dibutuhkan PostgreSQL dalam menambahkan data baru ke dalam tabel.

## Read

Mengukur performa query SELECT pada berbagai ukuran dataset.

## Update

Mengukur performa perubahan data terhadap record yang telah tersimpan.

## Delete

Mengukur performa penghapusan data dari tabel.

---

# Strategi Indexing

Penelitian membandingkan tiga strategi indexing.

## No Index

Database hanya menggunakan Primary Key tanpa secondary index.

## Single Index

Database menggunakan satu index pada kolom yang sering digunakan pada proses pencarian.

## Composite Index

Database menggunakan index gabungan pada dua atau lebih kolom untuk mempercepat proses query yang kompleks.

---

# Dataset Pengujian

Benchmark dilakukan menggunakan beberapa ukuran dataset.

| Dataset |
|----------|
| 50.000 Record |
| 100.000 Record |
| 250.000 Record |
| 500.000 Record |
| 1.000.000 Record |

---

# Metode Analisis

Data benchmark dianalisis menggunakan pendekatan statistik deskriptif, yaitu:

- Menghitung nilai rata-rata (Mean)
- Menghitung nilai minimum
- Menghitung nilai maksimum
- Menghitung standar deviasi
- Membandingkan hasil antar strategi indexing

Hasil analisis kemudian disajikan dalam bentuk tabel dan grafik untuk mempermudah proses interpretasi.

---

# Hasil yang Diharapkan

Melalui analisis ini diharapkan dapat diperoleh informasi mengenai:

- Strategi indexing dengan performa terbaik.
- Pengaruh ukuran dataset terhadap waktu eksekusi query.
- Pengaruh indexing terhadap penggunaan sumber daya sistem.
- Rekomendasi strategi indexing yang sesuai untuk implementasi pada sistem E-Commerce.

---

# Kesimpulan

Tahap analisis merupakan proses penting untuk mengevaluasi performa PostgreSQL berdasarkan hasil benchmark yang telah dilakukan. Seluruh hasil analisis pada folder ini akan menjadi dasar dalam penyusunan grafik, tabel, pembahasan, dan kesimpulan pada laporan penelitian.