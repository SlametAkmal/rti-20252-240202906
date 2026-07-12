# Jadwal & Log Pelaksanaan Penelitian

Catatan kronologis pelaksanaan tiap tahap (sumber: riwayat commit git & dokumen `09-docs/tahap-N-*.md`). Tanggal mengikuti `git log`.

## Log Pelaksanaan

| Tanggal | Tahap | Aktivitas | Referensi |
|---|---|---|---|
| 2026-06-12 s.d. 2026-06-13 (commit 01:05) | Tahap 1 & 2 | Perancangan arsitektur/skema database; implementasi API Gateway Go (Echo) — clean architecture, migrasi Sqitch, seed script, docker-compose, verifikasi end-to-end (`CACHE_MODE=none`/`hybrid`, fail-closed/fail-open) | [09-docs/tahap-1-arsitektur-dan-skema-database.md](../09-docs/tahap-1-arsitektur-dan-skema-database.md), [09-docs/tahap-2-implementasi-gateway.md](../09-docs/tahap-2-implementasi-gateway.md) |
| 2026-06-13 01:05 | Tahap 3 | Implementasi skrip k6 (`legitimate.js`, `attack.js`, `mixed.js`), runner & monitor resource | [09-docs/tahap-3-pengujian-k6.md](../09-docs/tahap-3-pengujian-k6.md) |
| 2026-06-12 18:05–18:59 (≈54 menit) | Tahap 3 | Eksekusi matrix penuh 50 run (2 `CACHE_MODE` × 5 `traffic_variant` × 5 replikasi), seluruhnya `k6_exit_code = 0` | commit "Mark Tahap 3 complete after running full 50-run k6 matrix" (2026-06-13 02:00) |
| 2026-06-13 07:41 | Tahap 4 | Pipeline analisis Python (`run_all.py`), 6 tabel CSV + 5 figure PNG, dokumen Tahap 4 diperbarui ke status Selesai | [09-docs/tahap-4-analisis-data.md](../09-docs/tahap-4-analisis-data.md), [06-output/](../06-output/) |
| 2026-06-13 | Tahap 5 | Draf konten naskah (8 bagian) di `07-manuskrip/`; pelengkapan `01-proposal/`, `02-literatur/`, `03-teori/`, dan laporan penelitian `08-laporan/` | [09-docs/tahap-5-draf-paper.md](../09-docs/tahap-5-draf-paper.md), [08-laporan/laporan-penelitian.md](../08-laporan/laporan-penelitian.md) |
| 2026-06-13 | Tahap 5 | Verifikasi CVE-2026-48524 (terkonfirmasi via GHSA-fhv5-28vv-h8m8); pencarian 18 referensi literatur nyata & penyusunan bibliografi Mendeley; pelengkapan §2.4 *Related Work* di `03-tinjauan-pustaka.md` dan `07-daftar-pustaka.md`; penyusunan naskah konsolidasi `naskah-jurnal.md`/`.docx` | [02-literatur/matriks-literatur.md](../02-literatur/matriks-literatur.md), [02-literatur/daftar-pustaka.bib](../02-literatur/daftar-pustaka.bib), [07-manuskrip/naskah-jurnal.md](../07-manuskrip/naskah-jurnal.md) |
| 2026-06-15 | Tahap 3 & 4 | Perluasan replikasi dari 5 menjadi 40 per kombinasi: regenerasi token JWT legitimate (sebelumnya *expired*), flush cache Redis, eksekusi matrix penuh 400 run (2 `CACHE_MODE` × 5 `traffic_variant` × 40 replikasi) via `run-matrix.sh`, seluruhnya `k6_exit_code = 0` (selesai 2026-06-15T09:53:24Z); dataset 50-run lama diarsipkan ke `04-data/_archive-50run-20260612/`; pipeline analisis (`run_all.py`) dijalankan ulang atas dataset baru; seluruh statistik di `naskah-jurnal.md`/`.docx`, `00-outline.md`, dan dokumen `09-docs/`/`08-laporan/`/`01-proposal/` diperbarui ke n=40 | [09-docs/tahap-3-pengujian-k6.md](../09-docs/tahap-3-pengujian-k6.md), [09-docs/tahap-4-analisis-data.md](../09-docs/tahap-4-analisis-data.md), [04-data/matrix-40run.log](../04-data/matrix-40run.log) |

## Status Ringkas

- **Tahap 1 (Perumusan Topik & Rumusan Masalah):** Selesai — topik penelitian ditetapkan dan rumusan masalah disusun.
- **Tahap 2 (Pengumpulan Literatur):** Selesai — lima jurnal utama yang relevan berhasil dikumpulkan dan diseleksi.
- **Tahap 3 (Analisis Literatur):** Selesai — dilakukan perbandingan hasil penelitian, identifikasi persamaan, perbedaan, serta research gap.
- **Tahap 4 (Penyusunan Laporan):** Selesai — laporan penelitian, pembahasan, dan kesimpulan telah disusun.
- **Tahap 5 (Presentasi & Persiapan Sidang):** Selesai — slide presentasi dan daftar pertanyaan antisipasi telah disiapkan.

## Item Tindak Lanjut (Checklist Sebelum Submission)

- [v] Memastikan rumusan masalah sesuai dengan tujuan penelitian.
- [v] Memverifikasi seluruh referensi yang digunakan berasal dari jurnal ilmiah yang relevan.
- [v] Menyusun tabel perbandingan hasil penelitian dari setiap jurnal.
- [v] Menganalisis persamaan, perbedaan, dan research gap antar penelitian.
- [v] Menyusun kesimpulan berdasarkan hasil studi literatur.
- [v] Melakukan pengecekan akhir terhadap format penulisan dan sitasi.
- [v] Memastikan seluruh daftar pustaka sesuai dengan standar penulisan yang digunakan.
- [v] Menyiapkan berkas laporan dan slide presentasi untuk dikumpulkan.


## Korespondensi

- 2026-06-10 : Konsultasi penentuan topik penelitian.
- 2026-06-13 : Diskusi mengenai pemilihan jurnal yang digunakan sebagai referensi.
- 2026-06-16 : Konsultasi hasil analisis literatur dan penyusunan pembahasan.
- 2026-06-19 : Review laporan akhir dan persiapan presentasi.
