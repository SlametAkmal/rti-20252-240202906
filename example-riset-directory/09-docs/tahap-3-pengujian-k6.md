# Tahap 3 — Skrip Pengujian k6 (Legitimate vs Attack Traffic)

**Status:** Selesai — matrix 400 run (40 replikasi) telah dijalankan  
**Dataset:** tersedia pada `04-data/`  
**Dataset awal:** 50 run / 5 replikasi diarsipkan pada `04-data/_archive-50run-20260612/`  
**Bergantung pada:** [tahap-2-implementasi-gateway.md](tahap-2-implementasi-gateway.md)  
**Lokasi kode:** [../05-kode/k6](../05-kode/k6)

---

# 1. Tujuan Tahap

Tahap ketiga penelitian bertujuan melakukan evaluasi performa dan efektivitas mitigasi terhadap JWKS Endpoint Flooding menggunakan load testing framework k6.

Tujuan pengujian:

1. Membandingkan performa gateway tanpa mitigasi (`CACHE_MODE=none`) dan dengan mitigasi (`CACHE_MODE=hybrid`).
2. Mengukur pengaruh serangan terhadap traffic legitimate.
3. Mengukur pengurangan beban PostgreSQL akibat mekanisme caching.
4. Mengevaluasi efektivitas:
   - positive cache,
   - negative cache,
   - rate limiting.
5. Menghasilkan dataset eksperimen untuk tahap analisis.

---

# 2. Desain Eksperimen

Eksperimen dilakukan dengan dua kondisi gateway:

| Mode | Deskripsi |
|---|---|
| `none` | Baseline tanpa cache dan rate limiting |
| `hybrid` | Redis cache + negative cache + PostgreSQL rate limiting |

---

# 3. Skenario Traffic

Terdapat tiga kelompok utama traffic:

## 3.1 Legitimate Traffic

Simulasi pengguna normal dengan:

- JWT valid.
- `kid` terdaftar.
- Request berhasil diverifikasi.

Tujuan:

Mengukur performa normal gateway.

---

## 3.2 Attack Traffic

Simulasi JWKS Endpoint Flooding.

Karakteristik:

- JWT menggunakan `kid` tidak dikenal.
- Request dikirim dengan intensitas tinggi.
- Memaksa gateway melakukan resolusi key.

Terdapat dua strategi:

### Unique Strategy

KID_STRATEGY=unique


Karakteristik:

- setiap request memiliki `kid` baru,
- menguji kemampuan rate limiting,
- sulit dilindungi negative cache.

---

### Pool Strategy


Karakteristik:

- menggunakan kumpulan ±50 `kid` invalid,
- menguji efektivitas negative cache,
- lebih mendekati pola serangan berulang.

---

## 3.3 Mixed Traffic

Gabungan:

Tujuan:

Mengukur apakah mitigasi tetap menjaga pengalaman pengguna normal ketika serangan berlangsung.

---

# 4. Struktur Kode k6

Lokasi:
05-kode/k6/

├── lib/
│ ├── config.js
│ ├── tokens.js
│ ├── legit-tokens.json
│ └── gen-legit-tokens.sh
│
├── legitimate.js
├── attack.js
├── mixed.js
│
├── monitor-resources.sh
├── run-scenario.sh
├── run-matrix.sh
└── README.md


---

# 5. Implementasi Script Pengujian

## 5.1 legitimate.js

Executor:

5 VU × 60 detik


Fungsi:

- mengirim request JWT valid,
- mengukur latency pengguna normal.

Environment:

```env
LEGIT_VUS
LEGIT_DURATION

5.2 attack.js

Executor:
ramping-vus

Konfigurasi:
0 → 200 VU

Durasi:
Ramp:
10 detik

Hold:
50 detik

Environment:

ATTACK_MAX_VUS
ATTACK_RAMP_DURATION
ATTACK_HOLD_DURATION
KID_STRATEGY

5.3 mixed.js

Menjalankan dua scenario secara bersamaan:
Scenario 1:
Legitimate traffic


Scenario 2:
Attack traffic

Menggunakan custom Trend:
legitimate_req_duration

attack_req_duration

6. Matriks Eksperimen

| Parameter       | Nilai                                                            |
| --------------- | ---------------------------------------------------------------- |
| Cache Mode      | none, hybrid                                                     |
| Traffic Variant | legitimate, attack-unique, attack-pool, mixed-unique, mixed-pool |
| Replikasi       | 40                                                               |
| Total Run       | 400                                                              |

7. Runner Eksperimen

Start Gateway
      |
      v
Health Check
      |
      v
Start Resource Monitor
      |
      v
Snapshot /metrics BEFORE
      |
      v
Run k6 Test
      |
      v
Snapshot /metrics AFTER
      |
      v
Simpan Metadata

8. Output Dataset

04-data/<run-id>/

├── k6-summary.json

├── gateway-metrics-before.txt

├── gateway-metrics-after.txt

├── resources.csv

└── meta.json

8.1 k6 Summary
Berisi:

request count,
latency,
throughput,
error rate.

8.2 Gateway Metrics
Digunakan untuk menghitung:

jumlah query database,
cache hit,
cache miss,
rate limit block.

8.3 Resource Monitoring

| Kolom     | Isi               |
| --------- | ----------------- |
| timestamp | waktu pengukuran  |
| container | nama container    |
| cpu_pct   | penggunaan CPU    |
| mem_usage | penggunaan memory |
| mem_pct   | persentase memory |

9. Optimasi Penyimpanan Data

Percobaan awal menggunakan:
--out json

Hasil:
139 MB
571.414 baris

10. Smoke Test

./run-scenario.sh hybrid legitimate smoke \
-e LEGIT_DURATION=15s \
-e LEGIT_VUS=2

Hasil:
| Parameter     | Nilai   |
| ------------- | ------- |
| Request       | 43.531  |
| Check success | 100%    |
| Avg latency   | ±463 µs |
| Output size   | <10 KB  |

11. Matrix Awal (50 Run)

Sebelum eksperimen final dilakukan:
2 mode
×
5 traffic
×
5 replikasi

=
50 run

12. Matrix Final (400 Run)

Untuk meningkatkan validitas statistik:
5 replikasi
        |
        v
40 replikasi

Total:
2 × 5 × 40

=

400 eksperimen

Eksekusi: 2026-06-15

Status:
| Parameter    | Hasil    |
| ------------ | -------- |
| Total run    | 400      |
| Failed run   | 0        |
| k6 exit code | 0        |
| Dataset      | tersedia |

13. Validasi Eksperimen

JWT Token
expired

14. Catatan Lingkungan

Pada Git Bash Windows diperlukan:
MSYS_NO_PATHCONV=1

15. Deliverable Tahap 3
| Komponen           | Status |
| ------------------ | ------ |
| legitimate.js      | ✅      |
| attack.js          | ✅      |
| mixed.js           | ✅      |
| Resource monitor   | ✅      |
| Runner script      | ✅      |
| Smoke test         | ✅      |
| Matrix 50 run      | ✅      |
| Matrix 400 run     | ✅      |
| Dataset eksperimen | ✅      |

