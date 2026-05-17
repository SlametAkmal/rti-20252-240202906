# WS-07: Experimental Design & Validity

> **Bab 7 — Experimental Design & Validity**

---

## Ringkasan Materi

### Correlation ≠ Causality

Kausalitas membutuhkan 3 syarat:
1. **Covariance** — X dan Y bergerak bersama
2. **Temporal precedence** — X berubah sebelum Y
3. **Elimination of alternatives** — Tidak ada faktor lain yang menjelaskan Y

Controlled experiment adalah satu-satunya metode yang bisa membuktikan kausalitas.

### Empat Jenis Validitas

| Jenis | Pertanyaan | Ancaman Umum |
|-------|-----------|-------------|
| **Internal** | Apakah hubungan IV→DV nyata? | Confounding variable, selection bias |
| **External** | Apakah bisa digeneralisasi? | Dataset terlalu spesifik |
| **Construct** | Apakah mengukur konsep yang benar? | Metrik tidak sesuai |
| **Conclusion** | Apakah kesimpulan statistik valid? | Sample size kecil, uji salah |

Internal dan external validity sering berkonflik: semakin terkontrol (internal kuat) → semakin artificial (external lemah).

### Tiga Tipe Eksperimen dalam Riset TI

| Tipe | Deskripsi | Kapan Digunakan |
|------|----------|----------------|
| **Comparison Study** | Metode A vs B pada kondisi identik | Membandingkan pendekatan berbeda |
| **Ablation Study** | Full system → lepas komponen satu per satu | Mengukur kontribusi tiap komponen |
| **Parameter Study** | Variasikan satu parameter, amati dampak | Uji sensitifitas/robustness |

### Fairness dalam Perbandingan

Perbandingan yang adil = **kondisi identik** untuk semua metode: dataset sama, preprocessing sama, tuning effort sebanding, environment sama, metrik sama.

Contoh tidak adil: Transformer (30 fitur tambahan + Bayesian optimization) vs RF (default params) → hasilnya misleading.

### Threats to Validity = Diidentifikasi Sebelum Eksperimen

Ancaman validitas harus diidentifikasi **sebelum** eksperimen dan mitigasinya dirancang sebagai bagian dari desain — bukan ditulis sebagai boilerplate setelah selesai.

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan testing | Memastikan sistem memenuhi requirement | Membuktikan hubungan kausal antar variabel |
| Baseline | Versi sebelumnya (last release) | Metode tervalidasi dari literatur |
| Kegagalan | Bug → fix → release | H₀ tidak ditolak → tetap kontribusi ilmiah |
| Sukses | 100% test pass | Evidence valid — mendukung atau menolak hipotesis |

### Istilah Penting

- **Causality** — Hubungan sebab-akibat (covariance + temporal + elimination)
- **Controlled Experiment** — Ubah satu variabel, kontrol sisanya, amati efek
- **Fairness** — Semua metode diuji pada kondisi yang benar-benar identik
- **Threats to Validity** — Faktor yang bisa melemahkan kesimpulan jika tidak dimitigasi
- **Conclusion Validity** — Validitas statistik: power, sample size, uji yang tepat

---

## Template A.7 — Desain Eksperimen Lengkap

```
EXPERIMENT DESIGN

Research Question : Bagaimana penggunaan e-commerce dapat meningkatkan penjualan bisnis di era digital?
Hypothesis        : Penggunaan e-commerce dapat membantu meningkatkan penjualan dan memperluas jangkauan pasar.
Tipe Eksperimen   : [v] Comparison  [ ] Ablation  [ ] Parameter

Kondisi Eksperimen:
| Kondisi | Deskripsi | IV Value | CV Settings |
|---------|-----------|----------|-------------|
| Control | Penjualan dilakukan secara offline | Tanpa e-commerce | Produk, harga, dan waktu penjualan dibuat sama |
| Treatment | Penjualan menggunakan marketplace online |  Menggunakan e-commerce | Produk, harga, dan waktu penjualan dibuat sama |

Fairness Checklist:
  [v] Dataset identik untuk semua kondisi
  [v] Preprocessing setara
  [v] Tuning effort setara
  [v] Environment identik
  [v] Metrik evaluasi sama

Threat Analysis:
| Threat Type | Ancaman Spesifik | Mitigasi |
|-------------|-----------------|----------|
| Internal | Jumlah pelanggan berbeda | Menggunakan jumlah responden yang hampir sama |
| External | Hanya cocok untuk satu jenis usaha | Menggunakan beberapa contoh bisnis |
| Construct | Penjualan tidak selalu menunjukkan kepuasan pelanggan | Menambahkan data ulasan pelanggan |
| Conclusion | Data penelitian terlalu sedikit | Menambah jumlah data penelitian |

Statistical Plan:
  Uji statistik   : Perbandingan jumlah penjualan
  Justifikasi      : Untuk melihat perbedaan hasil penjualan
  Alpha            : 0.05
  Effect size min  : Penjualan meningkat minimal 10%
```

---

## Latihan 1 — Desain Eksperimen

Susun desain eksperimen berdasarkan RQ, variabel, dan sistem dari WS-04 sampai WS-06.

**RQ:** Apakah penggunaan e-commerce berpengaruh terhadap perkembangan bisnis pelaku usaha di era digital?
**Tipe eksperimen:** [v] Comparison / [ ] Ablation / [ ] Parameter

| Kondisi | Deskripsi | IV Value | CV Settings |
|---------|-----------|----------|-------------|
| Control | Pelaku usaha menjalankan penjualan tanpa menggunakan e-commerce secara aktif | Penggunaan e-commerce rendah / tidak aktif | Produk sama, harga produk tetap, periode pengamatan sama, jenis usaha sama|
| Treatment | Pelaku usaha menggunakan e-commerce secara aktif untuk penjualan dan promosi | Penggunaan e-commerce aktif | Produk sama, harga produk tetap, periode pengamatan sama, jenis usaha sama |

---

## Latihan 2 — Fairness Checklist

Evaluasi apakah desain eksperimen di Latihan 1 sudah fair.

| Kriteria | Status | Detail |
|----------|--------|--------|
| Dataset identik | ✅ | Data yang digunakan berasal dari jenis usaha dan periode pengamatan yang sama |
| Preprocessing setara |✅ | Semua data penjualan dibersihkan dan diproses dengan cara yang sama |
| Tuning effort setara | ✅ | Perlakuan dan pengamatan dilakukan dengan prosedur yang sama pada setiap kondisi |
| Environment identik | ✅ | Pengujian dilakukan pada platform dan kondisi penelitian yang sama |
| Metrik evaluasi sama | ✅ | Pengukuran menggunakan metrik yang sama yaitu peningkatan omzet dan jumlah penjualan |

**Ada yang tidak fair?** [ ] Ya / [v] Tidak
> Jika ya, bagaimana cara memperbaikinya? Semua kondisi dibuat sama agar hasil perbandingan lebih objektif. Perbedaan utama hanya pada penggunaan e-commerce aktif atau tidak aktif, sehingga pengaruh variabel lain dapat diminimalkan.

---

## Latihan 3 — Threat Analysis

Identifikasi ancaman validitas untuk desain eksperimen ini.

| Threat Type | Ancaman Spesifik | Mitigasi |
|-------------|-----------------|----------|
| Internal | Kenaikan penjualan bisa dipengaruhi faktor lain seperti diskon, musim belanja, atau tren produk | Menggunakan produk dan periode pengamatan yang sama serta mengontrol variabel lain |
| External | Hasil penelitian mungkin hanya sesuai pada jenis usaha tertentu | Menggunakan sampel dari beberapa jenis usaha agar lebih beragam |
| Construct | Perkembangan bisnis hanya diukur dari omzet, padahal ada faktor lain seperti kepuasan pelanggan | Menambahkan metrik pendukung seperti jumlah pelanggan baru atau rating pelanggan |
| Conclusion | Jumlah data atau responden terlalu sedikit sehingga hasil kurang mewakili | Menambah jumlah sampel dan memperpanjang waktu pengamatan |

**Ancaman mana yang paling sulit dimitigasi?** External validity
**Mengapa?**
> Karena setiap jenis usaha memiliki karakteristik yang berbeda. Hasil pada satu jenis bisnis belum tentu sama jika diterapkan pada bisnis lain atau platform yang berbeda.

---

## Refleksi

> Sebuah paper melaporkan "metode kami mengalahkan semua baseline." Apa 3 pertanyaan pertama yang harus diajukan untuk mengevaluasi klaim ini?

**Jawaban:**
1. Apakah semua metode diuji menggunakan dataset dan kondisi yang sama?
2. Apakah proses eksperimen dilakukan secara adil, misalnya preprocessing dan parameter yang digunakan setara?
3. Apakah hasil yang diperoleh sudah diuji secara statistik dan jumlah datanya cukup?
