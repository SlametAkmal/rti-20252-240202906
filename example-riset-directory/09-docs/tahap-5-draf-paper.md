# Tahap 5 — Penulisan Draf Paper Jurnal

**Status:** Selesai — draf naskah ilmiah telah disusun dan dikonsolidasikan  
**Output utama:**  
- [../07-manuskrip/naskah-jurnal.md](../07-manuskrip/naskah-jurnal.md)
- [../07-manuskrip/naskah-jurnal.docx](../07-manuskrip/naskah-jurnal.docx)

**Bergantung pada:**  
[tahap-4-analisis-data.md](tahap-4-analisis-data.md)

---

# 1. Tujuan Tahap

Tahap kelima merupakan tahap penyusunan hasil penelitian menjadi manuskrip ilmiah yang siap disesuaikan dengan format publikasi jurnal.

Tujuan utama:

1. Menggabungkan seluruh hasil penelitian dari Tahap 1–4.
2. Menyusun argumentasi ilmiah berdasarkan hasil eksperimen.
3. Membuat pembahasan hubungan antara metode mitigasi dan dampak performa.
4. Menyediakan dokumen awal untuk publikasi Sinta 2 atau Scopus Q3–Q4.

Gaya penulisan yang digunakan:

- akademik formal,
- objektif,
- berbasis hasil eksperimen,
- menggunakan struktur paper ilmiah.

---

# 2. Struktur Manuskrip

Struktur naskah mengikuti format artikel penelitian:

07-manuskrip/

├── 00-outline.md
│
├── 01-abstrak.md
├── 02-pendahuluan.md
├── 03-tinjauan-pustaka.md
├── 04-metodologi.md
├── 05-hasil-analisis.md
├── 06-kesimpulan.md
├── 07-daftar-pustaka.md
│
├── naskah-jurnal.md
└── naskah-jurnal.docx


---

# 3. Deliverable Manuskrip

| Bagian | File | Status |
|---|---|---|
| Naskah utama | `naskah-jurnal.md` | ✅ selesai |
| Dokumen Word | `naskah-jurnal.docx` | ✅ selesai |
| Abstrak | `01-abstrak.md` | ✅ selesai |
| Pendahuluan | `02-pendahuluan.md` | ✅ selesai |
| Tinjauan pustaka | `03-tinjauan-pustaka.md` | ✅ selesai |
| Metodologi | `04-metodologi.md` | ✅ selesai |
| Hasil dan analisis | `05-hasil-analisis.md` | ✅ selesai |
| Kesimpulan | `06-kesimpulan.md` | ✅ selesai |
| Daftar pustaka | `07-daftar-pustaka.md` | ✅ selesai |

---

# 4. Isi Manuskrip

## 4.1 Abstrak

Dokumen abstrak berisi:

- latar belakang masalah,
- metode Redis-PostgreSQL Hybrid Caching,
- desain eksperimen,
- hasil utama,
- kontribusi penelitian.

Versi tersedia:

- Bahasa Indonesia
- Bahasa Inggris

---

## 4.2 Pendahuluan

Membahas:

- penggunaan JWT pada arsitektur microservices,
- mekanisme JWKS lookup,
- risiko flooding akibat `kid` acak,
- dampak terhadap resource backend,
- kebutuhan mekanisme caching dan rate limiting.

Rumusan masalah:

1. Bagaimana merancang mitigasi JWKS Endpoint Flooding?
2. Seberapa efektif hybrid caching mengurangi beban database?
3. Bagaimana dampaknya terhadap latency pengguna legitimate?
4. Bagaimana perbedaan serangan `kid unique` dan `kid pool`?

---

## 4.3 Tinjauan Pustaka

Materi:

- JSON Web Token (JWT),
- JSON Web Key Set (JWKS),
- Redis caching,
- PostgreSQL sebagai source of truth,
- rate limiting,
- keamanan API Gateway,
- penelitian terkait.

Referensi:

18 referensi

terdiri dari:

| Jenis | Jumlah |
|---|---:|
| RFC standar | 7 |
| Security advisory | 1 |
| Related work | 10 |

BibTeX tersedia:

02-literatur/daftar-pustaka.bib

---

## 4.4 Metodologi

Berisi:

- arsitektur sistem,
- desain database,
- konfigurasi Redis cache,
- implementasi API Gateway Go Echo,
- skenario eksperimen k6,
- desain baseline dan mitigasi.

Eksperimen:

CACHE_MODE:

none
|
baseline tanpa mitigasi

hybrid
|
Redis cache + PostgreSQL rate-limit


---

## 4.5 Hasil dan Analisis

Menggunakan data:

400 eksperimen

2 cache mode
x
5 traffic scenario
x
40 replikasi


Analisis:

- latency,
- throughput,
- D_perf,
- query reduction,
- CPU PostgreSQL,
- efektivitas cache.

Hasil utama:

- Query PostgreSQL turun 93–99.997%.
- Latency legitimate meningkat secara signifikan saat attack dicegah.
- Hybrid tidak menambah overhead pada kondisi normal.

---

## 4.6 Kesimpulan

Kesimpulan utama:

Redis-PostgreSQL Hybrid Caching berhasil mengurangi dampak JWKS Endpoint Flooding dengan:

- negative cache untuk invalid `kid`,
- positive cache untuk key valid,
- rate limiting berbasis PostgreSQL.

Namun ditemukan keterbatasan:

kid unique attack

menyebabkan:

- UPSERT rate-limit menjadi bottleneck,
- CPU PostgreSQL meningkat.

Hal ini menjadi peluang penelitian lanjutan.

---

# 5. Integrasi Hasil Eksperimen

Data penelitian berasal dari:

06-output/

├── tables/
│
├── descriptive_stats.csv
├── dperf.csv
├── mitigation_effectiveness.csv
├── db_query_reduction.csv
│
└── figures/


Figure yang digunakan:

| Figure | Fungsi |
|---|---|
| fig_latency_p95.png | Perbandingan latency |
| fig_dperf.png | Dampak performa |
| fig_db_queries_reduction.png | Pengurangan query |
| fig_postgres_cpu.png | Resource database |
| fig_resource_timeseries.png | Perubahan resource |

---

# 6. Status Publikasi

Target:

| Target | Status |
|---|---|
| Sinta 2 RESTI/Telematika | kandidat |
| Scopus Q3-Q4 | kandidat |

Manuskrip telah memenuhi komponen utama:

| Komponen | Status |
|---|---|
| Abstrak | ✅ |
| Pendahuluan | ✅ |
| Related Work | ✅ |
| Metodologi | ✅ |
| Eksperimen | ✅ |
| Analisis hasil | ✅ |
| Kesimpulan | ✅ |
| Referensi | ✅ |

---

# 7. Pekerjaan Sebelum Submission

Beberapa pekerjaan administratif masih diperlukan:

## 7.1 Pemilihan Bahasa

Pilihan:

### Bahasa Indonesia

Target:

- Jurnal Sinta 2 nasional.

### Bahasa Inggris

Target:

- jurnal internasional Scopus.

Status:

Belum ditentukan


---

## 7.2 Penyesuaian Template Jurnal

Perlu dilakukan:

- mengikuti format dua kolom,
- menyesuaikan heading,
- menyesuaikan format tabel,
- menyesuaikan style citation.

---

## 7.3 Finalisasi Figure dan Tabel

Perlu diperiksa:

- resolusi gambar,
- ukuran font caption,
- penomoran tabel,
- posisi figure.

Sumber:

06-output/figures/

06-output/tables/


---

## 7.4 Metadata Penulis

Yang masih perlu diisi:

- nama lengkap penulis,
- afiliasi,
- email institusi,
- ORCID (jika tersedia).

---

# 8. Kesimpulan Tahap

Tahap 5 berhasil mengubah hasil implementasi dan eksperimen menjadi draft paper jurnal lengkap.

Seluruh komponen utama penelitian telah tersedia:

- desain arsitektur,
- implementasi gateway,
- eksperimen 400 run,
- analisis statistik,
- pembahasan keamanan,
- daftar pustaka.

Tahap berikutnya adalah proses finalisasi format jurnal dan persiapan submission.