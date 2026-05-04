# WS-03: Literature Mapping & Gap

> **Bab 3 — Literature Review, Research Gap & Baseline**

---

## Ringkasan Materi

### Literature Review = Positioning, Bukan Ringkasan

Literature review bukan merangkum paper satu per satu. Pendekatan yang benar adalah **concept-centric** — organisasi berdasarkan tema, metode, atau variabel. Tujuan: menemukan **pola, kontradiksi, dan gap**.

**Perbandingan pendekatan Author-centric vs Concept-centric:**

| Aspek | Author-centric (Hindari) | Concept-centric (Gunakan) |
|-------|--------------------------|---------------------------|
| Struktur | Per penulis/paper ("Rahman et al. menyatakan...") | Per konsep/metode ("Pendekatan berbasis transformer") |
| Tujuan | Ringkasan isi paper | Perbandingan metode & identifikasi gap |
| Contoh paragraph | "Rahman (2023) pakai CNN. Taufik (2022) pakai LSTM. Dira (2021) pakai RF." | "Tiga pendekatan dominan: CNN digunakan oleh 4 paper untuk representasi fitur visual; LSTM untuk data sekuensial; RF sebagai baseline klasik." |
| Hasil akhir | Daftar paper | Peta pengetahuan + gap yang teridentifikasi |

### Empat Jenis Research Gap

| Jenis Gap | Deskripsi | Contoh |
|-----------|----------|--------|
| **Performance Gap** | Performa belum memadai | Akurasi deteksi hanya 78% pada kasus tertentu |
| **Method Gap** | Pendekatan belum diterapkan | Belum ada yang pakai transformer untuk task ini |
| **Data Gap** | Dataset terbatas/tidak representatif | Semua studi pakai dataset sintetis |
| **Context Gap** | Belum diuji pada konteks berbeda | Belum ada evaluasi di negara berkembang |

Gap terkuat = kombinasi 2+ jenis.

### Systematic Search Strategy

1. **Database utama**: Google Scholar, IEEE Xplore, ACM
2. **Boolean query** yang terdokumentasi eksplisit eksak; AND/OR/NOT mengontrol scope
3. **Snowballing** — dua arah:
   - **Backward snowballing**: buka daftar referensi di paper kunci → telusuri paper yang dikutip
4. Klaim "belum ada penelitian" harus didukung **bukti pencarian**

### Baseline Selection — 3 Kriteria

| Kriteria | Pertanyaan |
|----------|-----------|
| **Relevan** | Apakah menyelesaikan masalah yang sama? |
| **Representatif** | Apakah mewakili common practice? |
| **State-of-the-Art** | Apakah terbaru/terbaik? |

Membandingkan deep learning 2024 dengan decision tree sederhana tanpa justifikasi = **straw man comparison** (perbandingan tidak jujur).

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan baca literatur | Mencari solusi yang sudah ada | Memahami apa yang belum terjawab |
| Cara membaca paper | Tutorial, how-to | Metode, limitasi, gap |
| Baseline | Framework terpopuler | State-of-the-art yang rigorous |
| Dokumentasi pencarian | Tidak diperlukan | Wajib (reproducible) |

### Istilah Penting

- **Concept-centric** — Organisasi literatur berdasarkan konsep/metode, bukan per penulis
- **Snowballing** — Backward (telusuri referensi) + Forward (cari yang mengutip paper kunci)
- **Research Position** — Pernyataan eksplisit posisi riset terhadap studi sebelumnya
- **Straw man comparison** — Memilih baseline lemah agar metode sendiri terlihat lebih baik

---

## Template A.3 — Literature Mapping & Gap Identification

```
LITERATURE MAPPING

Topik      : Analisis Sentimen Ulasan Produk E-Commerce Menggunakan Naive Bayes
Database   : Google Scholar, IEEE Xplore, ACM DL
Query      : ("sentiment analysis" OR "opinion mining")
AND ("e-commerce reviews" OR "product reviews")
AND ("Naive Bayes" OR "Support Vector Machine")
Tahun      : 2020–2025
Hasil awal : 25 paper → Screening → 5 paper final

Literature Matrix (concept-centric):

| Study | Tahun | Method | Data | Result | Limitation |
|-------|-------|--------|------|--------|------------|
|       |       |        |      |        |            |
|Rahman et al.| 2023 | Naive Bayes | Review Tokopedia | Acc 87% | Kurang baik pada slang | 
| Taufik al. | 2022 | SVM | Amazon Reviews | Acc 91% | Dataset bahasa Inggris |
| Putra et al. | 2024 | NB + TF-IDF | Shopee Review | Acc 89% | Data terbatas |
| Dira et al. | 2021 | SVM Linear | Product Review Dataset | Acc 92% | Belum bandingkan model baru |
| Dewi et al. | 2023 | NB vs SVM | Lazada Reviews | SVM lebih baik 4% | Belum menangani imbalance |
Pola yang ditemukan:
  Metode dominan     : Naive Bayes dan SVM mendominasi klasifikasi sentimen klasik
  Dataset umum       : Review e-commerce (Shopee, Tokopedia, Amazon)
  Limitasi berulang  : slang, imbalance data, dan keterbatasan dataset Bahasa Indonesia
GAP IDENTIFICATION

Gap 1: [Jenis: Performance Gap]
  Deskripsi    : Akurasi model menurun untuk ulasan informal, singkatan, dan bahasa campuran.
  Bukti        : Sebagian besar studi menunjukkan akurasi 87–92%, namun turun untuk data noisy.
  Signifikansi : Penting untuk meningkatkan kualitas klasifikasi sentimen dunia nyata.

Gap 2: [Jenis: Data + Context Gap]
  Deskripsi    : Masih terbatas penelitian khusus review e-commerce Bahasa Indonesia.
  Bukti        : Banyak studi menggunakan dataset umum atau berbahasa Inggris.
  Signifikansi : Membuka peluang riset pada konteks lokal Indonesia.

Baseline Selection:
| Baseline | Relevansi | Representatif | Source |
|----------|-----------|---------------|--------|
| Naive Bayes | Tinggi | Ya | Rahman et al., 2023 |
| SVM | Tinggi | Ya | Taufik et al., 2022 |
```

---

## Latihan 1 — Concept-Centric Literature Table

Gunakan topik riset dari WS-02. Cari minimal 5 paper relevan menggunakan database akademik.

**Topik riset:** Analisis Sentimen Ulasan Produk E-Commerce Menggunakan Naive Bayes dan SVM
**Query pencarian:** ("sentiment analysis" OR "opinion mining")
AND ("product reviews")
AND ("Naive Bayes" OR "SVM")
**Database:** Google Scholar, IEEE Xplore

| # | Study | Tahun | Method | Dataset | Result | Limitasi |
|---|-------|-------|--------|---------|--------|----------|
| 1 | Rahman et al. | 2023 | Naive Bayes | Tokopedia | 87% | Slang sulit dideteksi |
| 2 | Taufik et al. | 2022 | SVM | | Amazon Reviews | 91% | Bahasa Inggris saja |
| 3 | Putra et al. | 2024 | NB + TF-IDF | Shopee | 89% | Data sedikit |
| 4 | Dira et al. | 2021 | SVM | Product Dataset | 92% | Belum uji model baru |
| 5 | Dewi et al. | 2023 | NB vs SVM | Lazada | SVM unggul | Imbalance data |

**Pola yang terlihat — Metode dominan: Naive Bayes dan SVM
**Limitasi yang berulang: Slang, imbalance data, dataset lokal terbatas

---

## Latihan 2 — Gap Identification

Berdasarkan tabel di Latihan 1, identifikasi gap.

| Jenis Gap | Ditemukan? | Gap Statement |
|-----------|-----------|---------------|
| Performance Gap | [ v ] Ya / [ ] Tidak | Akurasi menurun untuk data ulasan informal|
| Method Gap | [ v ] Ya / [ ] Tidak | Perbandingan metode modern masih terbatas |
| Data Gap | [ v ] Ya / [ ] Tidak | Dataset review Bahasa Indonesia terbatas |
| Context Gap | [ v ] Ya / [ ] Tidak | Belum banyak diuji pada e-commerce Indonesia |

**Gap utama yang dipilih: Data Gap + Context Gap
**Mengapa gap ini penting (bukan sekadar "belum ada yang meneliti")?**
> Karena penelitian yang ada belum cukup merepresentasikan karakteristik ulasan pengguna Indonesia sehingga hasil model belum optimal pada konteks lokal.

---

## Latihan 3 — Baseline Selection

Pilih 2 baseline dari literatur yang sudah dibaca.

| # | Baseline | Mengapa Relevan | Mengapa Representatif | Apakah SOTA? | Sumber |
|---|----------|----------------|----------------------|-------------|--------|
| 1 | Naive Bayes | Task sama klasifikasi sentimen | Sering dipakai | Bukan | Rahman et al. 2023 |
| 2 | SVM | Task sama klasifikasi sentimen | Baseline populer | Bukan, tapi kuat | Taufik et al. 2022 |

**Apakah pemilihan baseline ini bisa dianggap straw man?** [ ] Ya / [ v ] Tidak
> Justifikasi: Kedua baseline relevan, umum digunakan, dan representatif sebagai pembanding yang adil.

---

## Refleksi

> Apa perbedaan antara "belum ada yang meneliti ini" (klaim tanpa bukti) dengan research gap yang valid? Bagaimana cara membuktikan bahwa sebuah gap benar-benar ada?

**Jawaban:**~
> Perbedaan antara “belum ada yang meneliti ini” dengan research gap yang valid terletak pada bukti dan dasar analisisnya. Pernyataan “belum ada yang meneliti ini” sering hanya asumsi tanpa dukungan pencarian literatur yang jelas. Sementara research gap yang valid adalah celah penelitian yang ditemukan melalui kajian literatur, misalnya ada keterbatasan metode, performa yang belum optimal, dataset yang terbatas, atau konteks tertentu yang belum banyak dikaji.

> Sebuah gap dikatakan benar-benar ada jika dibuktikan melalui systematic literature review atau pemetaan literatur dengan mencari dan membandingkan beberapa paper relevan, menemukan pola limitasi yang berulang, kontradiksi hasil penelitian, atau aspek yang belum terjawab. Gap juga harus didukung bukti pencarian (query, database, paper yang dikaji), bukan hanya klaim pribadi. Dengan demikian, research gap bukan sekadar “topik yang belum diteliti”, tetapi masalah nyata yang masih terbuka untuk diselesaikan.

