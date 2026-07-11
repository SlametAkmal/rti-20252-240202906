# WS-15: Scientific Writing

> **Bab 15 — Penulisan Ilmiah**

---

## Ringkasan Materi

### Scientific Argument Flow

```
Problem → Gap → RQ → Method → Result → Analysis → Conclusion → Contribution
```

Paper ilmiah adalah **satu argumen utuh** dari masalah ke kontribusi. Setiap node harus terhubung logis ke node sebelum dan sesudahnya.

### Struktur IMRAD

| Section | Peran | Pertanyaan Kunci |
|---------|-------|-----------------|
| **Introduction** | Motivasi + frame | Why is this needed? |
| **Method** | Deskripsi (reproducible) | How was it done? |
| **Results** | Laporan objektif | What was found? |
| **Discussion** | Interpretasi + refleksi | What does it mean? |
| **Conclusion** | Ringkasan + kontribusi | So what? |

### Logical Flow — "Red Thread"

Setiap paragraf menjawab satu pertanyaan dan memicu pertanyaan berikutnya. Alur logis ini harus terasa di tiga level:
1. **Antar-kalimat** dalam paragraf
2. **Antar-paragraf** dalam section
3. **Antar-section** dalam paper

### Internal Consistency

Setiap elemen yang dijanjikan di Introduction harus hadir di Discussion/Conclusion.

**Consistency Matrix:**
```
           Intro  Method  Result  Discuss  Conclude
RQ1          ✓      ✓       ✓       ✓        ✓
RQ2          ✓      ✓       ✓       ✗ ←      ✓
Metrik-X     ✗      ✗       ✓ ←     ✗        ✗
```
**Masalah:** RQ2 dibahas di semua bagian kecuali Discussion. Metrik-X muncul di Result tapi tidak diperkenalkan di Method.

### Writing Quality Triad

| Kualitas | Deskripsi | Contoh Buruk → Baik |
|----------|----------|---------------------|
| **Clarity** | Dipahami sekali baca | "Performa meningkat" → "Accuracy meningkat dari 85.3% ke 89.7%" |
| **Precision** | Istilah eksak, tanpa ambiguitas | "signifikan" → "signifikan secara statistik (p=0.003, d=1.2)" |
| **Conciseness** | Setiap kata menambah informasi | Hapus kalimat redundan, filler words |

### Urutan Penulisan yang Disarankan

1. **Method & Results** — paling stabil, tulis pertama
2. **Discussion** — interpretasi berdasarkan hasil
3. **Introduction** — frame sesuai temuan aktual
4. **Abstract & Conclusion** — terakhir

### Target Jumlah Kata

| Section | Target |
|---------|--------|
| Introduction | 500–700 |
| Related Work | 700–1000 |
| Method | 800–1200 |
| Results | 500–800 |
| Discussion | 600–900 |
| Conclusion | 200–400 |

### Jebakan Kognitif

1. "Lebih panjang = lebih lengkap" → conciseness lebih berharga
2. "Introduction harus ditulis pertama" → justru ditulis terakhir
3. "Jargon teknis = lebih ilmiah" → clarity lebih penting
4. "Discussion = ringkasan Results" → Discussion = interpretasi + konteks

---

## Template A.15 — Paper Structure Checklist

```
PAPER STRUCTURE CHECKLIST

Title   : Peran E-Commerce dalam Pengembangan Bisnis di Era Digital
Target  : [ ] Jurnal  [ ] Konferensi  [v] Laporan

Section Check:
  [v] Abstract — masalah, metode, hasil utama, kontribusi (max 250 kata)
  [v] Introduction — konteks → gap → RQ → kontribusi → struktur paper
  [v] Related Work — concept-centric, gap positioning
  [ ] Method — reproducible: desain, variabel, metrik, setup, prosedur
  [v] Results — tabel + grafik + observasi (tanpa interpretasi)
  [v] Discussion — interpretasi, perbandingan, implikasi, limitation
  [v] Conclusion — jawaban RQ, kontribusi, future work

Consistency Matrix:
  [v] RQ di Introduction = RQ di Method = RQ di Conclusion
  [v] Variabel di Method = variabel di Results
  [v] Klaim di Discussion didukung data di Results
  [v] Limitasi di Discussion di-address di Conclusion/Future Work

Writing Quality:
  [v] Clarity — mudah dipahami tanpa re-read
  [v] Precision — tidak ada istilah ambigu
  [v] Conciseness — tidak ada kalimat redundan
```

---

## Latihan 1 — Paper Outline

Buat outline paper untuk riset Anda menggunakan struktur IMRAD.

| Section | Konten Utama (2-3 kalimat) | Target Kata |
|---------|---------------------------|------------|
| Abstract | Artikel ini membahas bagaimana e-commerce dimanfaatkan sebagai strategi pengembangan bisnis di tengah pesatnya transformasi digital. Kajian dilakukan dengan menelaah beberapa penelitian yang relevan untuk menemukan manfaat, tantangan, dan peluang penerapan e-commerce bagi pelaku usaha. | 200-250 |
| Introduction | Perubahan perilaku konsumen membuat bisnis semakin bergantung pada teknologi digital. Walaupun e-commerce telah digunakan secara luas, hasil penelitian masih menunjukkan perbedaan mengenai faktor yang paling berpengaruh terhadap keberhasilan bisnis. Oleh karena itu, penelitian ini menyusun dan membandingkan berbagai temuan dari penelitian sebelumnya. | 500-700 |
| Related Work | Bagian ini mengulas penelitian mengenai adopsi e-commerce, pemasaran digital, transformasi bisnis, dan perkembangan UMKM. Pembahasan difokuskan pada persamaan maupun perbedaan hasil penelitian sebagai dasar untuk memperkuat analisis. | 700-1000 |
| Method | Penelitian menggunakan pendekatan studi literatur dengan memilih jurnal yang memiliki keterkaitan langsung dengan topik penelitian. Setiap artikel dianalisis berdasarkan tujuan, metode, objek penelitian, dan hasil utama sebelum dilakukan sintesis untuk memperoleh kesimpulan. | 800-1200 |
| Results | Hasil kajian menunjukkan bahwa sebagian besar penelitian melaporkan dampak positif e-commerce terhadap peningkatan penjualan, perluasan pasar, serta efisiensi aktivitas bisnis. Selain itu, ditemukan beberapa faktor yang memengaruhi keberhasilan implementasi, seperti strategi pemasaran digital dan kesiapan teknologi. | 500-800 |
| Discussion | Temuan dari berbagai penelitian dibandingkan untuk mengetahui alasan munculnya perbedaan hasil. Pembahasan juga menjelaskan hubungan antara penerapan e-commerce dengan pengembangan bisnis serta menguraikan keterbatasan yang masih terdapat pada penelitian terdahulu. | 600-900 |
| Conclusion | Berdasarkan hasil kajian, e-commerce terbukti menjadi salah satu faktor yang mendukung perkembangan bisnis di era digital. Penelitian berikutnya disarankan memperluas cakupan referensi dan mengombinasikan studi literatur dengan data lapangan agar memperoleh hasil yang lebih komprehensif. | 200-400 |

---

## Latihan 2 — Consistency Matrix

Buat consistency matrix untuk memverifikasi internal consistency paper Anda.

| Komponen | Intro | Method | Result | Discussion | Conclusion |
|--|-------|--------|--------|-----------|-----------|
| RQ1 (Bagaimana peran e-commerce dalam pengembangan bisnis?) | v | v | v | v | v |
| RQ1 (Bagaimana peran e-commerce dalam pengembangan bisnis?) | v | v | v | v | v |
| Metrik utama | v | v | v | v | v |
| Variabel IV | v | v | v | v | v |
| Variabel DV | v | v | v | v | v |
| Klaim/kontribusi | v | v | v | v | v |

**Isi setiap sel:** ✓ (ada & konsisten), ✗ (missing), ~ (ada tapi inkonsisten)

**Inkonsistensi yang ditemukan:**
> Kontribusi penelitian pada bagian metode belum dijelaskan secara rinci karena fokus metode hanya menjelaskan proses pemilihan dan analisis jurnal.

**Tindakan perbaikan:**
> Menambahkan penjelasan mengenai alasan pemilihan sumber referensi serta hubungan metode analisis dengan tujuan penelitian agar seluruh bagian saling mendukung dan lebih konsisten.

---

## Latihan 3 — Writing Quality Check

Ambil satu paragraf dari tulisan Anda (atau tulis paragraf baru) dan evaluasi kualitasnya.

**Paragraf asli:**
> E-commerce merupakan salah satu teknologi yang banyak digunakan oleh pelaku usaha untuk mengembangkan bisnis di era digital. Penggunaan e-commerce dapat membantu meningkatkan penjualan, memperluas jangkauan pasar, dan mempermudah proses transaksi. Namun, keberhasilan penerapannya dipengaruhi oleh kesiapan teknologi, strategi pemasaran, dan kemampuan sumber daya manusia.

| Kriteria | Evaluasi | Perbaikan |
|----------|---------|-----------|
| Clarity | Kalimat kedua memuat beberapa manfaat sekaligus sehingga kurang fokus. | Pisahkan manfaat menjadi beberapa kalimat agar lebih mudah dipahami. |
| Precision | Istilah "mengembangkan bisnis" masih bersifat umum. | Jelaskan bahwa pengembangan bisnis mencakup peningkatan penjualan, efisiensi operasional, dan perluasan pasar. |
| Conciseness | Ada beberapa informasi yang dapat disampaikan dengan kalimat yang lebih ringkas. | Hilangkan pengulangan kata "e-commerce" dan gunakan kalimat yang lebih padat. |

**Paragraf setelah perbaikan:**
> Penerapan e-commerce menjadi salah satu strategi yang banyak dimanfaatkan pelaku usaha untuk menghadapi persaingan di era digital. Teknologi ini membantu memperluas jangkauan pasar, meningkatkan efisiensi transaksi, serta mendukung pertumbuhan penjualan. Meskipun demikian, keberhasilannya tetap dipengaruhi oleh kesiapan teknologi, kemampuan sumber daya manusia, dan penerapan strategi pemasaran yang tepat.

---

## Refleksi

> Apa perbedaan antara menulis "tentang" riset dan menulis sebagai "argumen" riset? Bagaimana urutan penulisan (Method → Discussion → Introduction) mengubah kualitas tulisan?

> Menulis tentang riset berarti hanya menjelaskan isi atau hasil penelitian. Sebaliknya, menulis sebagai argumen riset menuntut penulis menyusun alasan yang didukung oleh bukti sehingga pembaca memahami mengapa penelitian tersebut penting dan bagaimana hasilnya menjawab rumusan masalah.
> Menyusun tulisan dimulai dari Method, kemudian Discussion, dan terakhir Introduction membantu menjaga konsistensi isi. Dengan mengetahui metode dan hasil terlebih dahulu, pendahuluan dapat disusun lebih terarah serta sesuai dengan tujuan dan temuan penelitian.
