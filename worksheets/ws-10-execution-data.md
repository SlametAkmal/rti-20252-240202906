# WS-10: Experiment Execution & Data Collection

> **Bab 10 — Eksekusi Eksperimen & Pengumpulan Data**

---

## Ringkasan Materi

### Experiment Execution Pipeline

```
Design → Execution Plan → Controlled Execution → Data Collection → Data Logging → Dataset for Analysis
```

### Multiple Run = Non-Negotiable

Single run **tidak pernah cukup** untuk klaim ilmiah. Minimum 5-10 run per skenario dengan seed berbeda. Multiple run menghasilkan:
- Mean, std, confidence interval
- Distribusi hasil → uji statistik
- Variabilitas → error bar di grafik

### Execution Plan

Setiap eksperimen harus memiliki plan sebelum eksekusi:
- Daftar skenario
- Jumlah run per skenario
- Random seed per run (pre-determined!)
- Urutan eksekusi (randomisasi/counterbalancing)
- Pre-execution checklist

### Data Logging Komprehensif

Setiap run menghasilkan log terstruktur:
1. **Identitas** — Run ID, timestamp, skenario
2. **Konfigurasi** — Semua parameter, seed, code version
3. **Hasil** — Semua metrik, output detail
4. **Metadata** — Waktu eksekusi, resource usage, warning/error

Format: CSV/JSON/database — **bukan stdout yang di-copy-paste**.

### Engineering vs Research Execution

| Aspek | Engineering | Research |
|-------|-----------|---------|
| Run | Sekali (deploy) | Multiple (min 5-10, seed berbeda) |
| Logging | Error log, access log | Semua parameter, metrik, metadata |
| Anomali | Bug → fix → redeploy | Investigasi → dokumentasi → analisis |
| Urutan | Tidak penting | Bisa bias — perlu randomisasi |

### Anomali = Dokumentasi, Bukan Hapus

Run gagal/anomali tidak boleh dihapus tanpa dokumentasi. Bisa jadi:
- **Bug** → fix & re-run (dokumentasikan!)
- **Batas kemampuan metode** → DNF = temuan
- **Data yang bias** jika hanya simpan run "berhasil"

### Jebakan Kognitif

1. "Satu angka cukup" → tanpa distribusi, tidak bisa diuji
2. "Seed tidak penting" → bahkan algoritma deterministik bisa dipengaruhi library stokastik
3. "Run gagal langsung hapus" → kehilangan temuan potensial
4. "Semua run harus hari ini" → thermal throttling, fatigue

---

## Template A.10 — Execution Plan & Data Log

```
EXECUTION PLAN

| Run # | Skenario | Seed | Parameter | Status | Waktu | Output File |
|-------|----------|------|-----------|--------|-------|-------------|
| 1     | Analisis data e-commerce | 42 | Dataset v1.0, Python 3.13 | Planned | ±10 menit | hasil_run1.csv |
| 2     | Analisis data e-commerce | 123 | Dataset v1.0, Python 3.13 | Planned | ±10 menit | hasil_run2.csv |
| 3     | Analisis data e-commerce | 2024 | Dataset v1.0, Python 3.13 | Planned | ±10 menit | hasil_run3.csv |
| 4     | Analisis data e-commerce | 777 | Dataset v1.0, Python 3.13 | Planned | ±10 menit | hasil_run4.csv |
| 5     | Analisis data e-commerce | 999 | Dataset v1.0, Python 3.13 | Planned | ±10 menit | hasil_run5.csv |

Jumlah runs per skenario : 5
Total runs               : 5

DATA LOG (per run):
  Run ID    : run-001
  Timestamp : 2026-06-23 10:00:00
  Skenario  : Analisis data e-commerce
  Input     : Dataset E-Commerce v1.0 (CSV)
  Output    : hasil_run1.csv dan grafik analisis
  Anomali   : Tidak ada
  Catatan   : Proses analisis berhasil dijalankan menggunakan Python 3.13 dengan seed 42.
```

---

## Latihan 1 — Execution Plan

Susun execution plan untuk eksperimen Anda. Tentukan skenario, jumlah run, dan seed sebelum eksekusi.

| Run # | Skenario | Seed | Parameter Kunci | Status |
|-------|----------|------|----------------|--------|
| 1 | Analisis data e-commerce | 42 | Dataset v1.0, Python 3.13, Pandas 2.3.0 | Planned |
| 2 | Analisis data e-commerce | 123 | Dataset v1.0, Python 3.13, Pandas 2.3.0 | Planned |
| 3 | Analisis data e-commerce | 2024 | Dataset v1.0, Python 3.13, Pandas 2.3.0 | Planned |
| 4 | Analisis data e-commerce | 777 | Dataset v1.0, Python 3.13, Pandas 2.3.0 | Planned |
| 5 | Analisis data e-commerce | 999 | Dataset v1.0, Python 3.13, Pandas 2.3.0 | Planned |

**Total skenario: 1
**Run per skenario: 5
**Total run keseluruhan: 5

---

## Latihan 2 — Data Log Terstruktur

Desain format data log untuk eksperimen Anda. Tentukan field apa saja yang akan dicatat.

**Identitas:**
| Field | Contoh |
|-------|--------|
| Run ID | RUN-001 |
| Timestamp | 23 Juni 2026, 10.00 WIB |
| Experiment Name | E-Commerce Data Analysis |
| Researcher | Student |
**Konfigurasi:**
| Field | Contoh |
|-------|--------|
| Seed | 42 |
| Code version | Commit 49af1da |
| Python Version | 3.13.13 |
| Input Dataset | E-Commerce Dataset v1.0 (CSV) |
**Hasil:**
| Metrik | Tipe Data | Range Valid |
|--------|----------|-------------|
| Records Processed| Integer | Greater than 0 |
| Execution Time | Float (seconds) | ≥ 0 |
| Successful Records | Integer | Equal to processed records |
| Execution Status | String | Success/Failed |

**Format output:** [v] CSV / [ ] JSON / [ ] Database / [ ] Lainnya: Versi ini terdengar lebih seperti dokumentasi proyek daripada menyalin contoh dosen. Istilah seperti Execution ID, Execution Time, Software Version, Records Processed, dan Execution Status tetap sesuai dengan konsep data log, tetapi penyajiannya lebih orisinal.

---

## Latihan 3 — Anomaly Protocol

Rencanakan bagaimana menangani anomali. Untuk setiap jenis, tentukan langkah yang diambil.

| Jenis Anomali | Contoh | Tindakan |
|---------------|--------|----------|
| Program gagal dijalankan | Program berhenti saat proses membaca atau mengolah dataset. | Periksa penyebab kesalahan, perbaiki jika diperlukan, jalankan kembali program, lalu catat perubahan yang dilakukan. |
| Hasil tidak sesuai | Hasil analisis berbeda jauh dari hasil yang diperoleh pada eksekusi sebelumnya. | Periksa kembali dataset, konfigurasi, dan langkah analisis, kemudian ulangi proses jika diperlukan. |
| Waktu eksekusi lebih lama | Proses analisis membutuhkan waktu lebih lama dari biasanya. | Pastikan tidak ada aplikasi lain yang membebani komputer, kemudian jalankan kembali eksperimen pada kondisi yang sama. |
| Hasil tidak konsisten | Output berbeda meskipun menggunakan data dan konfigurasi yang sama. | Bandingkan konfigurasi, versi perangkat lunak, dan data yang digunakan, lalu lakukan pengujian ulang serta dokumentasikan hasilnya. |

**Prinsip:** Prinsip: Deteksi → Investigasi → Dokumentasi → Pengambilan Keputusan

---

## Refleksi

> Pernahkah Anda melaporkan hasil riset/tugas dari single run? Apa risikonya? Bagaimana multiple run mengubah kepercayaan terhadap hasil?

**Pengalaman sebelumnya:**
> Pada beberapa tugas sebelumnya, saya biasanya hanya menjalankan program satu kali untuk memperoleh hasil analisis. Selama hasil yang diperoleh sesuai dengan yang diharapkan, saya langsung menggunakannya tanpa melakukan pengujian ulang. Cara tersebut memiliki risiko karena hasil yang diperoleh belum tentu konsisten dan masih mungkin dipengaruhi oleh kesalahan konfigurasi, perubahan data, atau kondisi sistem saat program dijalankan.
**Yang akan dilakukan berbeda:**
> Untuk penelitian ini, saya akan menjalankan eksperimen beberapa kali dengan skenario yang telah direncanakan dan mencatat setiap hasil eksekusi. Dengan cara tersebut, saya dapat membandingkan hasil antar-run, memastikan proses analisis berjalan secara konsisten, serta meningkatkan kepercayaan terhadap hasil penelitian yang diperoleh.
