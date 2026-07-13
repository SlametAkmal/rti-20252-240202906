# Rencana Penelitian: Mitigasi JWKS Endpoint Flooding dengan Redis-PostgreSQL Hybrid Caching

## 1. Ringkasan Penelitian

| Item | Keterangan |
|---|---|
| Judul | Performance and Security Evaluation of Mitigating JWKS Endpoint Flooding on Microservices Gateway Using Redis-PostgreSQL Hybrid Caching |
| Bidang Penelitian | Keamanan API, Microservices Security, Performance Engineering |
| Target Publikasi | Sinta 2 (Jurnal RESTI/Telematika) atau Scopus Q3-Q4 |
| Peneliti | Helmi Bahar Alim |
| Stack Teknologi | Docker, PostgreSQL, Redis, Go Echo API Gateway, k6, Prometheus, Python Analysis Pipeline |
| Permasalahan | JWKS Endpoint Flooding melalui JWT dengan `kid` acak menyebabkan peningkatan lookup key ke backend sehingga terjadi resource exhaustion |
| Pendekatan Solusi | Redis sebagai L1 cache, PostgreSQL sebagai L2 storage, negative caching, dan rate limiting untuk membatasi penyalahgunaan lookup |
| Metode Evaluasi | Eksperimen terkontrol dengan perbandingan baseline (`CACHE_MODE=none`) dan mitigasi (`CACHE_MODE=hybrid`) |
| Output Penelitian | Source code, dataset eksperimen, analisis statistik, figure, dan draft artikel jurnal |

---

# 2. Latar Belakang Singkat

Dalam arsitektur microservices modern, API Gateway sering digunakan sebagai titik awal validasi autentikasi sebelum request diteruskan ke service internal.

Pada mekanisme JWT, gateway membutuhkan public key dari JWKS endpoint berdasarkan nilai `kid` pada header token. Implementasi yang tidak memiliki mekanisme caching dapat menyebabkan setiap permintaan dengan `kid` baru melakukan query berulang ke backend key storage.

Kondisi tersebut dapat dimanfaatkan oleh attacker melalui pola request dengan `kid` acak secara terus-menerus sehingga menyebabkan:

- peningkatan query database,
- penggunaan CPU backend meningkat,
- peningkatan latency,
- penurunan kualitas layanan pengguna legitimate.

Penelitian ini mengusulkan mekanisme **Redis-PostgreSQL Hybrid Caching** sebagai lapisan mitigasi untuk mengurangi ketergantungan gateway terhadap database ketika menghadapi pola serangan tersebut.

---

# 3. Tujuan Penelitian

Tujuan utama penelitian:

1. Merancang mekanisme caching hybrid pada API Gateway untuk mengurangi dampak JWKS Endpoint Flooding.
2. Mengukur pengaruh Redis caching terhadap jumlah query PostgreSQL.
3. Mengevaluasi perubahan performa gateway sebelum dan sesudah mitigasi.
4. Membandingkan efektivitas mitigasi pada beberapa pola traffic:
   - legitimate traffic,
   - attack dengan `kid` unik,
   - attack dengan `kid` berulang,
   - mixed traffic.
5. Mengidentifikasi trade-off dari pendekatan caching dan rate limiting yang digunakan.

---

# 4. Hipotesis Penelitian

## H1
Implementasi Redis-PostgreSQL Hybrid Caching dapat menurunkan jumlah query PostgreSQL dibandingkan sistem tanpa caching.

## H2
Hybrid caching mampu mempertahankan performa traffic legitimate ketika gateway mengalami serangan JWKS Endpoint Flooding.

## H3
Strategi serangan menggunakan `kid` unik dan `kid` dari pool kecil memberikan dampak berbeda terhadap efektivitas mitigasi.

## H4
Pendekatan rate limiting berbasis database memiliki potensi bottleneck ketika menghadapi request dengan variasi identifier yang sangat tinggi.

---

# 5. Metodologi Penelitian

Penelitian menggunakan metode eksperimen dengan beberapa tahapan:


---

# 6. Alur Kerja (Roadmap)

Setiap tahap penelitian memiliki dokumentasi terpisah agar proses implementasi dan evaluasi mudah dilacak.

| Status | Tahap | Dokumen | Keterangan |
|---|---|---|---|
| ✅ | Tahap 1 | [tahap-1-arsitektur-dan-skema-database.md](tahap-1-arsitektur-dan-skema-database.md) | Perancangan arsitektur sistem, database schema, cache strategy |
| ✅ | Tahap 2 | [tahap-2-implementasi-gateway.md](tahap-2-implementasi-gateway.md) | Implementasi API Gateway menggunakan Go Echo |
| ✅ | Tahap 3 | [tahap-3-pengujian-k6.md](tahap-3-pengujian-k6.md) | Load testing menggunakan k6 dengan berbagai skenario traffic |
| ✅ | Tahap 4 | [tahap-4-analisis-data.md](tahap-4-analisis-data.md) | Pengolahan dataset, statistik, dan visualisasi hasil |
| 🔄 | Tahap 5 | [tahap-5-draf-paper.md](tahap-5-draf-paper.md) | Penyusunan artikel jurnal berdasarkan hasil eksperimen |

---

# 7. Desain Eksperimen

## 7.1 Variabel Eksperimen

| Variabel | Nilai |
|---|---|
| Cache Mode | `none`, `hybrid` |
| Traffic Scenario | legitimate, attack-unique, attack-pool, mixed-unique, mixed-pool |
| Jumlah Replikasi | 40 kali setiap kombinasi |
| Total Eksperimen | 400 run |
| Token Authentication | JWT RSA-2048 |
| Cache Layer | Redis L1 + PostgreSQL L2 |
| Monitoring | Prometheus + Docker Stats |

---

## 7.2 Parameter Pengukuran

| Metric | Tujuan |
|---|---|
| Latency avg | Mengukur waktu respons rata-rata |
| Latency p95 | Mengukur pengalaman pengguna pada kondisi berat |
| Request per second | Mengukur throughput gateway |
| PostgreSQL query count | Mengukur efektivitas caching |
| CPU usage | Mengukur konsumsi resource |
| Memory usage | Mengukur overhead sistem |
| Cache hit ratio | Mengukur efektivitas Redis |

---

# 8. Struktur Artefak Penelitian
