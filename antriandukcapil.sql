-- Buat database
CREATE DATABASE IF NOT EXISTS antriandukcapil;
USE antriandukcapil;
SELECT * FROM antrians;

-- Tabel users
CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    email_verified_at TIMESTAMP NULL DEFAULT NULL,
    password VARCHAR(255) NOT NULL,
    roles ENUM('masyarakat', 'admin') DEFAULT 'masyarakat',
    remember_token VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- Tabel password_reset_tokens
CREATE TABLE password_reset_tokens (
    email VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL
);

-- Tabel failed_jobs
CREATE TABLE failed_jobs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    uuid VARCHAR(255) NOT NULL,
    connection TEXT NOT NULL,
    queue TEXT NOT NULL,
    payload LONGTEXT NOT NULL,
    exception LONGTEXT NOT NULL,
    failed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabel personal_access_tokens
CREATE TABLE personal_access_tokens (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tokenable_type VARCHAR(255) NOT NULL,
    tokenable_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    token VARCHAR(64) UNIQUE NOT NULL,
    abilities TEXT DEFAULT NULL,
    last_used_at TIMESTAMP NULL DEFAULT NULL,
    expires_at TIMESTAMP NULL DEFAULT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- Tabel layanans
CREATE TABLE layanans (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(255) NOT NULL,
    kode VARCHAR(255) NOT NULL,
    deskripsi TEXT DEFAULT NULL,
    slug VARCHAR(255) DEFAULT NULL,
    persyaratan TEXT DEFAULT NULL,
    batas_antrian INT DEFAULT 0,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

-- Tabel antrians
CREATE TABLE antrians (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    layanan_id BIGINT UNSIGNED NOT NULL,
    nomor_antrian INT NOT NULL,
    status ENUM('menunggu', 'dipanggil', 'selesai') DEFAULT 'menunggu',
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (layanan_id) REFERENCES layanans(id) ON DELETE CASCADE
);

-- Tabel ambilantrians
CREATE TABLE ambilantrians (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(255) NOT NULL,
    nama_lengkap VARCHAR(255) NOT NULL,
    alamat TEXT DEFAULT NULL,
    nomorhp VARCHAR(50) DEFAULT NULL,
    layanan_id BIGINT UNSIGNED NOT NULL,
    nomor_antrian INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (layanan_id) REFERENCES layanans(id) ON DELETE CASCADE
);

-- Insert akun admin default
INSERT INTO users (name, email, password, roles, created_at, updated_at) VALUES
('Admin', 'admin@gmail.com', '$2y$10$e0NRzkRgZNpmjDoE7YQDpeCjTiMQuuLHfoalGoVYLRNvKcJsteVE6', 'admin', NOW(), NOW());
-- Password: password

-- Contoh layanan awal
INSERT INTO layanans (nama_layanan, kode, deskripsi, slug, persyaratan, batas_antrian, created_at, updated_at) VALUES
('Pembuatan KTP', 'KTP001', 'Layanan pembuatan KTP baru', 'pembuatan-ktp', 'Fotokopi KK, Surat Pengantar RT/RW', 50, NOW(), NOW()),
('Perubahan Data KK', 'KK002', 'Layanan perubahan data pada KK', 'perubahan-data-kk', 'Fotokopi KK lama, Surat Pengantar RT/RW', 50, NOW(), NOW());

