# WS-05: Variabel & Metrik

> **Bab 5 — Metric, Measurement & Data**

---

## Ringkasan Materi

### Measurement Alignment Model

Setiap pengukuran yang valid harus bisa ditelusuri melalui rantai ini tanpa lompatan logis:

```
Problem → Concept → Variable → Metric → Data → Result
```

### Operationalization = Keputusan Desain

Menerjemahkan konsep abstrak menjadi variabel terukur bukan proses mekanis. "Code quality" yang diukur via SonarQube code smells membawa asumsi implisit. Setiap operasionalisasi harus didokumentasikan dan dijustifikasi.

### Empat Tipe Data (NOIR)

| Tipe | Ciri | Contoh | Operasi Valid |
|------|------|--------|---------------|
| **Nominal** | Kategori, tanpa urutan | Jenis algoritma (RF, SVM, CNN) | Modus, chi-square |
| **Ordinal** | Urutan, interval tidak sama | Skala Likert (1-5) | Median, Spearman |
| **Interval** | Jarak bermakna, tanpa nol absolut | Suhu Celsius | Mean, Pearson, t-test |
| **Ratio** | Jarak bermakna + nol absolut | Waktu eksekusi (ms) | Semua operasi |

Tipe data menentukan uji statistik yang valid. Kebanyakan metrik performa TI = ratio; persepsi pengguna = ordinal.

### Kriteria Pemilihan Metrik

- **Representative** — Mewakili konsep yang diteliti
- **Sensitive** — Cukup peka menangkap perbedaan bermakna (hindari ceiling effect)
- **Feasible** — Bisa dikumpulkan dalam batasan waktu dan biaya

### Pre-registration

Metrik harus ditentukan **sebelum** eksperimen. Memilih metrik setelah melihat data = **p-hacking**. Metrik tambahan yang ditemukan kemudian dilaporkan sebagai *exploratory*, bukan *confirmatory*.

### Primary vs Secondary Metric

- **Primary Metric** — Langsung terikat ke hipotesis, menentukan kesimpulan
- **Secondary Metric** — Pendukung, dilaporkan di samping primary; statusnya suplementer

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Pemilihan metrik | Berdasarkan kebiasaan/tool yang ada | Berdasarkan construct validity |
| Anomali | Dihapus untuk laporan bersih | Diinvestigasi — bisa jadi temuan |
| Kapan dipilih | Setelah sistem jadi (monitoring) | Sebelum eksperimen (by design) |

### Istilah Penting

- **Operationalization** — Transformasi konsep abstrak menjadi variabel terukur
- **Construct Validity** — Sejauh mana pengukuran benar-benar mengukur konsep yang dimaksud
- **Measurement Scale** — Klasifikasi data (NOIR) yang menentukan analisis valid
- **Multi-metric Evaluation** — Menggunakan beberapa metrik untuk menangkap konsep kompleks

---

## Template A.5 — Definisi Variabel, Metrik & Justifikasi

```
VARIABLE & METRIC DEFINITION

Research Question: Apakah penggunaan e-commerce berpengaruh terhadap perkembangan bisnis pelaku usaha di era digital?

| Variabel | Tipe | Konsep | Metrik | Skala | Satuan | Cara Mengukur | Justifikasi |
|----------|------|--------|--------|-------|--------|---------------|-------------|
| Penggunaan | IV   | Seberapa aktif pelaku bisnis memanfaatkan | Frekuensi transaksi online per bulan | Ratio | Transaksi/bulan | Dicatat dari dashboard penjualan platform | Frekuensi transaksi mencerminkan intensitas penggunaan e-commerce secara langsung |
|  Perkembangan | DV   | Pertumbuhan usaha yang terjadi setelah pelaku bisnis | Persentase kenaikan omzet penjualan per bulan | Ratio | 0% | Membandingkan rata-rata omzet 3 bulan sebelum | Jurnal menyebut e-commerce berperan meningkatkan jumlah penjualan dan memperluas pasar |
| Jenis platform | CV   | Model transaksi yang digunakan pelaku bisnis | Kategori platform: B2B, B2C, atau C2C | Responden memilih jenis platform yang digunakan | Jenis platform mempengaruhi skala dan pola transaksi. B2B dan C2C punya dinamika pasar berbeda | e-commerce | (B2B, B2C, C2C seperti Tokopedia, OLX,)|

Alignment Check:
  RQ → Concept → Variable → Metric → Data → Result
  [v] Setiap langkah terdokumentasi
  [v] Tidak ada "lompatan logis"
  [v] Metrik mengukur apa yang dimaksud (construct validity)
```

---

## Latihan 1 — Operationalization Chain

Gunakan RQ dari WS-04. Definisikan variabel dan metriknya.

**RQ:** Apakah penggunaan e-commerce berpengaruh terhadap perkembangan bisnis pelaku usaha di era digital?

| Variabel | Tipe | Konsep Abstrak | Metrik Konkret | Skala (NOIR) | Satuan |
|----------|------|---------------|----------------|-------------|--------|
| Penggunaan e-commerce | IV | Seberapa aktif pelaku bisnis memanfaatkan platform e-commerce (marketplace, website,) | Frekuensi transaksi online per bulan | Ratio | Transaksi/bulan |
| Perkembangan bisnis | DV | Pertumbuhan usaha yang dirasakan pelaku bisnis setelah menggunakan e-commerce | Persentase kenaikan omzet penjualan per bulan | Ratio | % |
| Jenis platform e-commerce | CV | Model transaksi yang digunakan (B2B, B2C, C2C) | Kategori platform: Tokopedia, Shopee, OLX. | Nominal |-|

**Apakah ada lompatan logis dalam rantai?** [ ] Ya / [ ] Tidak
> Jika ya, di mana? Rantai sudah terhubung: RQ menanyakan pengaruh e-commerce → konsep "penggunaan e-commerce" diukur via frekuensi transaksi (bisa dicatat dari dashboard platform) → hasilnya dikaitkan ke omzet sebagai indikator perkembangan bisnis yang konkret dan terukur.

---

## Latihan 2 — Evaluasi Metrik

Evaluasi metrik DV yang dipilih di Latihan 1 menggunakan 3 kriteria.

| Kriteria | Skor (1-5) | Justifikasi |
|----------|-----------|-------------|
| Representative | 4 | Omzet langsung mencerminkan perkembangan bisnis. Jurnal menyebut e-commerce meningkatkan jumlah penjualan dan memperluas jangkauan pasar, sehingga kenaikan omzet wajar dijadikan indikator utama. |
| Sensitive | 3 | Persentase omzet cukup peka menangkap perubahan, tapi bisa terpengaruh faktor musiman (misal: Ramadan, Harbolnas) yang tidak ada hubungannya dengan penggunaan e-commerce itu sendiri. |
| Feasible | 4 | Data omzet relatif mudah didapat dari catatan penjualan pelaku usaha atau fitur analitik di platform seperti Tokopedia/Shopee. Jurnal juga menyebut bahwa e-commerce sendiri sudah menyediakan data pelanggan bagi pelaku bisnis. |

**Apakah perlu secondary metric?** [v] Ya / [ ] Tidak
> Jika ya, apa dan mengapa? Secondary metric: jumlah pelanggan baru per bulan. Alasannya, jurnal menekankan bahwa salah satu peran utama e-commerce adalah memperluas jangkauan pasar dan basis konsumen. Omzet bisa naik karena pelanggan lama beli lebih banyak, bukan karena ada pelanggan baru — padahal ekspansi pasar adalah inti dari RQ ini. Dua metrik ini saling melengkapi.

**Contoh kasus ceiling effect untuk metrik ini:**
> Jika penelitian hanya dilakukan pada toko yang sudah sangat besar dan mapan di Tokopedia/Shopee, omzet mereka sudah di titik jenuh sehingga kenaikan bulanannya kecil meski e-commerce tetap berperan. Akibatnya, perbedaan antar kelompok jadi tidak kelihatan.

---

## Latihan 3 — Data Quality Check

Bayangkan data yang akan dikumpulkan dari eksperimen. Evaluasi 4 dimensi kualitas data.

| Dimensi | Pertanyaan | Jawaban | Strategi Mitigasi |
|---------|-----------|---------|------------------|
| Completeness | Apakah semua data point terkumpul?| Belum tentu beberapa pelaku usaha kecil tidak mencatat omzet secara rinci, apalagi UMKM rumahan | Minta responden mengisi estimasi omzet dengan rentang (misal: Rp1–5 juta, Rp5–10 juta) agar tetap bisa diisi walau tidak ada catatan pasti |
| Consistency |Apakah ada kontradiksi internal? | Bisa terjadi  responden mengaku omzet naik tapi frekuensi transaksi dilaporkan turun | Tambahkan pertanyaan cross-check di kuesioner, misal: "Berapa rata-rata pesanan masuk per minggu?" lalu bandingkan dengan jawaban omzet |
| Validity | Apakah benar-benar mengukur yang dimaksud? | Risiko ada kenaikan omzet bisa karena faktor lain (diskon besar, tren produk viral) bukan karena e-commerce | Tanyakan secara eksplisit: "Berapa persen penjualan Anda berasal dari platform online?" untuk memisahkan kontribusi e-commerce |
| Representativeness | Apakah sampel mewakili populasi target?| Belum tentu — jurnal menyebut ada kesenjangan infrastruktur antara kota besar dan kota kecil di Indonesia | Pastikan sampel mencakup pelaku usaha dari berbagai daerah, tidak hanya Jawa/kota besar |

---

## Refleksi

> Mengapa memilih metrik setelah melihat data dianggap p-hacking? Apa bedanya dengan eksplorasi data yang sah?

**Jawaban:**
> Kalau metrik dipilih setelah data ada, peneliti (sadar atau tidak) cenderung pilih metrik yang hasilnya bagus atau sesuai harapan. Ini masalah serius karena kesimpulannya terlihat valid padahal sebetulnya sudah "diarahkan" dari awal. Sama seperti menembak dulu ke tembok lalu menggambar sasarannya di sekitar lubang peluru — hasilnya kelihatan tepat sasaran, tapi tidak jujur.
Bedanya dengan eksplorasi yang sah: kalau dari awal sudah ditetapkan metrik utama (confirmatory), lalu saat analisis ditemukan pola menarik lain dan itu dilaporkan secara terpisah sebagai temuan eksploratif — itu boleh dan bahkan berguna. Yang tidak boleh adalah menggeser metrik eksploratif itu menjadi seolah-olah itu metrik utama yang sudah direncanakan sejak awal. Dalam konteks jurnal e-commerce ini misalnya: kalau awalnya metrik utama adalah omzet, lalu ternyata data kepuasan pelanggan lebih "menarik", tidak boleh tiba-tiba menukar keduanya tanpa mengakuinya.