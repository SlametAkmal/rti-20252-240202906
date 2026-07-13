# Performance Analysis

## Pendahuluan

Analisis performa dilakukan untuk mengevaluasi kinerja Database PostgreSQL pada sistem E-Commerce berdasarkan hasil benchmark operasi CRUD (Create, Read, Update, Delete). Pengujian dilakukan menggunakan beberapa ukuran dataset dan tiga strategi indexing, yaitu **No Index**, **Single Index**, dan **Composite Index**.

Tujuan analisis ini adalah mengetahui pengaruh strategi indexing terhadap waktu eksekusi query, penggunaan sumber daya sistem, serta efisiensi PostgreSQL dalam menangani beban kerja yang berbeda.

---

# Parameter yang Dianalisis

Parameter yang digunakan meliputi:

- Response Time (ms)
- Query Execution Time (ms)
- Throughput (query/second)
- CPU Usage (%)
- Memory Usage (MB)

---

# Analisis Operasi CREATE

Operasi Create digunakan untuk mengukur kemampuan PostgreSQL dalam menyimpan data baru ke dalam database.

Hasil benchmark menunjukkan bahwa:

- No Index memberikan waktu insert paling cepat karena tidak melakukan pembaruan secondary index.
- Single Index membutuhkan waktu sedikit lebih lama karena sistem harus memperbarui satu index.
- Composite Index memiliki waktu insert paling tinggi akibat proses pembaruan beberapa kolom index secara bersamaan.

Semakin banyak index yang digunakan, semakin besar overhead pada proses penyimpanan data.

---

# Analisis Operasi READ

Operasi Read merupakan operasi yang paling sering dilakukan pada sistem E-Commerce sehingga menjadi fokus utama penelitian.

Hasil benchmark menunjukkan bahwa:

- No Index menghasilkan Full Table Scan pada dataset berukuran besar.
- Single Index mampu mempercepat pencarian berdasarkan satu kolom.
- Composite Index memberikan performa terbaik pada query yang menggunakan lebih dari satu kondisi pencarian.

Keuntungan Composite Index semakin terlihat ketika jumlah data meningkat.

---

# Analisis Operasi UPDATE

Operasi Update memerlukan proses pencarian data sebelum dilakukan perubahan.

Berdasarkan hasil benchmark:

- No Index membutuhkan waktu lebih lama pada dataset besar.
- Single Index memberikan peningkatan performa dibandingkan tanpa index.
- Composite Index mempercepat proses pencarian, namun memerlukan waktu tambahan untuk memperbarui struktur index.

---

# Analisis Operasi DELETE

Operasi Delete menunjukkan pola yang hampir sama dengan Update.

Penggunaan index mampu mempercepat proses pencarian record yang akan dihapus, tetapi juga menambah proses maintenance terhadap struktur index.

---

# Analisis Penggunaan CPU

Penggunaan CPU meningkat seiring bertambahnya ukuran dataset.

Hasil pengamatan menunjukkan bahwa:

- No Index memiliki penggunaan CPU tinggi ketika melakukan Full Table Scan.
- Single Index mampu mengurangi beban CPU.
- Composite Index memberikan penggunaan CPU paling stabil pada query SELECT.

---

# Analisis Penggunaan Memori

Penggunaan memori dipengaruhi oleh:

- ukuran dataset
- cache PostgreSQL
- jumlah index

Composite Index membutuhkan memori lebih besar dibandingkan No Index, namun memberikan peningkatan performa query.

---

# Perbandingan Strategi Indexing

| Strategi | Kelebihan | Kekurangan |
|-----------|-----------|------------|
| No Index | Insert cepat | Read lambat |
| Single Index | Seimbang | Kurang optimal untuk query kompleks |
| Composite Index | Read tercepat | Insert dan Update lebih lambat |

---

# Interpretasi Hasil

Berdasarkan hasil benchmark dapat disimpulkan bahwa strategi indexing memberikan pengaruh signifikan terhadap performa PostgreSQL.

- No Index sesuai untuk proses yang didominasi operasi Insert.
- Single Index cocok digunakan pada aplikasi dengan beban kerja yang seimbang.
- Composite Index menjadi pilihan terbaik untuk sistem E-Commerce yang memiliki aktivitas pencarian data sangat tinggi.

---

# Kesimpulan

Hasil analisis menunjukkan bahwa pemilihan strategi indexing harus disesuaikan dengan karakteristik beban kerja aplikasi.

Untuk sistem E-Commerce yang didominasi operasi pencarian produk, penggunaan Composite Index memberikan performa terbaik meskipun membutuhkan sumber daya penyimpanan dan proses maintenance index yang lebih besar dibandingkan strategi lainnya.