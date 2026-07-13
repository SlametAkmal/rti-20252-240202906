# Metodologi Penelitian

## 3.1 Jenis Penelitian

Penelitian ini menggunakan metode eksperimen (experimental research) dengan pendekatan kuantitatif. Penelitian bertujuan untuk menganalisis kinerja Database PostgreSQL pada sistem E-Commerce berdasarkan pengujian operasi CRUD menggunakan beberapa strategi indexing.

Metode eksperimen dipilih karena memungkinkan peneliti melakukan pengujian secara langsung terhadap beberapa skenario sehingga dapat diperoleh data performa yang objektif.

---

## 3.2 Tahapan Penelitian

Tahapan penelitian dilakukan sebagai berikut.

1. Studi Literatur
2. Perancangan Database
3. Persiapan Dataset
4. Implementasi Strategi Indexing
5. Pelaksanaan Benchmark CRUD
6. Pengumpulan Data
7. Analisis Hasil
8. Penyusunan Kesimpulan

---

## 3.3 Lingkungan Pengujian

Pengujian dilakukan menggunakan spesifikasi berikut.

### Hardware

- Processor : Intel Core i5
- RAM : 8 GB
- Storage : SSD 512 GB

### Software

- Windows 11 Pro
- PostgreSQL 16
- Docker Desktop
- Visual Studio Code
- pgAdmin 4

---

## 3.4 Dataset

Dataset yang digunakan merupakan data produk E-Commerce yang terdiri dari beberapa ukuran data.

| Dataset | Jumlah Record |
|----------|--------------:|
| Dataset 1 | 50.000 |
| Dataset 2 | 100.000 |
| Dataset 3 | 250.000 |
| Dataset 4 | 500.000 |
| Dataset 5 | 1.000.000 |

---

## 3.5 Strategi Indexing

Penelitian membandingkan tiga strategi indexing.

### No Index

Tidak menggunakan secondary index.

### Single Index

Menggunakan satu index pada kolom Category.

### Composite Index

Menggunakan index gabungan pada kolom Category dan Price.

---

## 3.6 Operasi Benchmark

Operasi yang diuji meliputi:

- Create
- Read
- Update
- Delete

Setiap operasi dijalankan sebanyak 10 kali pada setiap ukuran dataset.

---

## 3.7 Parameter Pengujian

Parameter yang dianalisis meliputi:

- Response Time
- Query Execution Time
- Throughput
- CPU Usage
- Memory Usage

---

## 3.8 Teknik Analisis Data

Data benchmark dianalisis menggunakan statistik deskriptif.

Perhitungan meliputi:

- Mean
- Minimum
- Maximum
- Standar Deviasi

Hasil kemudian dibandingkan antar strategi indexing dan divisualisasikan dalam bentuk tabel serta grafik.

---

## 3.9 Diagram Alur Penelitian

Tahapan penelitian dapat digambarkan sebagai berikut.

Studi Literatur

↓

Perancangan Database

↓

Implementasi Index

↓

Benchmark CRUD

↓

Pengumpulan Data

↓

Analisis Statistik

↓

Kesimpulan