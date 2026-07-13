# Hasil dan Pembahasan

## 4.1 Hasil Benchmark

Pengujian dilakukan terhadap tiga strategi indexing menggunakan lima ukuran dataset.

Operasi yang diuji meliputi:

- Create
- Read
- Update
- Delete

Data benchmark diperoleh dari sepuluh kali pengulangan pada setiap skenario pengujian.

---

## 4.2 Hasil Response Time

Response Time menunjukkan lama waktu yang dibutuhkan PostgreSQL dalam menyelesaikan suatu query.

Tabel hasil pengujian menunjukkan bahwa waktu eksekusi meningkat seiring bertambahnya ukuran dataset.

Strategi Composite Index memberikan waktu respon paling cepat pada operasi Read, sedangkan No Index menghasilkan waktu respon paling tinggi pada dataset berukuran besar.

---

## 4.3 Hasil Throughput

Throughput menunjukkan jumlah query yang dapat diproses setiap detik.

Berdasarkan hasil benchmark, Composite Index mampu menghasilkan throughput tertinggi pada operasi Read.

No Index memiliki throughput paling rendah ketika ukuran dataset mencapai satu juta record.

---

## 4.4 Penggunaan CPU

Penggunaan CPU meningkat ketika ukuran dataset bertambah.

No Index menghasilkan penggunaan CPU lebih tinggi dibandingkan Single Index dan Composite Index karena PostgreSQL harus melakukan Full Table Scan.

---

## 4.5 Penggunaan Memori

Penggunaan memori dipengaruhi oleh jumlah data serta strategi indexing yang digunakan.

Composite Index membutuhkan ruang penyimpanan lebih besar karena harus menyimpan struktur index tambahan.

Namun peningkatan penggunaan memori tersebut sebanding dengan peningkatan performa query.

---

## 4.6 Perbandingan Strategi Indexing

### No Index

Kelebihan

- Insert lebih cepat.
- Maintenance database lebih ringan.

Kekurangan

- Query Read lambat.
- Tidak cocok untuk dataset besar.

---

### Single Index

Kelebihan

- Performa cukup baik.
- Overhead relatif kecil.

Kekurangan

- Kurang optimal untuk query dengan beberapa kondisi.

---

### Composite Index

Kelebihan

- Query Read paling cepat.
- Sangat efektif pada dataset besar.

Kekurangan

- Membutuhkan ruang penyimpanan lebih besar.
- Insert dan Update sedikit lebih lambat.

---

## 4.7 Pembahasan

Hasil penelitian menunjukkan bahwa strategi indexing memiliki pengaruh terhadap performa PostgreSQL.

Pada operasi Read, Composite Index memberikan peningkatan performa paling signifikan karena mampu mengurangi proses Full Table Scan.

Sebaliknya, pada operasi Insert, No Index menghasilkan waktu eksekusi paling cepat karena tidak memerlukan proses pembaruan struktur index.

Dengan demikian, pemilihan strategi indexing harus disesuaikan dengan karakteristik beban kerja aplikasi.

---

## 4.8 Implikasi Penelitian

Hasil penelitian dapat dijadikan acuan bagi pengembang sistem E-Commerce dalam menentukan strategi indexing yang sesuai.

Untuk aplikasi yang didominasi aktivitas pencarian data, Composite Index menjadi pilihan yang paling direkomendasikan.

Sedangkan untuk aplikasi dengan frekuensi Insert yang tinggi, penggunaan Single Index atau No Index dapat menjadi alternatif yang lebih efisien.

---

## 4.9 Ringkasan Hasil

Secara keseluruhan penelitian menunjukkan bahwa:

- Composite Index memberikan performa terbaik pada operasi Read.
- Single Index memberikan performa yang seimbang.
- No Index memiliki performa terbaik pada operasi Insert.
- Ukuran dataset berpengaruh terhadap waktu eksekusi query.
- Strategi indexing berpengaruh terhadap penggunaan CPU dan memori PostgreSQL.