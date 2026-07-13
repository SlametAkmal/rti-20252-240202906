# Benchmark Procedure

## Persiapan

1. Menginstal PostgreSQL 16.
2. Membuat database E-Commerce.
3. Mengimpor dataset.
4. Membuat tabel.
5. Membuat strategi indexing.

## Pelaksanaan Benchmark

Tahap pertama dilakukan pengujian menggunakan No Index.

Selanjutnya dilakukan pengujian menggunakan Single Index.

Tahap terakhir dilakukan menggunakan Composite Index.

Setiap pengujian terdiri atas operasi:

- Create
- Read
- Update
- Delete

Masing-masing operasi dijalankan sebanyak 10 kali.

## Pengambilan Data

Data yang dicatat meliputi:

- Waktu eksekusi query
- Throughput
- Penggunaan CPU
- Penggunaan Memori

Seluruh data disimpan pada folder **04-data**.

## Validasi

Data benchmark diperiksa kembali untuk memastikan tidak terdapat error maupun hasil pengujian yang tidak valid sebelum dilakukan analisis statistik.