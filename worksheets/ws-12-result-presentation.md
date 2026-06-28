# WS-12: Result Presentation & Visualization

> **Bab 12 — Penyajian Hasil & Visualisasi**

---

## Ringkasan Materi

### Data → Insight Model

```
Validated Data → Structured Presentation → Visualization → Pattern Recognition → Insight
```

Penyajian **mendahului** analisis. Tabel dan grafik membantu peneliti "melihat" data sebelum menghitung. Langsung ke uji statistik tanpa visualisasi berisiko kesimpulan yang secara teknis benar tapi kontekstual salah (Anscombe's Quartet, 1973).

### Tabel = Presisi, Grafik = Pola

Keduanya **saling melengkapi**:
- Tabel: angka presisi, self-contained (dipahami tanpa teks), sortable
- Grafik: pola visual, tren, perbandingan cepat

### Jenis Grafik Berdasarkan Tujuan

| Tujuan | Jenis Grafik |
|--------|-------------|
| Perbandingan antar-skenario | Bar chart (grouped/stacked) |
| Distribusi per-skenario | Box plot / violin plot |
| Tren temporal | Line chart |
| Korelasi dua variabel | Scatter plot |
| Proporsi (total = 100%) | Pie chart (hati-hati!) |

### Contoh Tabel Hasil yang Baik

| Model | Accuracy (%) | F1-Score (%) | Training Time (min) |
|-------|-------------|-------------|---------------------|
| BERT | 88.4 ± 1.2 | 87.1 ± 1.4 | 45.2 ± 3.1 |
| LSTM | 86.1 ± 1.8 | 84.5 ± 2.0 | 12.8 ± 1.2 |
| SVM | 82.3 ± 0.9 | 80.7 ± 1.1 | 0.3 ± 0.1 |

*N=10 per model. Mean ± std. Diurutkan berdasarkan Accuracy.*

### Visualization Bias — Yang Harus Dihindari

| Bias | Deskripsi | Dampak |
|------|----------|--------|
| Truncated axis | Y tidak dari 0 | Memperbesar perbedaan kecil |
| Inconsistent scale | Dua grafik skala beda | Perbandingan menyesatkan |
| Cherry-picked data | Hanya tampilkan yang "menang" | Selektif, tidak jujur |
| 3D effects | Efek 3D tanpa dimensi data ke-3 | Distorsi tanpa informasi |
| Missing error bar | Tidak ada variabilitas | Menyembunyikan ketidakpastian |

### Engineering vs Research Presentation

| Aspek | Engineering | Research |
|-------|-----------|---------|
| Tujuan grafik | Dashboard monitoring | Mendukung argumen ilmiah |
| Informasi wajib | KPI, threshold | Mean, std, CI, N, p-value |
| Bias handling | Less critical | Wajib dihindari (peer-review) |

---

## Template A.12 — Result Presentation Plan

```
RESULT PRESENTATION PLAN

Research Question : Bagaimana analisis data dapat digunakan untuk memahami peran e-commerce dalam mendukung perkembangan bisnis di era digital
Metrik Utama      : Execution Time, Processed Records, dan Successful Processing Rate

Tabel Hasil:
| Skenario | Metrik 1 (mean ± std) | Metrik 2 (mean ± std) | n |
|----------|----------------------|----------------------|---|
| E-Commerce Data Analysis | 12.4 ± 0.2 s | 1000 ± 0 records | 5 |

Visualisasi yang Direncanakan:
| # | Jenis Grafik | Pesan Utama | Metrik |
|---|-------------|-------------|--------|
| 1 | Bar Chart | Membandingkan waktu eksekusi pada setiap run | Execution Time | 
| 2 | Line Chart | Menunjukkan konsistensi jumlah data yang berhasil diproses | Processed Records |

Bias Check:
  [v] Y-axis mulai dari 0 (atau dijustifikasi)
  [v] Error bar/CI ditampilkan
  [v] Semua data disertakan (tidak cherry-picked)
  [v] Tidak menggunakan 3D tanpa alasan
```

---

## Latihan 1 — Tabel Hasil

Buat tabel hasil eksperimen Anda (boleh dengan data simulasi jika belum punya data riil).

| Skenario | Metrik 1 (mean ± std) | Metrik 2 (mean ± std) | n |
|----------|----------------------|----------------------|---|
| Analisis Data E-Commerce | 12.4 ± 0.2 detik | 1000 ± 0 data | 5 |
| Validasi Dataset | 11.9 ± 0.3 detik | 1000 ± 0 data | 5 |
| Penyajian Hasil Analisis | 12.1 ± 0.2 detik | 1000 ± 0 data | 5 |

**Checklist tabel:**
- [v] Self-contained (judul jelas, satuan ada, N tercantum)
- [v] Mean ± std (bukan single number)
- [v] Diurutkan berdasarkan metrik utama
- [v] Format konsisten di semua baris

---

## Latihan 2 — Rencana Visualisasi

Rencanakan 2-3 grafik untuk menyajikan data dari Latihan 1. Setiap grafik = satu pesan.

| # | Jenis Grafik | Pesan | Data yang Digunakan |
|---|-------------|-------|---------------------|
| 1 | Diagram Batang (Bar Chart) | Membandingkan rata-rata waktu eksekusi pada setiap skenario analisis. | Rata-rata waktu eksekusi (mean ± std) |
| 2 | Diagram Garis (Line Chart) | Menunjukkan konsistensi jumlah data yang berhasil diproses pada setiap run. | Jumlah data yang berhasil diproses dari seluruh run |
| 3 | Diagram Lingkaran (Pie Chart) | Menampilkan perbandingan data yang berhasil diproses dan data yang gagal diproses. | Total data berhasil dan data gagal diproses |

---

## Latihan 3 — Bias Detection

Evaluasi visualisasi berikut untuk bias (skenario dari contoh):

**Skenario:** Metode A = 91.2%, Metode B = 90.8%. Bar chart dengan Y-axis mulai dari 90%.

| Pertanyaan | Jawaban |
|-----------|---------|
| Apakah Y-axis menyesatkan? | Tidak. Skala sumbu Y dibuat proporsional sehingga perbedaan antar data ditampilkan secara wajar. |
| Apakah error bar ditampilkan? | Ya. Error bar digunakan untuk menunjukkan variasi hasil dari setiap run. |
| Apakah semua kondisi ditampilkan? | Ya. Seluruh skenario yang diuji ditampilkan tanpa menghilangkan data tertentu. |
| Apa solusinya? | Gunakan skala yang konsisten, tampilkan seluruh data, dan hindari penggunaan efek visual yang dapat menyebabkan salah interpretasi. |

**Evaluasi grafik Anda sendiri dari Latihan 2:**
- [v] Semua bias check lulus
- [ ] Ada yang perlu diperbaiki: ____

---

## Refleksi

> Mengapa tabel dan grafik keduanya diperlukan — tidak cukup salah satu saja? Pernahkah Anda membuat grafik yang (tanpa sengaja) menyesatkan?

> Tabel dan grafik memiliki fungsi yang berbeda namun saling melengkapi. Tabel memberikan informasi secara rinci dan menampilkan nilai yang akurat, sedangkan grafik membantu pembaca memahami pola, tren, dan perbandingan data dengan lebih cepat. Oleh karena itu, penggunaan keduanya dapat membuat hasil penelitian lebih mudah dipahami.

> Saya pernah membuat grafik dengan skala sumbu yang kurang tepat sehingga perbedaan antar data terlihat lebih besar dari kondisi sebenarnya. Pengalaman tersebut membuat saya lebih memperhatikan pemilihan skala, jenis grafik, dan cara penyajian data agar informasi yang disampaikan tetap objektif dan tidak menimbulkan salah interpretasi.
