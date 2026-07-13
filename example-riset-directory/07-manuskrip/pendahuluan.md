# Pendahuluan

## 1.1 Latar Belakang

Perkembangan teknologi informasi telah mendorong pertumbuhan sistem E-Commerce yang semakin pesat. Berbagai perusahaan memanfaatkan platform digital untuk menyediakan layanan jual beli secara daring dengan jumlah pengguna dan transaksi yang terus meningkat. Kondisi tersebut menyebabkan kebutuhan terhadap sistem basis data yang mampu mengelola data dalam jumlah besar secara cepat, akurat, dan efisien menjadi sangat penting.

PostgreSQL merupakan salah satu Database Management System (DBMS) yang banyak digunakan karena memiliki kemampuan dalam menangani transaksi, menjaga integritas data, serta mendukung berbagai fitur optimasi query. PostgreSQL juga dikenal sebagai sistem basis data yang stabil dan memiliki performa tinggi sehingga banyak diterapkan pada aplikasi berskala kecil maupun besar, termasuk sistem E-Commerce.

Pada sistem E-Commerce, operasi basis data didominasi oleh aktivitas Create, Read, Update, dan Delete (CRUD). Operasi tersebut dilakukan secara terus-menerus, seperti penambahan data produk, pencarian produk, pembaruan stok barang, hingga penghapusan data yang sudah tidak digunakan. Seiring meningkatnya jumlah data yang tersimpan, performa query dapat mengalami penurunan apabila tidak didukung oleh strategi pengelolaan basis data yang tepat.

Salah satu teknik optimasi yang banyak digunakan adalah penerapan indexing. Index berfungsi mempercepat proses pencarian data sehingga waktu eksekusi query menjadi lebih singkat. Namun, penggunaan index juga dapat memberikan konsekuensi berupa meningkatnya waktu pada proses penyisipan, pembaruan, maupun penghapusan data karena sistem harus melakukan pemeliharaan terhadap struktur index yang ada.

Berbagai strategi indexing dapat diterapkan sesuai kebutuhan aplikasi, seperti tanpa index (No Index), Single Index, maupun Composite Index. Masing-masing strategi memiliki karakteristik yang berbeda sehingga diperlukan pengujian untuk mengetahui strategi yang paling sesuai berdasarkan pola akses data pada sistem E-Commerce.

Berdasarkan kondisi tersebut, penelitian ini dilakukan untuk menganalisis kinerja Database PostgreSQL pada sistem E-Commerce menggunakan operasi CRUD dengan beberapa strategi indexing. Hasil penelitian diharapkan dapat memberikan gambaran mengenai pengaruh setiap strategi indexing terhadap performa PostgreSQL serta menjadi referensi dalam menentukan strategi optimasi basis data yang tepat.

---

## 1.2 Rumusan Masalah

Berdasarkan latar belakang tersebut, maka rumusan masalah dalam penelitian ini adalah sebagai berikut.

1. Bagaimana performa Database PostgreSQL pada sistem E-Commerce dalam menjalankan operasi CRUD?
2. Bagaimana pengaruh strategi No Index, Single Index, dan Composite Index terhadap waktu eksekusi query?
3. Strategi indexing manakah yang memberikan performa terbaik pada berbagai ukuran dataset?
4. Bagaimana pengaruh strategi indexing terhadap penggunaan sumber daya sistem seperti CPU dan memori?

---

## 1.3 Tujuan Penelitian

Penelitian ini bertujuan untuk:

1. Menganalisis performa Database PostgreSQL pada sistem E-Commerce.
2. Mengukur waktu eksekusi operasi Create, Read, Update, dan Delete pada berbagai ukuran dataset.
3. Membandingkan performa strategi No Index, Single Index, dan Composite Index.
4. Menganalisis penggunaan sumber daya sistem selama proses benchmark.
5. Memberikan rekomendasi strategi indexing yang sesuai untuk meningkatkan performa PostgreSQL pada sistem E-Commerce.

---

## 1.4 Manfaat Penelitian

### Manfaat Teoritis

Penelitian ini diharapkan dapat menambah referensi mengenai optimasi performa database PostgreSQL, khususnya dalam penerapan strategi indexing pada sistem E-Commerce.

### Manfaat Praktis

Penelitian ini diharapkan dapat membantu pengembang aplikasi dalam menentukan strategi indexing yang sesuai sehingga mampu meningkatkan performa sistem, mempercepat proses pencarian data, serta mengoptimalkan penggunaan sumber daya server.

---

## 1.5 Ruang Lingkup Penelitian

Agar penelitian lebih terarah, maka ruang lingkup penelitian dibatasi pada hal-hal berikut.

1. Database yang digunakan adalah PostgreSQL.
2. Studi kasus dilakukan pada sistem E-Commerce.
3. Pengujian difokuskan pada operasi CRUD (Create, Read, Update, Delete).
4. Strategi indexing yang dibandingkan meliputi No Index, Single Index, dan Composite Index.
5. Parameter yang dianalisis meliputi Response Time, Throughput, CPU Usage, Memory Usage, dan Query Execution Time.
6. Pengujian dilakukan menggunakan beberapa ukuran dataset, yaitu 50.000, 100.000, 250.000, 500.000, dan 1.000.000 record.

---

## 1.6 Sistematika Penulisan

Penyusunan laporan penelitian ini terdiri atas beberapa bagian sebagai berikut.

- **Bab I Pendahuluan**, berisi latar belakang, rumusan masalah, tujuan, manfaat, ruang lingkup, dan sistematika penulisan.
- **Bab II Tinjauan Pustaka**, berisi teori-teori yang mendukung penelitian serta penelitian terdahulu.
- **Bab III Metodologi Penelitian**, berisi metode penelitian, desain eksperimen, dataset, perangkat yang digunakan, serta prosedur benchmark.
- **Bab IV Hasil dan Pembahasan**, berisi hasil benchmark, analisis performa, serta pembahasan terhadap hasil penelitian.
- **Bab V Kesimpulan dan Saran**, berisi kesimpulan penelitian dan rekomendasi untuk penelitian selanjutnya.