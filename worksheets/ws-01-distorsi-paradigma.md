# WS-01: Distorsi & Paradigma

> **Bab 1 — Research Mindset in IT**

---

## Ringkasan Materi

### Research Trust Model

Pengetahuan ilmiah tidak muncul langsung dari kenyataan. Ia melewati **6 tahap transformasi** yang masing-masing rawan distorsi:

```
Reality → Data → Processing → Analysis → Inference → Knowledge
```
Contoh : Observasi sistem presensi mahasiswa berbasis QR Code di sebuah kampus menghasilkan data kehadiran mahasiswa setiap perkuliahan. Distorsi dapat terjadi jika mahasiswa melakukan scan QR code untuk temannya (titip absen), jika sistem gagal membaca QR code dengan benar, atau jika kesimpulan diambil tanpa memverifikasi kehadiran secara langsung di kelas.

Etika mencegah distorsi yang disengaja (fabrikasi, cherry-picking). Validitas mendeteksi distorsi yang tidak disengaja (confounding variable, sampling bias).

### Tiga Jenis Validitas

| Jenis | Pertanyaan | Contoh Ancaman |
|-------|-----------|----------------|
| **Internal Validity** | Apakah hubungan kausal benar ada? | Hasil kehadiran bisa tidak akurat karena adanya kecurangan seperti titip absen atau kesalahan sistem dalam membaca QR code, sehingga hubungan antara kehadiran dan kondisi nyata di kelas menjadi tidak valid. |
| **External Validity** | Apakah bisa digeneralisasi? | Data presensi hanya berasal dari satu kampus atau sistem tertentu, sehingga hasilnya belum tentu bisa diterapkan pada kampus lain dengan kondisi atau teknologi yang berbeda. |
| **Construct Validity** | Apakah mengukur hal yang benar? | Kehadiran hanya diukur dari scan QR code tanpa memastikan mahasiswa benar-benar mengikuti perkuliahan, sehingga tidak sepenuhnya mencerminkan kehadiran yang sebenarnya.|

### Paradigma Riset

Mata kuliah ini menggunakan pendekatan **Positivist** ( menganalisis data kehadiran mahasiswa secara objektif dan menguji keakuratan sistem presensi QR Code.) diperkuat **Design Science Research** (DSR). merancang dan mengembangkan sistem presensi berbasis QR Code sebagai solusi untuk meningkatkan keakuratan dan mencegah kecurangan.

### Mode Berpikir Peneliti

**Curious**  memiliki rasa ingin tahu yang tinggi dan selalu mempertanyakan suatu fenomena. Critical berarti peneliti mampu menganalisis dan mengevaluasi informasi secara objektif. Systematic berarti peneliti melakukan proses penelitian secara terstruktur dan dapat dipertanggungjawabkan.

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan | Membuat sistem yang bekerja | Menghasilkan pengetahuan yang valid |
| Pertanyaan khas | "Bagaimana membuatnya jalan?" | "Apakah klaim ini benar?" |
| Ukuran sukses | Sistem berfungsi, client puas | Hipotesis terjawab, temuan tervalidasi |
| Kegagalan | Harus dihindari | Harus dilaporkan (negative result = kontribusi) |

### Istilah Penting

- **Research Mindset** — Pola pikir yang menuntut bukti dan mempertanyakan asumsi
- **Research Ethics** — Prinsip perilaku: kejujuran, objektivitas, keterbukaan, akuntabilitas
- **HARKing** — Hypothesizing After Results are Known — merumuskan hipotesis setelah melihat data
- **Falsifiability** — Hipotesis harus bisa dibuktikan salah

---

## Contoh Ringkasan

Materi ini membahas tentang mindset penelitian dalam bidang teknologi informasi. Pengetahuan ilmiah tidak diperoleh secara langsung, tetapi melalui proses bertahap yang disebut Research Trust Model, yaitu dari reality, data, processing, analysis, inference, hingga menjadi knowledge. Dalam setiap tahap tersebut terdapat potensi distorsi yang dapat mempengaruhi hasil penelitian, baik yang disengaja maupun tidak disengaja.

Selain itu, terdapat tiga jenis validitas yang penting dalam penelitian, yaitu internal validity untuk memastikan hubungan sebab-akibat, external validity untuk melihat apakah hasil dapat digeneralisasi, dan construct validity untuk memastikan bahwa yang diukur sudah sesuai dengan tujuan penelitian.

Materi ini juga menjelaskan paradigma riset seperti positivist yang berfokus pada pengujian hipotesis menggunakan data, dan design science research yang berfokus pada pembuatan solusi atau sistem sebagai bentuk kontribusi penelitian.

Terakhir, peneliti harus memiliki mode berpikir yang terdiri dari curious, critical, dan systematic agar dapat menghasilkan penelitian yang valid, objektif, dan dapat dipertanggungjawabkan.

---


## Research Mindset Self-Assessment

```
Nama Peneliti    : Slamet Akmal
Tanggal          : 18 April 2026

1. Ketika membaca klaim "metode X 95% akurat":
   - Pertanyaan pertama saya: Apakah metode pengujian sudah lengkap?
   - Data yang dibutuhkan untuk verifikasi: dataset yang digunakan dalam penelitian, metode pembagian data (training dan testing), metrik evaluasi seperti akurasi, precision, dan recall, serta hasil perbandingan dengan metode lain sebagai pembanding.

2. Posisi paradigma:
   - Pendekatan: [x] Positivis  [x] Interpretivis  [x] Design Science  [v] Mixed
   - Alasan: Penelitian menggunakan pendekatan positivis untuk menganalisis data kehadiran secara kuantitatif, serta design science untuk merancang dan mengembangkan sistem presensi berbasis QR Code.

3. Identifikasi distorsi:
   - Asumsi tersembunyi: Semua mahasiswa yang melakukan scan QR Code dianggap benar-benar hadir di kelas
   - Sumber bias potensial: Kecurangan seperti titip absen, kesalahan sistem dalam membaca QR Code, serta gangguan jaringan saat proses presensi
   - Langkah mitigasi: Menambahkan verifikasi tambahan seperti foto atau lokasi (GPS), memastikan sistem berjalan dengan baik, serta melakukan pengecekan langsung oleh dosen di kelas

4. Komitmen etika:
   - Data yang tidak akan dimanipulasi:  Data kehadiran mahasiswa hasil scan QR Code dan hasil pengujian sistem
   - Batasan yang diakui sejak awal: Sistem presensi berbasis QR Code memiliki keterbatasan seperti potensi kecurangan (titip absen), ketergantungan pada jaringan, serta kemungkinan kesalahan pembacaan QR Code
```

---

## Latihan 1 — Identifikasi Distorsi

Pilih satu paper riset di bidang TI yang mengklaim "metode X meningkatkan performa." Telusuri setiap tahap Research Trust Model.

**Paper yang dipilih:** 
> Judul: Anomaly Detection Based on CNN and Regularization Techniques Against Zero-Day Attacks in IoT Networks
> Tahun: 2022
> Sumber: IEEE Xplore
> Link: https://ieeexplore.ieee.org/document/9888105

| Tahap | Apa yang Dilakukan | Potensi Distorsi |
|-------|-------------------|-----------------|
| Reality → Data | Mengumpulkan data trafik jaringan dari perangkat IoT |
| Data → Processing |Membersihkan data, menghapus noise, dan melakukan normalisasi | Penghapusan data tertentu dapat menghilangkan informasi penting  |
| Processing → Analysis | Menerapkan model CNN untuk mendeteksi anomali | Model terlalu menyesuaikan data (overfitting) |
| Analysis → Inference |Menarik kesimpulan bahwa metode CNN memiliki akurasi tinggi | Tidak membandingkan dengan metode lain secara adil |
| Inference → Knowledge |  Menyimpulkan bahwa metode CNN efektif untuk semua kasus deteksi anomali | Generalisasi berlebihan karena hanya diuji pada dataset tertentu |

**Distorsi paling besar di tahap:** Data → Processing

**Dua distorsi spesifik yang teridentifikasi:**
1. Penghapusan data saat proses pembersihan yang dapat menghilangkan informasi penting
2. Dataset yang tidak seimbang antara data normal dan anomali sehingga mempengaruhi hasil analisis

---

## Latihan 2 — Analisis Kasus Etika

Skenario: Seorang peneliti menemukan bahwa jika 3 data point outlier dihapus, hasil eksperimennya menjadi signifikan. Dengan outlier, hasilnya tidak signifikan.

| Perspektif | Analisis |
|------------|---------|
| Kejujuran ilmiah | Peneliti tidak boleh menghapus 3 data outlier hanya untuk membuat hasil menjadi signifikan, karena hal tersebut termasuk manipulasi data |
| Transparansi |Peneliti harus menjelaskan keberadaan outlier, alasan jika dilakukan penghapusan, serta menyajikan hasil sebelum dan sesudah penghapusan  |
| Peer review | Reviewer kemungkinan akan mempertanyakan atau menolak penelitian jika data dihapus tanpa alasan yang jelas dan metodologis |

**Keputusan akhir dan justifikasi:**
> Peneliti tidak boleh menghapus outlier secara sembarangan. Jika outlier memang tidak valid (misalnya kesalahan pengukuran), maka harus dijelaskan dengan jelas. Namun, hasil penelitian sebaiknya tetap dilaporkan dalam dua kondisi (dengan dan tanpa outlier) untuk menjaga kejujuran dan transparansi.

---

## Latihan 3 — Posisi Paradigma

**Topik riset:** Analisis dan pengembangan sistem presensi mahasiswa berbasis QR Code untuk meningkatkan keakuratan kehadiran

> **Skala 1–5:** 1 = tidak sesuai sama sekali dengan topik ini, 5 = sangat sesuai dan dominan digunakan pada riset bertopik serupa.

| Kriteria | Positivis | Interpretivis | Design Science |
|----------|-----------|---------------|----------------|
| Kesesuaian dengan topik (1–5) | *Contoh: 4 — topik kuantitatif, cocok uji hipotesis* | *Contoh: 2 — topik tidak studi makna/konteks* | *Contoh: 5 — membangun artefak untuk uji klaim* |
| Jenis data yang dikumpulkan | *Metrik numerik, log eksperimen* | *Wawancara, observasi kualitatif* | *Hasil uji artefak, komparasi kinerja* |
| Limitasi paradigma | | | |

**Paradigma yang dipilih:** Mixed (Positivist dan Design Science)
**Alasan:** Penelitian menggunakan pendekatan positivist untuk menganalisis data kehadiran mahasiswa secara kuantitatif, serta design science untuk merancang dan mengembangkan sistem presensi berbasis QR Code sebagai solusi untuk meningkatkan keakuratan dan mengurangi kecurangan.

---

## Refleksi

> Sebelum membaca materi ini, apakah pernah mempertanyakan klaim "95% akurat"? Setelah memahami rantai distorsi, pertanyaan apa yang sekarang akan diajukan saat membaca paper?

**Jawaban:**
> Sebelum membaca materi ini, saya cenderung langsung percaya terhadap klaim seperti "95% akurat" tanpa mempertanyakan lebih lanjut. Setelah memahami adanya rantai distorsi dalam proses penelitian, saya menjadi lebih kritis dalam menilai suatu hasil.

