# WS-02: Problem Statement

> **Bab 2 — Problem Formulation & System Context**

---

## Ringkasan Materi

### Problem Formation Model

Masalah riset melewati 5 tahap transformasi. Melompat langsung dari Reality ke Variable adalah kesalahan paling umum.

```
Reality → Observed Issue (Symptom) → Diagnosed Problem (Root Cause)
→ Researchable Problem (Scoped) → Measurable Variable (Operationalized)
```

### Topic ≠ Problem ≠ Research Problem

| Level | Contoh | Status |
|-------|--------|--------|
| **Topik** | Sistem presensi mahasiswa berbasis QR Code | Terlalu luas, tidak bisa diuji |
| **Problem** | Sistem presensi QR Code rentan terhadap kecurangan (titip absen) | Spesifik tapi belum riset |
| **Research Problem** | Belum ada metode yang efektif untuk meningkatkan akurasi sistem presensi QR Code dalam memverifikasi kehadiran mahasiswa secara nyata | Bisa dirancang eksperimennya |

### Symptom vs Root Cause

Symptom:Data kehadiran mahasiswa tidak sesuai dengan kondisi nyata di kelas

Root Cause: Sistem presensi QR Code tidak memiliki mekanisme verifikasi kehadiran secara langsung sehingga memungkinkan terjadinya kecurangan seperti titip absen

### System Thinking

System Thinking pada sistem presensi mahasiswa berbasis QR Code dapat dijelaskan sebagai berikut:

Input       : QR Code mahasiswa dan data waktu kehadiran  
Process     : Sistem membaca dan memvalidasi QR Code yang di-scan  
Output      : Data kehadiran mahasiswa  
Outcome     : Informasi kehadiran yang digunakan untuk evaluasi kehadiran mahasiswa  
Constraints : Koneksi internet, akurasi pemindaian QR Code, dan potensi kecurangan (titip absen)  
Stakeholders: Mahasiswa, dosen, dan pihak kampus

### Problem Quality Check

Masalah riset yang layak harus memenuhi 5 kriteria:
- **Clarity** — Masalah dijelaskan dengan jelas yaitu ketidakakuratan sistem presensi QR Code akibat kecurangan dan keterbatasan verifikasi  

- **Measurability** — Dapat diukur menggunakan metrik seperti tingkat akurasi presensi, jumlah kesalahan, dan jumlah kecurangan  

- **Relevance** — Masalah penting karena berkaitan dengan kehadiran mahasiswa di lingkungan kampus  

- **Testability** — Dapat diuji melalui eksperimen dengan membandingkan data presensi dengan kondisi nyata  
- **Impact** — Memiliki dampak dalam meningkatkan keakuratan sistem presensi dan kualitas data kehadiran

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan | Menyelesaikan masalah (*solve*) | Memahami dan membuktikan (*understand & prove*) |
| Masalah | Bug, error, fitur belum ada | Gap dalam pengetahuan |
| Scope | Selesaikan semua yang perlu | Batasi agar bisa dibuktikan |
| Output | Working system | Evidence, paper, replicable findings |

### Istilah Penting

- **Problem Statement** — Formulasi tertulis: konteks sistem + gap + dampak + justifikasi
- **System Context** — Deskripsi lengkap: input, proses, output, outcome, constraints, stakeholders
- **Problem Drift** — Masalah "bermutasi" dari pendahuluan ke metodologi karena statement awal tidak presisi
- **Solution-First Thinking** — Memulai dari solusi tanpa masalah yang jelas — berbahaya dalam riset
- **Operational Definition** — Definisi variabel yang cukup jelas agar peneliti lain bisa mengukur hal yang sama

---

## Template A.2 — Problem Statement Builder

```
PROBLEM STATEMENT BUILDER

Domain & Konteks
  Domain   : Sistem Informasi
  Konteks  : Sistem presensi mahasiswa berbasis QR Code di lingkungan kampus


System Context
  Input       : Data QR Code mahasiswa dan waktu kehadiran
  Process     : Sistem membaca dan memvalidasi QR Code yang di-scan
  Output      : Data kehadiran mahasiswa
  Outcome     : Informasi kehadiran untuk evaluasi akademik
  Constraints :  Koneksi internet, akurasi scanner, dan potensi kecurangan
  Stakeholders: Mahasiswa, dosen, dan pihak kampus

Fenomena → Problem
  Fenomena yang diamati             : Penggunaan sistem presensi QR Code untuk mencatat kehadiran mahasiswa
  Gejala (symptom) yang terukur     : Terdapat ketidaksesuaian antara data kehadiran dengan kondisi nyata di kelas
  Masalah yang didiagnosis          : Sistem tidak memiliki mekanisme verifikasi kehadiran secara langsung sehingga memungkinkan kecurangan
  Masalah riset (researchable)      : Belum ada pendekatan yang efektif untuk meningkatkan akurasi sistem presensi QR Code dalam memverifikasi kehadiran mahasiswa
  Variabel yang terukur             : Tingkat akurasi presensi, jumlah kesalahan, dan jumlah kecurangan

Problem Quality Check
  [v] Clarity — Apakah satu orang membaca akan paham?
  [v] Measurability — Apakah ada metrik kuantitatif?
  [v] Relevance — Apakah penting untuk domain?
  [v] Testability — Apakah bisa gagal?
  [v] Impact — Apakah ada kontribusi jika terjawab?

Problem Statement (1 paragraf):
   Sistem presensi mahasiswa berbasis QR Code banyak digunakan di lingkungan kampus untuk mencatat kehadiran. Namun, sistem ini masih memiliki kelemahan dalam hal akurasi karena adanya potensi kecurangan seperti titip absen serta keterbatasan dalam memverifikasi kehadiran secara nyata. Hal ini menyebabkan data kehadiran tidak selalu mencerminkan kondisi sebenarnya di kelas. Oleh karena itu, diperlukan penelitian untuk meningkatkan akurasi sistem presensi dengan mengukur tingkat kesalahan dan efektivitas sistem dalam merepresentasikan kehadiran mahasiswa secara nyata.
```

---

## Latihan 1 — Dari Topik ke Masalah Riset

Pilih satu topik di bidang TI yang diminati. Transformasikan melalui 5 tahap Problem Formation Model.

**Topik awal:** Sistem presensi mahasiswa berbasis QR Code

| Tahap | Hasil |
|-------|-------|
| Reality | Sistem presensi QR Code digunakan di kampus untuk mencatat kehadiran mahasiswa |
| Observed Issue (Symptom) | Data kehadiran tidak selalu sesuai dengan kondisi nyata di kelas | |
| Researchable Problem |Bagaimana meningkatkan akurasi sistem presensi QR Code dalam memverifikasi kehadiran mahasiswa secara nyata|
| Measurable Variable | Tingkat akurasi presensi, jumlah kesalahan, dan jumlah kecurangan|

**Apakah terjebak solution-first thinking?** [ ] Ya / [v] Tidak
> Jika ya, kembali ke tahap mana? ________________________

---

## Latihan 2 — System Context Decomposition

Gambarkan konteks sistem dari masalah riset di Latihan 1.

| Komponen | Deskripsi |
|----------|----------|
| Input | Data QR Code mahasiswa dan waktu scan |
| Process | Sistem membaca, memvalidasi QR Code, dan mencatat kehadiran|
| Output |  Data kehadiran mahasiswa |
| Outcome |  Informasi kehadiran yang digunakan untuk evaluasi akademik|
| Constraints |  Koneksi internet, akurasi pemindaian QR Code, dan potensi kecurangan (titip absen)|
| Stakeholders | Mahasiswa, dosen, dan pihak kampus|

**Komponen mana yang paling relevan dengan masalah riset?** > Proses

---

## Latihan 3 — Problem Quality Check

Evaluasi problem statement yang sudah dibuat menggunakan 5 kriteria.

| Kriteria | Skor (1-5) | Justifikasi |
|----------|-----------|-------------|
| Clarity | 4 | Masalah sudah jelas, namun bisa diperjelas pada metode verifikasi|
| Measurability | 5 | Dapat diukur dengan metrik seperti akurasi, jumlah kesalahan, dan kecurangan|
| Relevance | 5 |  Sangat relevan dengan sistem presensi di lingkungan kampus|
| Testability | 4 | Dapat diuji melalui eksperimen dan perbandingan data|
| Impact | 5 | Memberikan dampak dalam meningkatkan keakuratan sistem presensi|

**Skor total:** 23 / 25

**Problem statement versi final (1 paragraf):**
> Sistem presensi mahasiswa berbasis QR Code digunakan untuk mencatat kehadiran, namun masih memiliki kelemahan dalam akurasi akibat potensi kecurangan seperti titip absen serta keterbatasan dalam verifikasi kehadiran secara nyata. Hal ini menyebabkan data kehadiran tidak selalu mencerminkan kondisi sebenarnya di kelas. Oleh karena itu, penelitian ini bertujuan untuk mengevaluasi dan meningkatkan akurasi sistem presensi dengan mengukur tingkat kesalahan dan efektivitas sistem dalam merepresentasikan kehadiran mahasiswa secara akurat.


---

## Refleksi

> Bandingkan "masalah" yang biasa ditemui saat coding (bug, error) dengan masalah riset. Apa perbedaan fundamental dalam cara mendefinisikan dan mendekati keduanya?

**Jawaban:**
> Masalah dalam coding seperti bug atau error biasanya bersifat langsung dan spesifik, serta fokus pada memperbaiki sistem agar dapat berjalan dengan benar. Pendekatannya lebih ke mencari penyebab teknis dan segera memperbaikinya.

> Sedangkan masalah riset bersifat lebih luas dan mendalam, tidak hanya memperbaiki tetapi memahami penyebab secara sistematis dan membuktikannya dengan data. Pendekatan riset memerlukan perumusan masalah yang jelas, pengukuran yang terstruktur, serta pengujian yang dapat dipertanggungjawabkan secara ilmiah.

