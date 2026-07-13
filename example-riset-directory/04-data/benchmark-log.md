# Benchmark Log

## Informasi Pengujian

Nama Penelitian :
Analisis Performa Database PostgreSQL pada Sistem E-Commerce Menggunakan Pengujian CRUD dan Strategi Indexing

DBMS :
PostgreSQL 16

Hardware

- Processor : Intel Core i5
- RAM : 8 GB
- Storage : SSD 512 GB

Sistem Operasi

Windows 11 64-bit

---

## Dataset

Dataset menggunakan data simulasi sistem e-commerce yang terdiri dari tabel:

- users
- products
- orders
- order_items

Jumlah data yang diuji

- 50.000 record
- 100.000 record
- 250.000 record
- 500.000 record
- 1.000.000 record

---

## Strategi Indexing

1. No Index
2. Single Index
3. Composite Index

---

## Operasi CRUD

- Create
- Read
- Update
- Delete

---

## Parameter Pengujian

Setiap skenario dijalankan sebanyak 10 kali kemudian dihitung nilai rata-rata.

Parameter yang dicatat:

- Response Time
- Throughput
- CPU Usage
- Memory Usage