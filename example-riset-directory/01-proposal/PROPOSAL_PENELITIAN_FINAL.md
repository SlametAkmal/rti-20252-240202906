# PROPOSAL PENELITIAN

## Judul

**Analisis Performa Database PostgreSQL pada Sistem E-Commerce Menggunakan Pengujian CRUD dan Strategi Indexing**

---

# BAB I
## PENDAHULUAN

### 1.1 Latar Belakang

Perkembangan teknologi informasi telah mendorong pertumbuhan sistem e-commerce sebagai salah satu media transaksi digital yang digunakan oleh berbagai jenis usaha. Sistem e-commerce menangani berbagai aktivitas seperti pengelolaan produk, transaksi pelanggan, pembayaran, hingga penyimpanan data dalam jumlah besar. Seluruh aktivitas tersebut sangat bergantung pada kinerja sistem basis data.

PostgreSQL merupakan salah satu Database Management System (DBMS) open source yang banyak digunakan karena memiliki kemampuan dalam mengelola data dalam jumlah besar, mendukung transaksi yang kompleks, serta menyediakan berbagai fitur optimasi seperti indexing dan query planner. Meskipun demikian, performa PostgreSQL dapat berbeda tergantung pada strategi indexing yang digunakan dan jenis operasi basis data yang dijalankan.

Operasi Create, Read, Update, dan Delete (CRUD) merupakan aktivitas utama pada sistem e-commerce. Perbedaan strategi indexing dapat memengaruhi waktu respon, penggunaan sumber daya, serta efisiensi proses pengolahan data. Oleh karena itu diperlukan penelitian untuk mengetahui pengaruh strategi indexing terhadap performa PostgreSQL pada sistem e-commerce.

Hasil penelitian ini diharapkan dapat menjadi referensi bagi pengembang sistem dalam menentukan strategi indexing yang sesuai sehingga sistem e-commerce mampu memberikan performa yang optimal.

---

### 1.2 Rumusan Masalah

1. Bagaimana performa PostgreSQL pada sistem e-commerce ketika menjalankan operasi CRUD?

2. Bagaimana pengaruh strategi indexing terhadap performa PostgreSQL?

3. Strategi indexing manakah yang memberikan performa terbaik pada berbagai skenario pengujian?

---

### 1.3 Tujuan Penelitian

1. Menganalisis performa PostgreSQL dalam menjalankan operasi CRUD pada sistem e-commerce.

2. Membandingkan performa PostgreSQL menggunakan beberapa strategi indexing.

3. Menentukan strategi indexing yang paling efektif berdasarkan hasil pengujian.

---

### 1.4 Manfaat Penelitian

#### Manfaat Teoritis

Memberikan tambahan referensi mengenai optimasi performa basis data PostgreSQL pada sistem e-commerce.

#### Manfaat Praktis

- Membantu pengembang memilih strategi indexing yang sesuai.
- Menjadi acuan dalam optimasi database PostgreSQL.
- Memberikan rekomendasi peningkatan performa sistem e-commerce.

---

### 1.5 Metode Penelitian

Penelitian menggunakan metode eksperimen dengan melakukan pengujian performa PostgreSQL pada sistem e-commerce menggunakan beberapa strategi indexing. Pengujian dilakukan terhadap operasi CRUD menggunakan dataset dengan ukuran berbeda. Data hasil pengujian kemudian dianalisis menggunakan statistik deskriptif dan inferensial untuk mengetahui perbedaan performa antar strategi indexing.