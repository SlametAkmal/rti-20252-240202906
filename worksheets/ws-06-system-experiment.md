# WS-06: System-Experiment Mapping

> **Bab 6 — System Design sebagai Experimental Artifact**

---

## Ringkasan Materi

### Sistem = Instrumen Pengujian, Bukan Produk

Seorang engineer bertanya "apakah sistem bekerja?" — seorang peneliti bertanya "apa yang bisa dibuktikan sistem ini?" Sistem dalam riset adalah **artifact** — objek yang sengaja dibuat untuk menguji klaim spesifik.

### System as Experiment Model

```
RQ → Variable → System Component → Experimental Setup → Output
```

Setiap komponen sistem harus bisa ditelusuri ke variabel riset (top-down), dan setiap pengukuran harus menjawab RQ (bottom-up).

### Mapping Variabel ke Komponen

| Tipe Variabel | Peran di Sistem | Contoh |
|---------------|----------------|--------|
| **IV** (Independent) | Modul yang bisa di-toggle/swap | Algoritma A vs B |
| **DV** (Dependent) | Modul pengukuran | Logger, metrics collector |
| **CV** (Control) | Config yang dikunci | Dataset, parameter tetap |

Jika variabel tidak bisa di-map ke komponen apapun → arsitektur perlu didesain ulang.

### 4 Prinsip Desain Eksperimental

| Prinsip | Pertanyaan Kunci |
|---------|-----------------|
| **Traceability** | Komponen ini melayani variabel yang mana? |
| **Modularity** | Bisakah IV diubah tanpa memengaruhi yang lain? |
| **Controllability** | Apakah CV dieksternalisasi ke config file? |
| **Measurability** | Apakah sistem otomatis menghasilkan data yang dibutuhkan? |

### Variable Isolation melalui Arsitektur

- **Modular architecture** — Pisahkan berdasarkan variabel
- **Configuration-driven** — Ubah config (YAML/JSON), bukan code
- **Feature toggles** — On/off flag untuk ablation study

### Research vs Engineering

| Aspek | Engineering | Research |
|-------|------------|----------|
| Tujuan sistem | Memenuhi kebutuhan user | Menguji hipotesis, menghasilkan bukti |
| Arsitektur | Optimasi performa & skalabilitas | Optimasi isolasi variabel & reprodusibilitas |
| Konfigurasi | Sering hardcoded | Dieksternalisasi ke config file |
| Fitur tambahan | Menambah nilai user | Menambah noise jika tidak terkait RQ |

### Istilah Penting

- **Artifact** — Objek yang sengaja dibuat untuk memecahkan masalah atau menguji proposisi
- **Traceability** — Kemampuan menelusuri hubungan RQ → variabel → komponen → output
- **Variable Isolation** — Mengubah hanya satu variabel sambil menahan yang lain konstan
- **Ablation Study** — Menguji kontribusi tiap komponen dengan melepasnya satu per satu
- **Configuration-driven Execution** — Semua parameter di config file, bukan hardcoded

---

## Template A.6 — Mapping RQ ke Arsitektur Sistem

```
SYSTEM-EXPERIMENT MAPPING

Research Question: Bagaimana penggunaan e-commerce dapat membantu perkembangan bisnis di era digital?

Variable → Component Mapping:
| Variabel | Tipe | Komponen Sistem | Cara Manipulasi/Pengukuran |
|----------|------|-----------------|---------------------------|
| Penggunaan e-commerce | IV | Marketplace atau website penjualan online | Menggunakan platform e-commerce untuk transaksi |
| Jumlah penjualan | DV | Sistem laporan penjualan | Dilihat dari peningkatan transaksi penjualan |
| Produk yang dijual | CV | Database produk | Produk tetap sama selama penelitian |
| Harga produk | CV | Sistem pengaturan harga | Harga tidak diubah saat eksperimen |
| Sistem pembayaran online | IV | Payment gateway | Mengaktifkan metode pembayaran digital |
| Kepuasan pelanggan | DV | Fitur ulasan pelanggan | Dilihat dari rating dan komentar pelanggan |



4 Prinsip Desain:
  [v] Traceability — Setiap komponen bisa ditelusuri ke variabel
  [v] Variable Isolation — IV bisa diubah tanpa mengubah CV
  [v] Measurement Integration — Pengukuran DV built-in
  [v] Reproducibility — Setup bisa direkonstruksi

Experimental Setup:
  Input data     : Data transaksi penjualan online
  Parameter      : Produk, harga, dan metode pembayaran
  Output format  : Grafik dan laporan hasil penjualan
```

---

## Latihan 1 — Variable-to-Component Mapping

Gunakan RQ dan variabel dari WS-05. Petakan ke komponen sistem.

**RQ:** Bagaimana penggunaan e-commerce dapat membantu perkembangan bisnis di era digital?

| Variabel | Tipe | Komponen Sistem | Cara Manipulasi/Pengukuran |
|----------|------|-----------------|---------------------------|
| Penggunaan e-commerce | IV | Marketplace atau website penjualan online | Menggunakan platform e-commerce untuk transaksi |
| Jumlah penjualan | DV | Sistem laporan penjualan | Dilihat dari peningkatan transaksi penjualan |
| Produk yang dijual | CV | Database produk | Produk tetap sama selama penelitian |
| Harga produk | CV | Sistem pengaturan harga | Harga tidak diubah saat eksperimen |
| Sistem pembayaran online | IV | Payment gateway | Mengaktifkan metode pembayaran digital |
| Kepuasan pelanggan | DV | Fitur ulasan pelanggan | Dilihat dari rating dan komentar pelanggan |

**Apakah semua variabel bisa di-map?** [v] Ya / [ ] Tidak
> Jika tidak, komponen apa yang perlu ditambahkan? _________

---

## Latihan 2 — 4 Prinsip Desain

Evaluasi desain sistem terhadap 4 prinsip.

| Prinsip | Status | Bukti / Penjelasan |
|---------|--------|-------------------|
| Traceability | v | Komponen sistem sesuai dengan variabel penelitian |
| Modularity | v | Setiap fitur dapat digunakan secara terpisah |
| Controllability | v | Harga dan produk dapat dikontrol |
| Measurability | v | Data transaksi dan ulasan pelanggan bisa diukur |

**Prinsip mana yang paling sulit dipenuhi?** Measurability
**Strategi untuk mengatasinya:**
> Menggunakan fitur laporan otomatis agar data penjualan dan transaksi lebih mudah dicatat.

---

## Latihan 3 — Ablation Study Planning

Jika sistem memiliki 3 komponen utama, rencanakan ablation study.

> **Panduan jumlah kondisi:** Untuk 3 komponen (A, B, C), kondisi minimal yang direkomendasikan:
> Full + (-A) + (-B) + (-C) = **4 kondisi dasar**. Jika waktu memungkinkan, tambahkan kombinasi ganda: (-A,-B), (-A,-C), (-B,-C) = **7 kondisi**. Sesuaikan dengan *computational cost* dan tenggat waktu penelitian.

| Kondisi | Komponen A | Komponen B | Komponen C | Hasil yang Diharapkan |
|---------|-----------|-----------|-----------|----------------------|
| Full | ✅ Marketplace | ✅ Pembayaran Online | ✅ Promosi Digital | Penjualan meningkat |
| Tanpa fitur chat | ❌ | ✅ | ✅ | Pelanggan kesulitan bertanya tentang produk |
| Tanpa sistem diskon | ✅ | ❌ | ✅ | Jumlah pembelian menurun |
| Tanpa pengiriman online | ✅ | ✅ | ❌ | Proses belanja menjadi kurang praktis |

**Komponen mana yang diprediksi paling berkontribusi?** Marketplace online
**Mengapa?**
> Karena marketplace membantu penjual menjangkau lebih banyak pelanggan dengan lebih mudah.

---

## Refleksi

> Apa risiko jika sistem dibangun seperti produk (monolitik, fitur lengkap) lalu baru dilakukan eksperimen? Mengapa arsitektur modular penting untuk riset?

**Jawaban:**
> Jika sistem dibuat terlalu kompleks seperti produk asli, maka proses penelitian akan lebih sulit karena semua fitur saling berhubungan. Arsitektur modular penting supaya setiap bagian sistem bisa diuji satu per satu dan hasil penelitian lebih jelas.
