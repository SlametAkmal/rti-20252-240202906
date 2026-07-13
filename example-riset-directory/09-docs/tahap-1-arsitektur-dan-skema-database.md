# Tahap 1 — Perancangan Arsitektur & Skema Database

**Status:** Selesai

---

# 1. Tujuan Tahap

Tahap pertama penelitian berfokus pada perancangan arsitektur sistem dan database yang akan digunakan untuk mengevaluasi mitigasi **JWKS Endpoint Flooding** pada API Gateway berbasis microservices.

Tujuan utama tahap ini:

1. Merancang arsitektur gateway dengan mekanisme caching berlapis.
2. Menentukan strategi penyimpanan JWKS menggunakan Redis dan PostgreSQL.
3. Mendesain mekanisme negative caching untuk mencegah lookup berulang terhadap `kid` tidak valid.
4. Mendesain mekanisme rate limiting untuk membatasi request abnormal.
5. Menyiapkan skema eksperimen baseline (`CACHE_MODE=none`) dan mitigasi (`CACHE_MODE=hybrid`).

---

# 2. Desain Arsitektur Sistem

Arsitektur penelitian terdiri dari tiga komponen utama:

             Client
               |
               |
               v
    +---------------------+
    |    API Gateway      |
    |      Go Echo        |
    +---------------------+
          |          |
          |          |
          v          v
    +---------+   +-------------+
    | Redis   |   | PostgreSQL  |
    | L1 Cache|   | L2 Storage  |
    +---------+   +-------------+
                     |
                     |
                Signing Keys
          Rate Limit Counter


---

# 3. Komponen Sistem

## 3.1 API Gateway (Go Echo)

API Gateway merupakan komponen utama yang menerima request dari client.

Tanggung jawab gateway:

- menerima request HTTP,
- membaca header JWT,
- mengambil nilai `kid`,
- melakukan resolusi JWK,
- melakukan verifikasi signature JWT,
- meneruskan request valid ke service tujuan.

Framework yang digunakan:

- Bahasa: Go
- Framework HTTP: Echo
- JWT Library: golang-jwt/jwt/v5

---

## 3.2 Redis (L1 Cache JWKS)

Redis digunakan sebagai cache layer pertama untuk mempercepat proses resolusi key.

Redis hanya menyimpan data cache JWKS dan tidak menyimpan state rate limiting.

### Positive Cache

Format key:


Fungsi:

- menyimpan public key valid,
- mengurangi query PostgreSQL,
- mempercepat verifikasi JWT.

TTL:


---

### Negative Cache

Format key:


Fungsi:

- menyimpan informasi bahwa `kid` tidak ditemukan,
- mencegah attacker melakukan lookup database berulang,
- menjadi mekanisme utama mitigasi flooding.

TTL:


---

## 3.3 PostgreSQL (L2 Storage)

PostgreSQL digunakan sebagai:

1. Source of truth untuk signing key.
2. Penyimpanan rate-limit counter.

Komponen database:

- tabel `signing_keys`
- tabel `rate_limit_counters`

---

# 4. Alur Resolusi Kunci JWT


---

# 5. Mode Eksperimen

Penelitian menggunakan satu implementasi gateway dengan dua mode operasi.

## 5.1 Baseline Mode

Konfigurasi:

Karakteristik:

- tanpa Redis cache,
- tanpa negative cache,
- tanpa rate limiting,
- setiap request melakukan query PostgreSQL.

Tujuan:

Sebagai pembanding sistem sebelum mitigasi.

---

## 5.2 Hybrid Mode

Konfigurasi:


Karakteristik:

- Redis positive cache aktif,
- Redis negative cache aktif,
- PostgreSQL rate limiting aktif,
- PostgreSQL menjadi source of truth.

Tujuan:

Mengukur efektivitas mitigasi terhadap flooding.

---

# 6. Skema Database PostgreSQL

## 6.1 Tabel Signing Keys

```sql
CREATE TABLE signing_keys (
    kid             VARCHAR(255) PRIMARY KEY,
    kty             VARCHAR(10) NOT NULL DEFAULT 'RSA',
    alg             VARCHAR(10) NOT NULL DEFAULT 'RS256',
    use_type        VARCHAR(10) NOT NULL DEFAULT 'sig',
    n               TEXT NOT NULL,
    e               TEXT NOT NULL,
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    expires_at      TIMESTAMPTZ,
    revoked_at      TIMESTAMPTZ
);

CREATE INDEX idx_signing_keys_active
ON signing_keys (kid)
WHERE is_active = TRUE;

Tabel rate limit counter

CREATE TABLE rate_limit_counters (
    client_ip       INET NOT NULL,
    window_start    TIMESTAMPTZ NOT NULL,
    request_count   INTEGER NOT NULL DEFAULT 0,
    blocked_count   INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY(client_ip, window_start)
);

Mekanisme Atomic Rate Limiting

INSERT INTO rate_limit_counters
(
 client_ip,
 window_start,
 request_count
)
VALUES
(
 $1,
 $2,
 1
)

ON CONFLICT(client_ip, window_start)

DO UPDATE SET
request_count =
rate_limit_counters.request_count + 1

RETURNING request_count;

***STRUKTUR REDIS KEY***

| Key Pattern           | Type        | TTL       | Fungsi                 |
| --------------------- | ----------- | --------- | ---------------------- |
| `jwks:kid:<kid>`      | String JSON | 300 detik | Cache public key valid |
| `jwks:negative:<kid>` | String      | 60 detik  | Cache key tidak valid  |

KEPUTUSAN DESAIN

| No | Keputusan                                          | Alasan                                              |
| -- | -------------------------------------------------- | --------------------------------------------------- |
| 1  | Gateway menggunakan satu binary dengan toggle mode | Memastikan eksperimen baseline dan mitigasi identik |
| 2  | Redis hanya digunakan sebagai cache JWKS           | Menghindari Redis menjadi sumber state utama        |
| 3  | PostgreSQL menjadi source of truth                 | Menjamin konsistensi data key                       |
| 4  | Rate limiting menggunakan PostgreSQL UPSERT        | Mendukung atomic counter                            |
| 5  | Framework menggunakan Echo                         | Ringan dan sesuai ekosistem Go                      |
| 6  | Driver database menggunakan pgx                    | Performa tinggi dan mendukung connection pooling    |
| 7  | Redis client menggunakan go-redis/v9               | Library standar Go Redis                            |
| 8  | Single issuer digunakan                            | Menyederhanakan eksperimen awal                     |

MEKANISME FAIL HANDLING

Redis gagal
      |
      v
Fallback PostgreSQL
      |
      v
Request tetap diproses
PostgreSQL gagal
      |
      v
Request ditolak
      |
      v
HTTP 503 Service Unavailable


OUTPUT TAHAP 1

| Output                        | Status  |
| ----------------------------- | ------- |
| Arsitektur sistem             | Selesai |
| Diagram alur resolusi JWT     | Selesai |
| Database schema               | Selesai |
| Redis key design              | Selesai |
| Eksperimen baseline vs hybrid | Selesai |
| Keputusan teknologi           | Selesai |

KESIMPULAN TAHAP


Dengan format ini, `tahap-1` sudah konsisten dengan:
- `08-laporan`
- `09-docs/rencana-penelitian`
- struktur paper jurnal (metodologi).
