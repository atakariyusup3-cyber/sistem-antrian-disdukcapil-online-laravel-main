<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Antrian extends Model
{
    use HasFactory;

    // Nama tabel
    protected $table = 'antrians';

    // Kolom yang bisa diisi massal
    protected $fillable = [
        'layanan_id',
        'nomor_antrian',
        'status'
    ];

    /**
     * Relasi ke model Layanan
     */
    public function layanan()
    {
        return $this->belongsTo(Layanan::class);
    }

    /**
     * Relasi ke model Ambilantrian
     */
    public function ambilantrians()
    {
        return $this->hasMany(Ambilantrian::class);
    }
}
