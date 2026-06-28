# WS-13: Data Preprocessing

> **Bab 13 — Preprocessing & Persiapan Data untuk Analisis**

---

## Ringkasan Materi

### Data Refinement Pipeline

```
Raw Data → Cleaning → Transformation → Normalization → Processed Data → Analysis Ready
```

Setiap tahap memiliki tujuan berbeda. **Preprocessing bukan langkah teknis biasa** — setiap keputusan preprocessing adalah keputusan riset yang bisa mengubah kesimpulan.

### Empat Prinsip Preprocessing

| Prinsip | Deskripsi |
|---------|----------|
| **Consistency** | Metode sama untuk data yang sama |
| **Transparency** | Setiap langkah terdokumentasi |
| **Reproducibility** | Orang lain bisa mengulang dengan hasil sama |
| **Minimal Distortion** | Ubah sesedikit mungkin; jika normalisasi tidak perlu, jangan lakukan |

### Cleaning Triad

| Masalah | Strategi | Risiko |
|---------|---------|--------|
| **Missing values** | | |
| — Listwise deletion | Missing < 5%, random | Data loss |
| — Mean/median imputation | Sedikit missing, dist. normal | Mengurangi variabilitas |
| — Model-based imputation | Banyak missing, pola sistematis | Introduces dependency |
| — Flag & separate | Missing karena alasan substantif | Kompleksitas analisis |
| **Duplikat** | Identifikasi → verifikasi → hapus | False positive (data mirip ≠ duplikat) |
| **Error format** | Standardisasi tipe, encoding | Kehilangan informasi saat konversi |

### Normalisasi — Kapan & Metode Mana

| Metode | Formula | Output | Sensitif Outlier? |
|--------|---------|--------|-------------------|
| Min-max | (x-min)/(max-min) | [0, 1] | Ya |
| Z-score | (x-mean)/std | Unbounded | Lebih robust |
| Robust scaling | (x-median)/IQR | Unbounded | Paling robust |

**Kunci:** Parameter normalisasi harus dihitung dari **training set saja** — bukan seluruh data. Pelanggaran = **data leakage**.

### Data Leakage Prevention

Data leakage terjadi ketika informasi dari test set "bocor" ke preprocessing:
- Normalisasi parameter dari seluruh dataset ← **SALAH**
- Cross-validation dilakukan sebelum split ← **SALAH**
- Feature selection menggunakan label test set ← **SALAH**

### Jebakan Kognitif

1. "Preprocessing cuma teknis — tidak perlu detail" → bisa ubah kesimpulan
2. "Lebih banyak preprocessing = lebih bersih = lebih baik" → over-processing distorsi data
3. "Normalisasi selalu diperlukan" → belum tentu, tergantung metode analisis
4. "Imputation sama untuk semua situasi" → strategi harus sesuai konteks

---

## Template A.13 — Preprocessing Documentation Log

```
PREPROCESSING LOG

Dataset           : Data hasil survei Peran E-Commerce dalam Pengembangan Bisnis
Jumlah data awal  : 100 responden

Cleaning:
| Masalah | Jumlah Kasus | Penanganan | Justifikasi |
|---------|-------------|------------|-------------|
| Missing    | 3            | Menghapus data kosong   | Jumlah sedikit dan tidak memengaruhi analisis |
| Duplikat   | 1            | Menghapus data duplikat | Agar setiap responden hanya dihitung satu kali |
| Error      | 2            | Memperbaiki format data | Menyeragamkan format jawaban |

Transformation:
| Transformasi | Variabel | Detail | Alasan |
|-------------|----------|--------|--------|
| Encoding | Tingkat penggunaan | Sangat Rendah=1, Rendah=2, Sedang=3, Tinggi=4, Sangat Tinggi=5 | Agar dapat dianalisis secara numerik |

Normalization:
  Metode    : Tidak dilakukan
  Alasan    : Data berupa skala Likert sehingga tidak memerlukan normalisasi
  Parameter : Tidak digunakan

Leakage Check:
  [x] Parameter normalisasi dari training set saja
  [x] Tidak ada informasi test set dalam preprocessing
  [x] Cross-validation dilakukan setelah split

Jumlah data akhir :  96 responden
Script tersedia   : [ ] Ya → path: - | [v] Belum
```

---

## Latihan 1 — Cleaning Plan

Periksa dataset Anda (atau dataset contoh) dan dokumentasikan masalah yang ditemukan.

| Masalah | Jumlah Kasus | Penanganan | Justifikasi |
|---------|-------------|------------|-------------|
| Data kosong | 3 | Menghapus data | Jumlah sedikit sehingga tidak memengaruhi hasil |
| Data duplikat | 1 | Menghapus data | Menghindari perhitungan ganda |
| Format jawaban tidak konsisten | 2 | Menyesuaikan format | Agar seluruh data memiliki format yang sama |
| Nilai di luar skala | 0 | Tidak ada tindakan | Tidak ditemukan kesalahan |

**Jumlah data sebelum cleaning:** 100
**Jumlah data setelah cleaning:** 96
**Persentase data yang hilang/berubah:** 4%

---

## Latihan 2 — Normalisasi Decision

Tentukan apakah data Anda perlu normalisasi, dan jika ya, metode apa yang tepat.

| Variabel | Range Asli | Distribusi | Outlier? | Metode Normalisasi | Alasan |
|----------|-----------|-----------|----------|-------------------|--------|
| Tingkat penggunaan e-commerce | 1–5 | Hampir normal | Tidak | Tidak dilakukan | Data menggunakan skala Likert |
| Kepuasan pengguna | 1–5 | Normal | Tidak| Tidak dilakukan | Nilai sudah seragam |
| Dampak terhadap penjualan | 1–5 | Normal | Tidak | Tidak dilakukan | Tidak menggunakan algoritma berbasis jarak |

**Apakah normalisasi diperlukan?** [ ] Ya / [v] Tidak
**Justifikasi:**
> Data penelitian menggunakan skala Likert dengan rentang nilai yang sama sehingga tidak memerlukan proses normalisasi. Data dapat langsung digunakan untuk analisis statistik deskriptif maupun inferensial.

**Leakage check:**
- [v] Parameter dihitung dari training set saja
- [v] Normalisasi diterapkan setelah train-test split

---

## Latihan 3 — Preprocessing Report

Buat ringkasan preprocessing lengkap — dokumentasi yang cukup bagi orang lain untuk mereplikasi.

```
PREPROCESSING SUMMARY

1. Dataset:    Data survei mengenai peran e-commerce dalam pengembangan bisnis.

2. Data awal: 100 records, 8 features
3. Cleaning:
   - Missing values: 3 kasus, metode: dihapus
   - Duplikat: 1 kasus, tindakan: dihapus
   - Error: 2 kasus, tindakan: diperbaiki agar konsisten
4. Transformation:    Jawaban kategori diubah menjadi nilai numerik menggunakan skala Likert 1–5.
5. Normalisasi: Tidak dilakukan (data menggunakan skala Likert 1–5) (metode), parameter dari normalisasi tidak digunakan.
6. Data akhir: 96 records, 8 features
7. Leakage check: [v] Lulus / [ ] Ada masalah
```

---

## Refleksi

> Apakah Anda pernah melakukan normalisasi "karena biasa dilakukan" tanpa mempertimbangkan apakah benar-benar diperlukan? Apa risiko over-preprocessing?

> Saya pernah menganggap normalisasi sebagai langkah yang selalu harus dilakukan sebelum analisis. Setelah mempelajari materi ini, saya memahami bahwa normalisasi hanya diperlukan pada kondisi tertentu sesuai dengan metode analisis yang digunakan.

> Over-preprocessing dapat menyebabkan data kehilangan karakteristik aslinya sehingga hasil analisis menjadi kurang representatif. Oleh karena itu, setiap proses preprocessing harus memiliki alasan yang jelas dan didokumentasikan dengan baik.
