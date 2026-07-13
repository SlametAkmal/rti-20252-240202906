# Tahap 4 — Ekstraksi Data & Visualisasi

**Status:** Selesai — pipeline analisis berhasil dijalankan pada matrix 400 run (40 replikasi)  
**Dataset input:** `04-data/`  
**Output:** `06-output/`  
**Bergantung pada:** [tahap-3-pengujian-k6.md](tahap-3-pengujian-k6.md)  
**Lokasi kode:** [../05-kode/analysis](../05-kode/analysis)

---

# 1. Tujuan Tahap

Tahap keempat penelitian bertujuan mengolah seluruh hasil eksperimen dari tahap pengujian menjadi data statistik dan visualisasi yang dapat digunakan untuk evaluasi efektivitas mitigasi.

Tujuan analisis:

1. Menggabungkan seluruh output eksperimen k6.
2. Menghitung statistik performa gateway.
3. Mengukur dampak mitigasi terhadap traffic legitimate.
4. Menghitung pengurangan beban PostgreSQL.
5. Mengevaluasi penggunaan resource container.
6. Menghasilkan tabel dan figure untuk kebutuhan publikasi jurnal.

---

# 2. Input Data Analisis

Pipeline menerima tiga jenis data utama:

| Data | Sumber | Fungsi |
|---|---|---|
| k6 summary | `k6-summary.json` | latency, request rate, error |
| Gateway metrics | `gateway-metrics-before/after.txt` | cache, database, rate-limit |
| Resource monitoring | `resources.csv` | CPU dan memory container |

Struktur data:

04-data/

├── <run-id>/
│
├── k6-summary.json
├── gateway-metrics-before.txt
├── gateway-metrics-after.txt
├── resources.csv
└── meta.json


---

# 3. Struktur Pipeline Analisis

Lokasi:

05-kode/analysis/

├── requirements.txt
│
├── common.py
├── load_runs.py
├── descriptive_stats.py
├── compute_dperf.py
├── resource_stats.py
├── gateway_metrics.py
├── charts.py
└── run_all.py


---

# 4. Implementasi Modul Analisis

## 4.1 load_runs.py

Fungsi:

- membaca seluruh folder eksperimen,
- memvalidasi metadata,
- membuat dataframe terstruktur.

Output internal:

```python
DataFrame tidy

Fungsi utama:
build_run_summary()

build_resource_summary()

build_gateway_metrics()

4.2 descriptive_stats.py

Output:
descriptive_stats.csv

descriptive_stats_mixed_scenarios.csv

5. Orkestrasi Pipeline

Load Dataset
      |
      v
Build DataFrame
      |
      v
Statistik Deskriptif
      |
      v
Hitung D_perf
      |
      v
Analisis Resource
      |
      v
Analisis Gateway Metric
      |
      v
Generate Figure

6. Validasi Dataset

Validasi:
| Pemeriksaan               | Status |
| ------------------------- | ------ |
| Folder eksperimen terbaca | ✓      |
| meta.json valid           | ✓      |
| k6 exit code berhasil     | ✓      |
| File metrics tersedia     | ✓      |
| Resource CSV tersedia     | ✓      |

7. Output Analisis

06-output/

├── tables/
│
│── descriptive_stats.csv
│── dperf.csv
│── resource_usage.csv
│── mitigation_effectiveness.csv
│── db_query_reduction.csv
│
└── figures/
    ├── fig_latency_p95.png
    ├── fig_dperf.png
    ├── fig_db_queries_reduction.png
    ├── fig_postgres_cpu.png
    └── fig_resource_timeseries.png

8. Hasil Analisis

| Traffic      | Metric    | None (ms) | Hybrid (ms) | D_perf |
| ------------ | --------- | --------: | ----------: | -----: |
| legitimate   | avg       |    0.6905 |      0.6301 |  -8.8% |
| legitimate   | p95       |    1.0384 |      1.0063 |  -3.1% |
| mixed-unique | legit avg |   10.4183 |      0.7721 | -92.6% |
| mixed-unique | legit p95 |   19.4384 |      1.3839 | -92.9% |
| mixed-pool   | legit avg |   10.7468 |      5.7595 | -46.4% |
| mixed-pool   | legit p95 |   20.5135 |     12.4138 | -39.5% |

9. Reduksi Query PostgreSQL

| Scenario      |     None |  Hybrid | Reduction |
| ------------- | -------: | ------: | --------: |
| legitimate    | 300114.7 |    10.0 |   99.997% |
| attack-unique | 907845.5 | 61894.1 |   93.182% |
| attack-pool   | 879271.7 |    73.1 |   99.992% |
| mixed-unique  | 880678.3 | 57957.1 |   93.419% |
| mixed-pool    | 849226.3 |    74.6 |   99.991% |

10. Analisis CPU PostgreSQL

| Scenario      |   None | Hybrid |
| ------------- | -----: | -----: |
| legitimate    |  64.1% |   2.2% |
| attack-unique | 158.3% | 124.4% |
| attack-pool   | 153.9% |   2.2% |
| mixed-unique  | 152.5% | 103.0% |
| mixed-pool    | 149.9% |   2.2% |

11. Temuan Trade-off

attack-pool

Karakteristik:

kid berasal dari pool kecil.
Negative cache sangat efektif.

Hasil:

query turun hingga 99.99%.
CPU PostgreSQL turun drastis.
attack-unique

Karakteristik:

setiap request membawa kid baru.
negative cache kurang efektif.

12. Visualisasi

| File                         | Isi                          |
| ---------------------------- | ---------------------------- |
| fig_latency_p95.png          | Perbandingan latency p95     |
| fig_dperf.png                | Dampak performa mitigasi     |
| fig_db_queries_reduction.png | Reduksi query database       |
| fig_postgres_cpu.png         | CPU PostgreSQL               |
| fig_resource_timeseries.png  | Trend resource selama attack |

13. Deliverable Tahap 4

| Komponen                | Status |
| ----------------------- | ------ |
| Data loader             | ✅      |
| Statistik deskriptif    | ✅      |
| Perhitungan D_perf      | ✅      |
| Analisis resource       | ✅      |
| Analisis gateway metric | ✅      |
| Tabel hasil             | ✅      |
| Figure penelitian       | ✅      |
| Pipeline otomatis       | ✅      |

14. Kesimpulan Tahap

Tahap 4 berhasil mengubah dataset eksperimen 400 run menjadi hasil statistik dan visualisasi penelitian.

Hasil analisis menunjukkan bahwa Redis-PostgreSQL Hybrid Caching:

mengurangi query PostgreSQL hingga 93–99.997%,
menjaga performa pengguna legitimate saat serangan,
mengurangi penggunaan resource database pada mayoritas skenario.

Namun ditemukan keterbatasan pada serangan dengan kid unik yang menyebabkan rate-limit PostgreSQL menjadi bottleneck.