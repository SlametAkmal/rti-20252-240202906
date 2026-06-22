# WS-09: Implementation & Environment

> **Bab 9 — Implementasi Riset & Kontrol Lingkungan**

---

## Ringkasan Materi

### Implementasi Riset ≠ Coding Biasa

Tujuan implementasi riset bukan membuat software yang berfungsi, melainkan membangun **instrumen pengukuran yang konsisten**. Setiap modul harus di-mapping ke variabel (dari Bab 6), parameter harus config-driven, dan logging aktif dari hari pertama.

> **Mengapa reproducibility penting?** Sains dibangun di atas prinsip verifikasi — temuan harus bisa dikonfirmasi oleh peneliti lain. _Replicability crisis_ yang terjadi di banyak paper riset ML/AI disebabkan oleh environment tidak terdokumentasi: orang lain tidak bisa reproduksi, hasil diragukan, kepercayaan terhadap temuan hilang. Prinsip: **dokumentasi environment = snapshot kredibilitas riset Anda.**

### Reproducible Implementation Model

```
Design → Implementation → Environment Setup → Execution Consistency → Reproducibility → Trustworthy Result
```

Setiap transisi memiliki syarat:
- Design → Implementation: kode sesuai mapping variabel-ke-komponen
- Implementation → Environment: versi, dependency, seed, path, OS eksplisit
- Environment → Consistency: seed terkunci, urutan deterministik
- Consistency → Reproducibility: dokumentasi lengkap
- Reproducibility → Trust: siapa pun ikuti dokumentasi → hasil sama/serupa

### Repeatability vs Reproducibility

| Level | Peneliti | Environment | Hasil |
|-------|---------|-------------|-------|
| **Repeatability** | Sama | Sama | Sama persis |
| **Reproducibility** | Berbeda | Berbeda (ikuti docs) | Sama/serupa |

Capai **repeatability** dulu, baru **reproducibility**.

### Engineering vs Research Perspective

| Aspek | Engineering | Research |
|-------|-----------|---------|
| Tujuan | Sistem berfungsi untuk user | Instrumen pengukuran konsisten |
| Dependency | Update ke terbaru | Lock di versi spesifik |
| Testing | Unit, integration, E2E | Repeatability test (run ulang → sama?) |
| Dokumentasi | User guide, API docs | Environment spec, execution steps, expected output |
| Config | Default masuk akal | Setiap parameter eksplisit & adjustable |

### Jebakan Kognitif

1. Menunda environment setup → bug sulit dilacak
2. Tidak pakai version control → hasil tidak bisa direkonstruksi
3. Menolak Docker/container → "di laptop saya bisa" saat review
   - **Docker** = teknologi container yang "membungkus" aplikasi beserta seluruh dependency-nya dalam satu unit terisolasi. Hasilnya: kode berjalan identik di laptop, server, maupun reviewer lain. Intro singkat: `docker run -v $(pwd):/workspace environment-image python run_experiment.py`
4. 3× hasil sama ≠ repeatable (bisa cache/state tersimpan)

### Dependency Locking

Mengandalkan "install library terbaru" berbahaya: versi berbeda = perilaku berbeda = hasil tidak reproducible. Praktik:
- **Python**: buat `requirements.txt` dengan versi eksplisit: `scikit-learn==1.3.2`, lalu kunci dengan `pip freeze > requirements.txt`
- **Conda**: gunakan `conda env export > environment.yml` untuk snapshot lengkap
- **Node.js/R/Julia**: gunakan `package-lock.json` / `renv.lock` / `Project.toml` — semua fungsi serupa: lock versi + hash

### Istilah Penting

- **Environment Specification** — Deskripsi lengkap: hardware, OS, runtime, library + versi, config, seed
- **Dependency** — Komponen eksternal yang harus di-lock versinya
- **Config-driven** — Parameter dieksternalisasi ke file konfigurasi, bukan hardcode

---

## Template A.9 — Dokumentasi Setup Eksperimen

```
EXPERIMENT SETUP DOCUMENTATION

Hardware:
  CPU     : Amd Ryzen 5
  RAM     : 8 GB
  GPU     : Amd Radeon Graphics
  Storage : Asus Vivobook Go 14

Software:
  OS        : Windows (11)
  Runtime   : OpenJDK 17 LTS (Java 17.0.19) / Python 3.13.13
  Framework : JMH (Java Microbenchmark Harness) 1.37

Dependencies:
| Library | Version | Sumber | Hash/Checksum |
|---------|---------|--------|---------------|
| numpy | 2.3.1 | PyPI | - |
| pandas | 2.3.0 | PyPI | - |
| matplotlib | 3.10.3 | PyPI | - |
| scipy | 1.16.0 | PyPI | - |
| openpyxl | 3.1.5 | PyPI | - |

Konfigurasi:
  Config file     : requirements.txt
  Random seed     : 42
  Hyperparameters : Tidak digunakan (penelitian tidak menggunakan model machine learning)

Reproducibility Check:
  [x] Dependency terdokumentasi (requirements.txt / lock file)
  [x] Seed ditetapkan di semua level (Python, NumPy, framework)
  [x] Config di version control
  [x] README instruksi reproduksi lengkap
```

---

## Latihan 1 — Environment Specification

Dokumentasikan environment untuk eksperimen Anda (boleh environment saat ini atau yang direncanakan).

| Komponen | Spesifikasi |
|----------|------------|
| CPU | AMD Ryzen 5 |
| RAM | 8 GB |
| GPU | AMD Radeon Graphics |
| OS | Windows 11 64-bit |
| Runtime | Python 3.13.13 |
| Framework | Tidak menggunakan framework khusus (analisis menggunakan Python) |
| Random Seed | 42 |

**Dependencies (minimal 5):**

| Library | Version | Alasan Dibutuhkan |
|---------|---------|-------------------|
| numpy | 2.3.1 | Operasi numerik dan pengolahan array pada data penelitian. |
| pandas | 2.3.0 | Mengolah, membersihkan, dan menganalisis data penelitian e-commerce. |
| matplotlib | 3.10.3 | Membuat grafik untuk visualisasi hasil analisis. |
| scipy | 1.16.0 | Mendukung analisis statistik dan perhitungan ilmiah. |
| openpyxl | 3.1.5 | Membaca dan menulis data penelitian dalam format Microsoft Excel (.xlsx). |

---

## Latihan 2 — Repeatability Test Plan

Rancang tes repeatability sederhana: jalankan kode yang sama 3× di environment yang sama.

| Run | Seed | Metrik Utama | Hasil Sama? |
|-----|------|-------------|-------------|
| 1 | 42 | Jumlah data yang diproses dan hasil analisis | — |
| 2 | 42 | Jumlah data yang diproses dan hasil analisis | [x] Ya / [ ] Tidak |
| 3 | 42 | Jumlah data yang diproses dan hasil analisis | [x] Ya / [ ] Tidak |

**Jika hasil berbeda, kemungkinan penyebab:**

- Dataset mengalami perubahan sebelum proses analisis dijalankan.
- Terdapat proses lain yang menggunakan sumber daya komputer sehingga memengaruhi waktu eksekusi.
- Cache dari proses sebelumnya belum dibersihkan.
- Versi library Python berbeda atau random seed tidak dikonfigurasi dengan benar.
___________________________________________________

**Checklist kontrol yang sudah diterapkan:**
- [v] Random seed di-set di Python dan NumPy.
- [v] Tidak ada background process yang mengganggu.
- [v] Cache dibersihkan antar-run
- [v] Config file yang sama untuk semua run

---

## Latihan 3 — README Eksperimen

Tulis README minimum untuk eksperimen Anda (6 komponen wajib).

```
# Judul Eksperimen: Analisis Data Peran E-Commerce dalam Mengembangkan Bisnis di Era Digital

## 1. Environment
- CPU : AMD Ryzen 5 
- RAM : 8 GB 
- GPU : AMD Radeon Graphics 
- OS : Windows 11 64-bit 
- Runtime : Python 3.13.13 
- Editor : Visual Studio Code 
- Random Seed : 42

## 2. Installation
1. Clone repository GitHub. 
2. Buka folder proyek menggunakan Visual Studio Code. 
3. Buat virtual environment (opsional): python -m venv .venv
4. Aktifkan virtual environment. 
5. Install seluruh dependency: pip install -r requirements.txt

## 3. Data
> Dataset penelitian berisi data yang berkaitan dengan aktivitas e-commerce, seperti transaksi, penjualan, atau informasi pendukung lainnya. Data disimpan dalam format CSV atau Excel (.xlsx) dan digunakan sebagai bahan analisis.

## 4. Execution
> Jalankan proses analisis menggunakan Python: python main.py atau python analysis.py (sesuaikan dengan nama file utama yang digunakan)

## 5. Configuration
> 
- Config file : requirements.txt 
- Random Seed : 42 
- Python Version : 3.13.13 
- Library : NumPy, Pandas, Matplotlib, SciPy, OpenPyXL

## 6. Expected Output
> Program menghasilkan: 
- Dataset yang telah diproses. 
- Ringkasan hasil analisis. 
- Visualisasi data dalam bentuk grafik. 
- File hasil analisis (CSV/Excel) apabila diperlukan.
```

---

## Refleksi

> Apakah eksperimen Anda saat ini bisa direproduksi oleh orang lain tanpa bantuan Anda? Komponen apa yang masih hilang?
> Eksperimen saat ini dapat direproduksi oleh orang lain selama menggunakan environment yang sama, versi Python yang sama, serta dependency yang telah didokumentasikan dalam requirements.txt. Selain itu, langkah instalasi dan cara menjalankan program telah dijelaskan pada README sehingga proses eksperimen dapat dilakukan kembali dengan hasil yang konsisten.
**Level saat ini:** [ ] Repeatability / [x] Reproducibility / [ ] Belum keduanya
**Komponen yang belum terdokumentasi:**
> Dataset yang digunakan beserta sumbernya secara rinci.
- Dokumentasi struktur folder proyek.
- Contoh input dan output hasil analisis.
- Dokumentasi versi sistem operasi dan spesifikasi perangkat keras yang lebih detail.
