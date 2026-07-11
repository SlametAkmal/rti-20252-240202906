# WS-14: Analysis, Interpretation & Failure Analysis

> **Bab 14 — Analisis Data, Interpretasi & Failure Analysis**

---

## Ringkasan Materi

### Data → Knowledge Model

```
Data → Analysis → Interpretation → Explanation → Knowledge
```

Tiga level yang berbeda:
- **Analysis** — "Apa yang terjadi?" (deskriptif + inferensial)
- **Interpretation** — "Apa artinya?" (konteks RQ + literatur)
- **Failure Analysis** — "Mengapa tidak berhasil?" (boundary conditions)

### Beyond p-value

**Statistical significance ≠ practical significance.** Selalu laporkan:
1. p-value (signifikansi statistik)
2. Effect size (besarnya efek)
3. Confidence interval (rentang ketidakpastian)

| Effect Size (Cohen's d) | Interpretasi |
|-------------------------|-------------|
| < 0.2 | Small |
| 0.2 – 0.8 | Medium |
| > 0.8 | Large |

### Pemilihan Uji Statistik

| Kondisi | Uji yang Tepat |
|---------|---------------|
| 2 grup, normal, paired | Paired t-test |
| 2 grup, non-normal | Wilcoxon signed-rank |
| > 2 grup, normal | One-way ANOVA + post-hoc |
| > 2 grup, non-normal | Kruskal-Wallis + post-hoc |
| 2 variabel kontinu | Pearson (normal) / Spearman (rank) |

### Failure Analysis as Contribution

Hipotesis yang ditolak adalah **temuan yang berharga**:

| Dataset | New (F1) | Baseline (F1) | p-value | Cohen's d |
|---------|---------|--------------|---------|-----------|
| DS-1 (small, clean) | 94.2±1.1 | 89.3±1.5 | <0.001 | **3.7** |
| DS-4 (medium, noisy) | 78.3±3.2 | 82.1±2.8 | 0.008 | **-1.3** |
| DS-5 (large, noisy) | 71.6±4.1 | 80.5±3.0 | <0.001 | **-2.5** |

**Insight:** Metode baru unggul di data bersih tapi gagal di data noisy → asumsi Gaussian dilanggar → **boundary condition** ditemukan → hybrid approach direkomendasikan.

**Partial failure + deep analysis = kontribusi lebih kaya daripada full success tanpa analisis.**

### Limitation Types

| Jenis | Contoh |
|-------|--------|
| Internal validity | Confounders yang tidak dikontrol |
| External validity | Generalisasi ke domain lain |
| Construct validity | Metrik mengukur apa yang dimaksud? |
| Statistical limitation | Sample size, asumsi distribusi |

### Jebakan Kognitif

1. "Signifikan statistik = penting secara praktis" → cek effect size
2. "Hipotesis tidak didukung → cari sudut baru" → p-hacking
3. "Kegagalan tidak perlu dilaporkan detail" → missed insight
4. "Limitasi cukup disebutkan, tidak perlu dianalisis" → kedalaman hilang

---

## Template A.14 — Analysis & Interpretation Report

```
ANALYSIS & INTERPRETATION

1. Statistik Deskriptif:
   | Skenario | Mean | Std | Median | Min | Max | n |
   |----------|------|-----|--------|-----|-----|---|
   | Pengaruh E-Commerce terhadap Kinerja Bisnis UMKM | 0,398 | 0,093 | - | - | - | 130 |
   | Pengaruh Media Sosial terhadap Kinerja Bisnis UMKM | 0,148 | 0,105 | - | - | - | 130 |
   | Pengaruh Transformasi Digital terhadap Kinerja Bisnis UMKM | 0,227 | 0,080 | - | - | - | 130 |
   | Pengaruh Review Pelanggan terhadap Peluang UMKM | 0,425 | 0,083 | - | 18 | 36 | 107 |
   | Pengaruh Strategi Pemasaran Digital terhadap Peluang UMKM | 0,189 | 0,081 | - | 18 | 35 | 107 |




2. Uji Hipotesis:
   Uji yang digunakan  : Analisis deskriptif melalui sintesis hasil penelitian terdahulu.
   Justifikasi          : Penelitian ini menggunakan metode studi literatur sehingga tidak melakukan pengujian hipotesis secara langsung menggunakan data primer. Analisis dilakukan dengan membandingkan hasil penelitian dari beberapa jurnal yang relevan.
   Hasil: p = Tidak dilakukan, effect size (d/r/η²) = Tidak dihitung
   CI 95%               : Tidak tersedia karena penelitian tidak melakukan analisis statistik inferensial.

3. Keputusan:
   [v] H₀ ditolak → H₁ diterima
   [ ] H₀ tidak ditolak

4. Interpretasi:
   Hubungan ke RQ       : Berdasarkan hasil analisis beberapa jurnal, penerapan e-commerce berkontribusi terhadap peningkatan penjualan, perluasan pasar, efisiensi operasional, dan peningkatan daya saing pelaku usaha.
   Practical significance: Implementasi e-commerce memberikan manfaat nyata bagi pelaku usaha melalui kemudahan transaksi, promosi digital, komunikasi dengan pelanggan, serta peningkatan akses pasar yang lebih luas.
   Perbandingan literatur: Sebagian besar penelitian menunjukkan hasil yang konsisten bahwa e-commerce memberikan dampak positif terhadap perkembangan bisnis. Namun, besarnya pengaruh berbeda-beda karena dipengaruhi oleh karakteristik usaha, strategi pemasaran digital, tingkat adopsi teknologi, dan kemampuan sumber daya manusia.

5. Limitation:
   | Jenis | Ancaman | Dampak | Mitigasi |
   |-------|---------|--------|----------|
   | Internal Validity | Jumlah jurnal yang dianalisis masih terbatas | Analisis belum mewakili seluruh penelitian | Menambah jumlah referensi pada penelitian selanjutnya |
   | External Validity | Sebagian besar jurnal berasal dari Indonesia | Generalisasi ke negara lain masih terbatas | Menambahkan jurnal internasional |
   | Methodological | Tidak menggunakan data primer | Tidak dapat mengukur kondisi lapangan secara langsung | Mengombinasikan studi literatur dengan survei atau wawancara |

6. Failure Analysis (jika H₀ tidak ditolak):
   Penyebab potensial  : Perbedaan hasil penelitian dipengaruhi oleh variasi metode penelitian, objek penelitian, ukuran sampel, serta tingkat adopsi teknologi pada masing-masing pelaku usaha.
   Boundary condition   : Penerapan e-commerce memberikan hasil yang lebih optimal pada usaha yang memiliki infrastruktur digital, sumber daya manusia yang memadai, dan strategi pemasaran yang baik.
   Insight              : Keberhasilan e-commerce tidak hanya dipengaruhi oleh penggunaan platform digital, tetapi juga oleh kemampuan pelaku usaha dalam memanfaatkan teknologi, mengelola pemasaran digital, dan membangun kepercayaan pelanggan.
```

---

## Latihan 1 — Pemilihan Uji Statistik

Tentukan uji statistik yang tepat untuk eksperimen Anda.

| Pertanyaan | Jawaban |
|-----------|---------|
| Berapa grup yang dibandingkan? | Tidak ada kelompok eksperimen yang dibandingkan. Penelitian menganalisis hasil dari 5 jurnal yang membahas peran e-commerce dalam pengembangan bisnis. |
| Apakah data berpasangan (paired)? | Tidak. Penelitian tidak menggunakan data berpasangan karena tidak melakukan pengujian terhadap sampel yang sama. |
| Apakah distribusi normal? (uji normalitas) | Tidak dilakukan. Penelitian menggunakan metode studi literatur sehingga tidak melakukan uji normalitas terhadap data. |
| **Uji yang dipilih:** | Analisis deskriptif kualitatif (literature synthesis). |
| **Justifikasi:** | Penelitian menggunakan data sekunder yang berasal dari jurnal ilmiah. Analisis dilakukan dengan membandingkan, mengelompokkan, dan menginterpretasikan hasil penelitian terdahulu tanpa melakukan pengujian statistik terhadap data primer. |

**Effect size yang akan dilaporkan:** [ ] Cohen's d / [ ] Eta-squared / [v] Lainnya: Tidak dihitung karena penelitian menggunakan metode studi literatur (literature review).

---

## Latihan 2 — Interpretasi Hasil

Gunakan data berikut (atau data riil Anda) untuk berlatih interpretasi.

**Data:**
| Model | Accuracy (mean ± std) | n |
|-------|----------------------|---|
| A | 89.2 ± 1.5 | 10 |
| B | 87.8 ± 2.1 | 10 |

p = 0.045, Cohen's d = 0.74, CI 95% = [0.03, 2.77]

| Aspek | Interpretasi |
|-------|-------------|
| Signifikansi statistik | Nilai p = 0,045 menunjukkan bahwa perbedaan hasil antara Model A dan Model B kecil kemungkinannya terjadi secara kebetulan, sehingga kedua model memiliki performa yang berbeda secara statistik. |
| Effect size | Nilai Cohen's d = 0,74 mengindikasikan bahwa selisih performa kedua model cukup terlihat, meskipun tidak termasuk kategori yang sangat besar. |
| Practical significance | Dari sisi penerapan, Model A memberikan tingkat akurasi yang lebih tinggi daripada Model B. Walaupun selisihnya tidak terlalu jauh, peningkatan tersebut dapat menjadi keuntungan jika sistem membutuhkan hasil yang lebih konsisten. |
| Hubungan ke RQ | Temuan ini mendukung tujuan penelitian, yaitu membandingkan performa dua model untuk mengetahui model yang memberikan hasil lebih baik dalam menyelesaikan permasalahan yang diteliti. |
| Perbandingan literatur | Hasil yang diperoleh sejalan dengan berbagai penelitian sebelumnya yang menunjukkan bahwa setiap model memiliki tingkat performa yang berbeda, sehingga pemilihan metode perlu disesuaikan dengan karakteristik data dan kebutuhan analisis. |

---

## Latihan 3 — Failure Analysis

Latih kemampuan failure analysis: hipotesis TIDAK didukung. Apa yang bisa dipelajari?

**Skenario:** Metode baru Anda mendapat F1 = 83.2%, baseline = 84.7%. p = 0.12 (tidak signifikan).

| Pertanyaan | Jawaban |
|-----------|---------|
| Apakah ini "gagal"? | Tidak. Walaupun metode baru belum mampu mengungguli baseline, hasil ini tetap memberikan informasi yang berguna mengenai batas kemampuan metode yang diuji. |
| Kemungkinan penyebab? | Performa metode baru mungkin belum optimal karena parameter yang digunakan belum sesuai, jumlah data yang terbatas, atau karakteristik data kurang mendukung metode tersebut. |
| Boundary condition? | Metode baru kemungkinan memberikan hasil yang lebih baik jika diterapkan pada dataset yang lebih besar, data yang lebih beragam, atau setelah dilakukan penyesuaian parameter. |
| Insight yang bisa diambil? | Tidak semua metode baru akan menghasilkan performa yang lebih baik pada setiap kondisi. Pemilihan metode sebaiknya disesuaikan dengan karakteristik data dan tujuan penelitian. |
| Apakah layak dilaporkan? Mengapa? | Ya. Hasil yang tidak sesuai hipotesis tetap penting untuk dilaporkan karena dapat menjadi referensi bagi penelitian selanjutnya dan membantu menghindari pengulangan pendekatan yang kurang efektif pada kondisi yang sama. |

**Limitation terkait:**
| Jenis | Ancaman | Dampak |
|-------|---------|--------|
| Metodologi | Pengujian hanya dilakukan pada satu jenis dataset | Hasil belum dapat digeneralisasikan untuk dataset lain |
| Data | Jumlah sampel relatif terbatas | Performa metode mungkin belum mencerminkan kondisi sebenarnya |
| Parameter | Belum dilakukan optimasi parameter secara menyeluruh | Hasil metode baru belum mencapai performa terbaik |

---

## Refleksi

> Apakah "failure" dalam riset benar-benar gagal, atau justru kontribusi? Bagaimana failure analysis mengubah cara Anda melihat hasil negatif?

> Failure dalam penelitian tidak selalu berarti penelitian tersebut gagal. Hasil yang tidak sesuai dengan hipotesis tetap memiliki nilai karena dapat menunjukkan keterbatasan suatu metode atau kondisi tertentu yang memengaruhi hasil penelitian. Melalui failure analysis, saya belajar bahwa hasil negatif tetap penting untuk dianalisis dan dilaporkan karena dapat menjadi masukan bagi penelitian selanjutnya serta membantu menentukan pendekatan yang lebih tepat di masa depan.
> ___________________________________________________
