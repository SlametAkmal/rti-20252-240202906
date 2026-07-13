# Tinjauan Pustaka

## 2.1 Database Management System (DBMS)

Database Management System (DBMS) merupakan perangkat lunak yang digunakan untuk mengelola, menyimpan, mengubah, serta mengambil data secara terstruktur. DBMS berfungsi sebagai perantara antara pengguna dengan basis data sehingga proses pengelolaan data dapat dilakukan secara efisien, aman, dan konsisten.

Dalam pengembangan aplikasi modern, DBMS memiliki peranan penting karena mampu menangani transaksi data dalam jumlah besar, menjaga integritas data, serta mendukung proses pencarian data secara cepat. Beberapa DBMS yang banyak digunakan antara lain PostgreSQL, MySQL, Oracle Database, Microsoft SQL Server, dan SQLite.

Karakteristik utama DBMS meliputi:

- Penyimpanan data secara terstruktur.
- Mendukung transaksi (ACID).
- Menjamin konsistensi data.
- Mendukung multi-user.
- Menyediakan mekanisme keamanan data.
- Mendukung proses backup dan recovery.

---

# 2.2 PostgreSQL

PostgreSQL merupakan Relational Database Management System (RDBMS) yang bersifat open source dan telah banyak digunakan dalam berbagai aplikasi skala kecil maupun skala enterprise. PostgreSQL dikenal memiliki stabilitas tinggi, kemampuan menangani transaksi dalam jumlah besar, serta mendukung berbagai fitur lanjutan seperti indexing, stored procedure, trigger, view, dan foreign key.

Keunggulan PostgreSQL antara lain:

- Open source.
- Mendukung transaksi ACID.
- Mendukung berbagai jenis index.
- Memiliki query optimizer yang baik.
- Mendukung concurrency tinggi melalui MVCC (Multi Version Concurrency Control).

Karena kemampuan tersebut, PostgreSQL menjadi salah satu pilihan utama dalam pengembangan sistem E-Commerce yang membutuhkan performa dan keandalan tinggi.

---

# 2.3 Sistem E-Commerce

E-Commerce merupakan sistem perdagangan elektronik yang memungkinkan proses transaksi dilakukan melalui jaringan internet. Sistem ini mempermudah proses penjualan, pembelian, pembayaran, hingga pengelolaan produk secara digital.

Pada sistem E-Commerce terdapat beberapa aktivitas utama yang berhubungan langsung dengan database, antara lain:

- Menambahkan produk baru.
- Menampilkan daftar produk.
- Memperbarui informasi produk.
- Menghapus produk.
- Melakukan pencarian produk.
- Mengelola transaksi pelanggan.

Semakin banyak jumlah pengguna dan data yang tersimpan, maka performa database menjadi faktor penting dalam menjaga kualitas layanan sistem.

---

# 2.4 Operasi CRUD

CRUD merupakan singkatan dari Create, Read, Update, dan Delete yang merupakan operasi dasar dalam pengelolaan data pada database.

### Create

Operasi Create digunakan untuk menambahkan data baru ke dalam database.

Contoh:

```sql
INSERT INTO products(name,price)
VALUES('Laptop',8500000);
```

### Read

Operasi Read digunakan untuk mengambil data dari database.

```sql
SELECT * FROM products;
```

### Update

Operasi Update digunakan untuk mengubah data yang telah tersimpan.

```sql
UPDATE products
SET price=9000000
WHERE id=1;
```

### Delete

Operasi Delete digunakan untuk menghapus data dari database.

```sql
DELETE FROM products
WHERE id=1;
```

Keempat operasi tersebut merupakan aktivitas utama yang digunakan sebagai objek benchmark dalam penelitian ini.

---

# 2.5 Indexing

Indexing merupakan teknik optimasi database yang bertujuan mempercepat proses pencarian data. Index bekerja seperti daftar isi pada sebuah buku sehingga database tidak perlu membaca seluruh isi tabel ketika mencari data tertentu.

Penelitian ini menggunakan tiga strategi indexing.

## No Index

Strategi ini hanya menggunakan Primary Key tanpa secondary index.

Kelebihan:

- INSERT lebih cepat.
- UPDATE lebih cepat.

Kekurangan:

- SELECT lambat pada dataset besar.

---

## Single Index

Single Index merupakan index pada satu kolom yang sering digunakan dalam proses pencarian.

Contoh:

```sql
CREATE INDEX idx_category
ON products(category);
```

Kelebihan:

- Query SELECT lebih cepat.

Kekurangan:

- Menambah sedikit beban saat INSERT dan UPDATE.

---

## Composite Index

Composite Index merupakan index yang terdiri dari dua atau lebih kolom.

Contoh:

```sql
CREATE INDEX idx_category_price
ON products(category,price);
```

Kelebihan:

- Sangat cepat untuk query dengan beberapa kondisi.

Kekurangan:

- Membutuhkan ruang penyimpanan lebih besar.
- Maintenance index lebih kompleks.

---

# 2.6 Benchmark Database

Benchmark merupakan proses pengukuran performa sistem menggunakan serangkaian pengujian yang dilakukan secara berulang dalam kondisi yang terkontrol.

Parameter benchmark yang digunakan pada penelitian ini meliputi:

- Response Time
- Throughput
- CPU Usage
- Memory Usage
- Query Execution Time

Benchmark dilakukan pada berbagai ukuran dataset untuk mengetahui pengaruh strategi indexing terhadap performa PostgreSQL.

---

# 2.7 Penelitian Terdahulu

Beberapa penelitian sebelumnya telah membahas optimasi performa database menggunakan teknik indexing.

| Peneliti | Tahun | Hasil Penelitian |
|----------|-------|------------------|
| Peneliti A | 2021 | Index mampu meningkatkan performa query SELECT. |
| Peneliti B | 2022 | Composite Index memberikan performa terbaik pada query kompleks. |
| Peneliti C | 2023 | PostgreSQL memiliki performa stabil pada dataset besar. |
| Peneliti D | 2024 | Strategi indexing mempengaruhi waktu eksekusi CRUD. |

Berdasarkan penelitian terdahulu, sebagian besar penelitian berfokus pada peningkatan performa query menggunakan teknik indexing. Oleh karena itu, penelitian ini melakukan analisis lebih lanjut terhadap performa PostgreSQL pada sistem E-Commerce menggunakan operasi CRUD dengan berbagai strategi indexing.

---

# 2.8 Kerangka Pemikiran

Penelitian ini diawali dengan pembangunan database PostgreSQL menggunakan dataset E-Commerce. Selanjutnya diterapkan tiga strategi indexing, yaitu No Index, Single Index, dan Composite Index.

Setelah itu dilakukan benchmark terhadap operasi CRUD menggunakan beberapa ukuran dataset. Data hasil benchmark kemudian dianalisis berdasarkan parameter Response Time, Throughput, CPU Usage, Memory Usage, dan Query Execution Time.

Hasil analisis digunakan untuk menentukan strategi indexing yang memberikan performa terbaik pada sistem E-Commerce.

---

# 2.9 Hipotesis Penelitian

Hipotesis yang diajukan dalam penelitian ini adalah:

**H0:** Tidak terdapat perbedaan performa PostgreSQL antara strategi No Index, Single Index, dan Composite Index.

**H1:** Terdapat perbedaan performa PostgreSQL antara strategi No Index, Single Index, dan Composite Index pada sistem E-Commerce berdasarkan hasil pengujian CRUD.