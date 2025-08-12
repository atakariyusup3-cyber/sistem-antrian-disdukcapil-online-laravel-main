<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Layanan;
use App\Models\Antrian;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Buat user admin
        $admin = User::create([
            'name'      => 'Admin',
            'email'     => 'admin@gmail.com',
            'password'  => bcrypt('1234'),
            'roles'     => 'admin'
        ]);

        // 2. Buat layanan
        $layananKTP = Layanan::create([
            'nama_layanan' => 'Layanan E-KTP',
            'kode'         => 'KTP',
            'deskripsi'    => 'Pelayanan dan pengurusan E-KTP',
            'user_id'      => $admin->id
        ]);

        $layananKK = Layanan::create([
            'nama_layanan' => 'Layanan Kartu Keluarga',
            'kode'         => 'KK',
            'deskripsi'    => 'Pelayanan dan pengurusan Kartu Keluarga (KK)',
            'user_id'      => $admin->id
        ]);

        $layananAkta = Layanan::create([
            'nama_layanan' => 'Layanan Akta Kelahiran',
            'kode'         => 'AKKEL',
            'deskripsi'    => 'Pelayanan dan pengurusan Akta Kelahiran',
            'user_id'      => $admin->id
        ]);

        $layananPindah = Layanan::create([
            'nama_layanan' => 'Layanan Surat Pindah',
            'kode'         => 'SP',
            'deskripsi'    => 'Pelayanan dan pengurusan Surat Pindah',
            'user_id'      => $admin->id
        ]);

        // 3. Buat antrian
        Antrian::create([
            'nama_layanan' => 'Layanan E-KTP',
            'kode'         => 'KTP',
            'slug'         => 'layanan-e-ktp',
            'batas_antrian'=> 20,
            'deskripsi'    => 'Ambil antrian untuk mengurus perekaman E-KTP',
            'persyaratan'  => 'Fotocopy KK, KTP-el asli lama, Surat kehilangan dari kepolisian', 
            'user_id'      => $admin->id,
        ]);

        Antrian::create([
            'nama_layanan' => 'Layanan Kartu Keluarga',
            'kode'         => 'KK',
            'slug'         => 'layanan-kartu-keluarga',
            'batas_antrian'=> 20,
            'deskripsi'    => 'Ambil antrian untuk mengurus Kartu Keluarga',
            'persyaratan'  => 'Fotocopy KK', 
            'user_id'      => $admin->id,
        ]);

        Antrian::create([
            'nama_layanan' => 'Layanan Akta Kelahiran',
            'kode'         => 'AKKEL',
            'slug'         => 'layanan-akta-kelahiran',
            'batas_antrian'=> 20,
            'deskripsi'    => 'Ambil antrian untuk mengurus Akta Kelahiran',
            'persyaratan'  => 'Fotocopy KK', 
            'user_id'      => $admin->id,
        ]);

        Antrian::create([
            'nama_layanan' => 'Layanan Surat Pindah',
            'kode'         => 'SP',
            'slug'         => 'layanan-surat-pindah',
            'batas_antrian'=> 20,
            'deskripsi'    => 'Ambil antrian untuk mengurus Surat Pindah',
            'persyaratan'  => 'Fotocopy KK', 
            'user_id'      => $admin->id,
        ]);
    }
}
