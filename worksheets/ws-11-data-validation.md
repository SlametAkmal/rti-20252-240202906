# WS-11: Data Validation & Integrity

> **Bab 11 — Validasi Data & Integritas**

---

## Ringkasan Materi

### Data Trust Model

```
Raw Data → Data Cleaning → Consistency Check → Validation Process → Trusted Data
```

Data mentah belum bisa dipercaya. Harus melewati pipeline validasi sebelum siap untuk analisis statistik.

### Empat Pilar Data Quality

| Pilar | Deskripsi | Contoh Pelanggaran |
|-------|----------|-------------------|
| **Accuracy** | Nilai dalam range masuk akal | Akurasi = 1.5 (di luar [0,1]) |
| **Consistency** | Format seragam di semua run | Run 1: CSV, Run 2: JSON |
| **Completeness** | Tidak ada data hilang dari plan | 97 dari 100 run tercatat |
| **Validity** | Data sesuai desain eksperimen | Parameter baseline tercampur treatment |

### Proses Validasi Progresif

1. **Format validation** — Tipe file, header, kolom
2. **Range validation** — Nilai dalam batas logis
3. **Consistency validation** — Format seragam antar-run
4. **Logic validation** — Data cocok dengan desain eksperimen

Jika gagal di langkah awal → tidak perlu lanjut.

### Anomaly Detection — 3 Jenis

| Jenis | Deskripsi | Deteksi |
|-------|----------|---------|
| **Statistical outlier** | Nilai di luar distribusi normal | IQR: < Q1-1.5×IQR atau > Q3+1.5×IQR |
| **Contextual anomaly** | Normal absolut, abnormal dalam konteks | Run 1-10: ~91%, Run 11-20: ~88% |
| **Pattern anomaly** | Pola sistematis (bukan random) | Performa menurun berurutan |

**Prinsip:** Detect → Investigate → Document → Decide — **JANGAN langsung hapus.**

### Engineering vs Research Validation

| Aspek | Engineering | Research |
|-------|-----------|---------|
| Tujuan | Data sesuai spesifikasi bisnis | Data layak untuk analisis statistik |
| Missing data | Impute / set default | Investigasi penyebab → dokumentasi |
| Outlier | Bug → fix | Mungkin temuan → investigasi |
| Dokumentasi | Minimal (log error) | Komprehensif (anomali + keputusan) |

### Jebakan Kognitif

1. "Logging otomatis ≠ data benar" → bisa ada bug di logger
2. "Outlier = hapus" → bisa jadi temuan penting
3. "Dataset kecil tidak perlu validasi" → justru lebih rentan
4. "Mean normal = data benar" → [94, 95, 93, **44**, 94] → mean 84% terlihat wajar

---

## Template A.11 — Data Validation Checklist

```
DATA VALIDATION CHECKLIST

Completeness:
  [v] Semua skenario tercakup
  [v] Jumlah run sesuai rencana
  [v] Tidak ada file output hilang
  Missing: ____ dari ____ data points

Format Consistency:
  [v] Semua file format sama (CSV/JSON/...)
  [v] Header konsisten
  [v] Tipe data konsisten (numerik tetap numerik)

Range & Logic:
  [v] Nilai dalam range masuk akal
  [v] Tidak ada waktu negatif
  [v] Metrik 0–100%, tidak di luar range
  Anomali ditemukan: ____________________

Cross-Validation:
  [v] Run identik → hasil mendekati
  [v] Trend konsisten dengan ekspektasi teori

Keputusan:
  [v] Data siap analisis
  [ ] Perlu cleaning
  [ ] Perlu re-run (skenario: ____)
```

---

## Latihan 1 — Completeness Check

Verifikasi apakah semua data yang direncanakan sudah terkumpul.

| Skenario | Run Direncanakan | Run Tercatat | Missing | Alasan |
|----------|-----------------|-------------|---------|--------|
| Analisis data transaksi e-commerce | 5 | 5 | 0 | Semua proses berjalan sesuai rencana. |
| Validasi hasil analisis | 5 | 5 | 0 | Tidak ditemukan kendala selama pengujian. |


**Total expected:** 10 | **Total actual:** 10 | **Missing:** 0

**Keputusan untuk data missing:**
> Seluruh data yang direncanakan telah berhasil dikumpulkan sehingga tidak diperlukan pengambilan data tambahan maupun pengulangan proses. Data dinilai lengkap dan siap digunakan pada tahap analisis berikutnya.

---

## Latihan 2 — Anomaly Investigation

Periksa data Anda untuk anomali. Gunakan metode IQR atau z-score.

**Dataset sampel (atau data Anda sendiri):**

| Run | Accuracy (%) |
|-----|-------------|
| 1 | 12.3 |
| 2 | 12.5 |
| 3 | 12.4 |
| 4 | 12.8 |
| 5 | 12.2 |

**Deteksi outlier:**
- Q1 = 12.25 | Q3 = 14.15 | IQR = 1,90
- Batas bawah (Q1 - 1.5×IQR) = 9.40
- Batas atas (Q3 + 1.5×IQR) = 17.00
- Outlier terdeteksi: Tidak ada

**Investigasi (untuk setiap outlier):**

| Outlier | Nilai | Kemungkinan Penyebab | Keputusan |
|---------|-------|---------------------|-----------|
| Run 4 | 15.8 detik | Komputer menjalankan beberapa aplikasi lain sehingga proses analisis menjadi lebih lambat. | Eksekusi diulang setelah menutup aplikasi yang tidak diperlukan dan hasil dicatat kembali. |

---

## Latihan 3 — Validation Report

Buat laporan validasi ringkas untuk dataset eksperimen Anda.

**1. Completeness:** 100% data berhasil dikumpulkan sesuai dengan rencana eksperimen.
**2. Format:** [v] Konsisten / [ ] Ada inkonsistensi: Seluruh data menggunakan format CSV dengan struktur kolom yang sama pada setiap file.
**3. Range check (anomali):** Tidak ditemukan nilai yang berada di luar batas yang telah ditentukan. Seluruh hasil analisis masih berada pada rentang yang wajar.
**4. Logic check:** [v] Parameter sesuai plan / [ ] Ada ketidaksesuaian: Seluruh proses dijalankan menggunakan dataset, konfigurasi, dan versi perangkat lunak yang sama seperti yang telah ditetapkan pada tahap perencanaan.

**Kesimpulan:** [v] Data siap analisis / [ ] Perlu tindakan: ____

---

## Refleksi

> Apa perbedaan antara "data yang benar" dan "data yang dipercaya"? Mengapa proses validasi formal diperlukan meskipun data dikumpulkan secara otomatis?

> Data yang benar belum tentu dapat langsung dipercaya karena masih ada kemungkinan terjadi kesalahan pada proses pengumpulan, penyimpanan, atau pengolahan data. Sebaliknya, data yang dipercaya adalah data yang telah melalui proses pemeriksaan sehingga kualitas dan konsistensinya dapat dipastikan.
> Meskipun data dikumpulkan secara otomatis, proses validasi tetap diperlukan untuk memastikan bahwa tidak ada data yang hilang, format tetap konsisten, serta hasil yang diperoleh sesuai dengan tujuan penelitian. Dengan adanya validasi, hasil analisis menjadi lebih akurat dan dapat dipertanggungjawabkan.
