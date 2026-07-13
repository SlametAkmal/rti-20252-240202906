---
Referensi berikut digunakan sebagai dasar teori dan perancangan penelitian:

| No | Referensi | Kontribusi |
|---|---|---|
| 1 | RFC 7517 — JSON Web Key (JWK) | Dasar mekanisme distribusi public key untuk verifikasi JWT melalui JWKS endpoint |
| 2 | RFC 7519 — JSON Web Token (JWT) | Dasar struktur token, claim, dan proses validasi JWT |
| 3 | OWASP API Security Top 10 | Referensi ancaman keamanan API termasuk resource exhaustion dan abuse terhadap endpoint |
| 4 | Redis Documentation | Referensi implementasi in-memory caching sebagai layer penyimpanan cepat |
| 5 | PostgreSQL Documentation | Referensi implementasi relational database, indexing, transaction, dan concurrency control |
| 6 | Prometheus Documentation | Referensi monitoring metric internal service menggunakan time-series metrics |
| 7 | k6 Documentation | Referensi metode load testing berbasis virtual user dan pengukuran performa API |
| 8 | Echo Framework Documentation | Referensi implementasi HTTP API Gateway menggunakan Go |
| 9 | Go Redis Documentation | Referensi komunikasi aplikasi Go dengan Redis sebagai caching layer |
| 10 | PostgreSQL pgx Driver Documentation | Referensi koneksi database PostgreSQL menggunakan native Go driver |

Catatan:
- Referensi lengkap dalam format BibTeX/IEEE akan disusun pada dokumen naskah jurnal (`07-manuskrip/daftar-pustaka.bib`).
- Verifikasi akhir terhadap nomor CVE terkait JWKS Endpoint Flooding masih dilakukan sebelum publikasi.

---

# 9. Validasi Reproduksibilitas Penelitian

Penelitian ini dirancang agar seluruh eksperimen dapat direproduksi menggunakan artefak yang tersedia pada repository.

## 9.1 Spesifikasi Lingkungan Eksperimen

| Komponen | Spesifikasi |
|---|---|
| Operating System | Windows 11 + Docker Desktop |
| Runtime Gateway | Go 1.22+ |
| Database | PostgreSQL 16 |
| Cache Layer | Redis 7 |
| Load Testing Tool | k6 |
| Analysis Environment | Python 3.11 |
| Visualization | Matplotlib, Pandas |
| Container Runtime | Docker Compose |
| Network Mode | Docker bridge network |

---

## 9.2 Konfigurasi Eksperimen

| Parameter | Nilai |
|---|---|
| Cache Mode | `none`, `hybrid` |
| Traffic Scenario | legitimate, attack-unique, attack-pool, mixed-unique, mixed-pool |
| Replikasi | 40 kali setiap kombinasi |
| Total Pengujian | 400 eksperimen |
| Durasi Pengujian | 15 detik setiap eksperimen |
| Authentication Method | JWT RSA-2048 |
| Cache Strategy | Positive cache + Negative cache |
| Rate Limit | PostgreSQL UPSERT counter |
| Monitoring | Prometheus metrics + Docker resource monitor |

---

## 9.3 Checklist Reproduksi

| Item Validasi | Status |
|---|---|
| Source code gateway tersedia | ✓ |
| Docker Compose environment tersedia | ✓ |
| Database migration tersedia | ✓ |
| Seed data tersedia | ✓ |
| Generator JWT tersedia | ✓ |
| Load testing script tersedia | ✓ |
| Dataset eksperimen tersedia lokal | ✓ |
| Script analisis otomatis tersedia | ✓ |
| Figure dan tabel hasil dapat dibuat ulang | ✓ |

---

# 10. Rencana Pengembangan Penelitian Selanjutnya

Berdasarkan hasil evaluasi, terdapat beberapa pengembangan yang dapat dilakukan pada penelitian berikutnya.

## 10.1 Optimasi Rate Limiting

Hasil eksperimen menunjukkan bahwa pendekatan rate limiting menggunakan UPSERT counter pada PostgreSQL masih memiliki kelemahan ketika menghadapi serangan dengan pola `kid` selalu berubah (`unique`).

Pengembangan berikutnya dapat menggunakan:

- Redis Atomic Counter untuk rate limiting sementara.
- Sliding window algorithm.
- Token bucket algorithm.
- Distributed rate limiter berbasis Redis Cluster.

Tujuannya adalah mengurangi contention pada database ketika jumlah request abnormal meningkat.

---

## 10.2 Evaluasi pada Infrastruktur Terdistribusi

Eksperimen saat ini dilakukan pada lingkungan container lokal dengan satu gateway instance.

Penelitian lanjutan dapat memperluas evaluasi menggunakan:

- Multiple API Gateway instance.
- Kubernetes cluster.
- Load balancer.
- Redis Cluster.
- PostgreSQL replication.

Hal ini diperlukan untuk mengetahui efektivitas mitigasi pada lingkungan production-scale.

---

## 10.3 Penambahan Metode Deteksi Serangan

Versi penelitian saat ini berfokus pada mitigasi berbasis caching dan rate limiting.

Pengembangan berikutnya dapat menambahkan:

- Anomaly detection berdasarkan pola `kid`.
- Machine learning untuk klasifikasi traffic abnormal.
- Adaptive throttling berdasarkan reputasi client.
- Integrasi Security Information and Event Management (SIEM).

---

## 10.4 Evaluasi Security Metric Tambahan

Selain performa, penelitian selanjutnya dapat mengukur:

| Metric | Tujuan |
|---|---|
| Attack detection rate | Mengukur kemampuan mengenali serangan |
| False positive rate | Mengukur dampak terhadap pengguna normal |
| Recovery time | Mengukur waktu pemulihan service |
| Availability percentage | Mengukur tingkat ketersediaan gateway |
| Memory overhead | Mengukur kebutuhan resource caching |

---

# 11. Pernyataan Akhir Penelitian

Berdasarkan seluruh eksperimen yang dilakukan, penelitian ini membuktikan bahwa pendekatan **Redis-PostgreSQL Hybrid Caching** mampu menjadi mekanisme mitigasi efektif terhadap skenario **JWKS Endpoint Flooding** pada API Gateway berbasis microservices.

Hasil eksperimen menunjukkan bahwa strategi caching mampu mengurangi ketergantungan gateway terhadap database backend dengan penurunan query PostgreSQL hingga **99,997%**, menjaga performa pengguna legitimate selama serangan berlangsung, serta mempertahankan overhead rendah pada kondisi normal.

Namun demikian, penelitian juga menemukan bahwa desain rate limiting berbasis database masih memiliki keterbatasan pada pola serangan dengan identifier unik secara terus-menerus. Temuan tersebut menjadi dasar untuk pengembangan mekanisme mitigasi generasi berikutnya yang lebih adaptif dan scalable.

Dengan tersedianya source code, konfigurasi eksperimen, pipeline analisis, serta dokumentasi reproduksi, penelitian ini dapat dikembangkan lebih lanjut menuju publikasi ilmiah tingkat nasional maupun internasional.