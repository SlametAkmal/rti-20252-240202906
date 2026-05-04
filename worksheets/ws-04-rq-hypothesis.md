# WS-04: Research Question & Hypothesis

> **Bab 4 — Research Question, Contribution & Hypothesis**

---

## Ringkasan Materi

### RQ Bukan Pertanyaan Biasa

Research Question yang baik secara implisit mengandung cetak biru eksperimen: subjek, baseline, metrik, domain, dataset.

| Kualitas | Contoh |
|----------|--------|
| **Buruk** | "Bagaimana pengaruh deep learning terhadap deteksi malware?" |
| **Baik** | "Apakah CNN menghasilkan F1-Score lebih tinggi dari RF pada CIC-MalMem-2022?" |

Perbedaan: RQ yang baik menyebutkan **metode spesifik**, **metrik terukur**, **baseline**, dan **dataset**.

### Tiga Jenis RQ

| Jenis | Pola | Kebutuhan |
|-------|------|-----------|
| **Comparison** | A vs B → mana lebih baik? | ≥ 2 metode, metrik sama |
| **Improvement** | A' vs A → modifikasi lebih baik? | Pre/post, bukti perbaikan |
| **Exploratory** | Faktor X₁...Xₙ → pengaruh terhadap Y? | Multi-variabel, korelasi/regresi |

### Contribution Statement

Tiga jenis kontribusi: **Improvement** (metode terbukti lebih baik), **Comparison** (perbandingan sistematis yang belum ada), **Novel Approach** (pendekatan baru). Kontribusi harus terhubung langsung dengan gap — kontribusi tanpa gap = klaim tanpa justifikasi.

### Hypothesis H₀ / H₁

- **H₀** (Null) = Tidak ada perbedaan signifikan — asumsi default, harus dibuktikan salah
- **H₁** (Alternative) = Ada perbedaan signifikan — diterima hanya jika H₀ ditolak
- Harus **falsifiable**, mengandung **metrik terukur**, dirumuskan **SEBELUM eksperimen**

### Rantai Operasionalisasi

```
RQ → Variable → Metric → Data → Analysis
```

Jika rantai ini tidak lengkap, RQ belum mature. Bi-directional: RQ yang tidak bisa jadi hipotesis testable harus direvisi mundur.

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan pertanyaan | Apa yang harus dibangun? | Apa yang harus dibuktikan? |
| Bentuk jawaban | Sistem yang berfungsi | Bukti empiris terukur |
| Sukses diukur oleh | User satisfaction, uptime | Signifikansi statistik, effect size |
| Jika gagal | Debug dan perbaiki | Laporkan, analisis mengapa |

### Istilah Penting

- **Research Question (RQ)** — Pertanyaan spesifik: variabel terukur + metrik + konteks
- **Contribution Statement** — Apa yang diketahui setelah riset selesai yang sebelumnya belum ada
- **H₀ / H₁** — Null vs Alternative Hypothesis
- **Falsifiability** — Kondisi hipotesis ditolak harus bisa didefinisikan sebelum eksperimen
- **Operationalization** — Proses mewujudkan konsep abstrak menjadi variabel terukur

---

## Template A.4 — RQ-Contribution-Hypothesis

```
RQ-CONTRIBUTION-HYPOTHESIS

Gap Statement  : Dataset review e-commerce berbahasa Indonesia masih terbatas dan model, klasifikasi sentimen (Naive Bayes & SVM) belum banyak diuji pada konteks, lokal Indonesia yang mengandung slang, bahasa campuran, dan imbalance data,  sehingga performa model belum optimal untuk karakteristik ulasan pengguna Indonesia. (Data Gap + Context Gap)

Research Question:
  Tipe         : [x] Comparison  [v] Improvement  [v] Exploratory
  Formulasi    : Apakah SVM menghasilkan F1-Score lebih tinggi dibandingkan Naive Bayes dalam klasifikasi sentimen ulasan produk e-commerce pada dataset berbahasa Indonesia?
  Variabel IV  : Jenis algoritma klasifikasi — SVM vs Naive Bayes
  Variabel DV  : Performa klasifikasi sentimen (positif / negatif / netral)
  Metrik       : F1-Score, Accuracy, Precision, Recall
  Dataset      : Dataset ulasan produk Bahasa Indonesia (Tokopedia/Shopee)
  Baseline     : Naive Bayes — dipilih karena merupakan metode dominan dan representatif pada studi sentimen lokal (Rahman et al., 2023; Putra et al., 2024)

Quality Check RQ:
  [x] Variabel spesifik
  [x] Metrik jelas
  [x] Baseline ada
  [x] Konteks disebutkan
  [x] Memerlukan eksperimen (bukan hanya survei literatur)

Contribution Statement:
  Apa yang baru diketahui : Perbandingan sistematis performa SVM vs Naive Bayes secara head-to-head pada dataset ulasan e-commerce berbahasa Indonesia yang merepresentasikan karakteristik lokal (slang,campur kode)
  Jenis kontribusi        : [x] Improvement  [v] Comparison  [v] Novel approach
  Gap yang diisi          : Data Gap — menggunakan dataset lokal Bahasa Indonesia Context Gap — menguji model pada konteks e-commerce Indonesia yang belum banyak diteliti secara sistematis

Hypothesis Pair:
  H₀ : Tidak ada perbedaan signifikan F1-Score antara SVM dan Naive Bayes dalam klasifikasi sentimen ulasan produk e-commerce berbahasa Indonesia
  H₁ : SVM menghasilkan F1-Score yang secara signifikan lebih tinggi dibandingkan Naive Bayes dalam klasifikasi sentimen ulasan produk e-commerce berbahasa Indonesia
  Threshold              : α = 0.05 (uji Wilcoxon Signed-Rank Test), atau selisih F1-Score ≥ 2% secara praktis
  Justifikasi threshold  : α = 0.05 adalah standar umum uji statistik dalam penelitian ML. Selisih ≥ 2% dipilih karena studi sebelumnya (Dewi et al., 2023) menunjukkan SVM konsisten unggul 3–5% atas Naive Bayes, sehingga selisih < 2% dianggap tidak bermakna secara praktis
```

---

## Latihan 1 — Dari Gap ke RQ

Gunakan gap yang ditemukan di WS-03. Transformasikan menjadi Research Question.

**Gap dari WS-03:** Dataset review e-commerce Bahasa Indonesia masih terbatas dan model klasifikasi sentimen belum banyak diuji pada konteks lokal Indonesia, sehingga hasil model belum optimal untuk karakteristik ulasan pengguna Indonesia (slang, bahasa campuran, imbalance data).

**RQ versi pertama (tulis bebas):**
> "Bagaimana perbandingan performa Naive Bayes dan SVM dalam mengklasifikasikan sentimen ulasan produk e-commerce berbahasa Indonesia?"

**Evaluasi RQ:**

| Komponen | Ada? | Isi |
|----------|------|-----|
| Metode spesifik |Ya|Naive Bayes vs SVM|
| Metrik terukur |Tidak |Belum disebutkan (Accuracy? F1-Score?)|
| Baseline |Ya|Mana yang jadi baseline, mana yang diuji|
| Dataset/konteks |Ya|"E-commerce Indonesia" — platform apa? Dataset apa?|

**Tipe RQ:** [v] Comparison / [ ] Improvement / [ ] Exploratory

**RQ versi revisi (setelah evaluasi):**
> "Apakah SVM menghasilkan F1-Score lebih tinggi dibandingkan Naive Bayes dalam klasifikasi sentimen ulasan produk pada dataset review Bahasa Indonesia dari platform Tokopedia/Shopee?"

---

## Latihan 2 — Hypothesis Pair

Rumuskan pasangan hipotesis dari RQ di Latihan 1.

| Komponen | Isi |
|----------|-----|
| H₀ | Tidak ada perbedaan signifikan F1-Score antara SVM dan Naive Bayes dalam klasifikasi sentimen ulasan produk e-commerce berbahasa Indonesia |
| H₁ | SVM menghasilkan F1-Score yang secara signifikan lebih tinggi dibandingkan Naive Bayes dalam klasifikasi sentimen ulasan produk e-commerce berbahasa Indonesia |
| Metrik | F1-Score (dipilih karena data berpotensi imbalanced antara ulasan positif, negatif, dan netral) |
| Threshold | α = 0.05 (p-value), atau selisih F1-Score ≥ 2% |
| Justifikasi threshold | Standar uji statistik penelitian ML; selisih <2% dianggap tidak bermakna secara praktis. SVM dalam literatur (Taufik et al., Dira et al.) konsisten unggul 3–5% atas NB |

**Apakah hipotesis ini falsifiable?** [v] Ya / [ ] Tidak
> Bagaimana cara membuktikannya salah? Hipotesis ditolak jika F1-Score SVM ≤ Naive Bayes pada eksperimen dengan dataset, preprocessing, dan split yang sama.

---

## Latihan 3 — Rantai Operasionalisasi

Lengkapi rantai dari RQ hingga metode analisis.

| Tahap | Isi |
|-------|-----|
| RQ | Apakah SVM menghasilkan F1-Score lebih tinggi dari Naive Bayes pada klasifikasi sentimen ulasan e-commerce Bahasa Indonesia? |
| Variable (IV) | Jenis algoritma klasifikasi: SVM vs Naive Bayes |
| Variable (DV) | Performa klasifikasi sentimen (positif / negatif / netral) |
| Metric | F1-Score, Accuracy, Precision, Recall |
| Data source | Dataset ulasan produk Bahasa Indonesia — Tokopedia/Shopee (bisa scraping atau dataset publik seperti IndoNLU / SmSA) |
| Analysis method | Eksperimen komparatif dengan k-fold cross validation (k=5/10); uji statistik Wilcoxon Signed-Rank Test |

**Apakah rantai lengkap?** [Ya] Ya / [ ] Tidak
> Jika tidak, tahap mana yang perlu direvisi?  semua tahap dari RQ hingga analisis terhubung.

---

## Refleksi

> Ambil satu judul skripsi/paper yang pernah dibaca. Coba ekstrak RQ-nya. Apakah RQ tersebut memenuhi semua komponen (metode, metrik, baseline, konteks)? Jika tidak, apa yang hilang?

**Judul:** “Analisis Sentimen Ulasan Produk E-Commerce Berbahasa Indonesia Menggunakan Metode Naive Bayes”
**RQ yang diekstrak:** Bagaimana performa metode Naive Bayes dalam mengklasifikasikan sentimen ulasan produk e-commerce berbahasa Indonesia
**Komponen yang hilang:** 
1. Metrik tidak disebutkan
→ Tidak jelas apakah menggunakan Accuracy, F1-Score, atau lainnya
2. Tidak ada baseline pembanding
→ Hanya fokus ke Naive Bayes tanpa perbandingan (tidak bisa menilai “lebih baik atau tidak”)
3. Dataset tidak spesifik
→ Tidak disebutkan sumber data (Tokopedia, Shopee, atau dataset publik)
4. Tidak menunjukkan kebutuhan eksperimen komparatif
→ Lebih cenderung deskriptif daripada eksperimental
