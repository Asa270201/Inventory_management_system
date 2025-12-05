<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VehicleTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'vehicle_number',
        'driver_name',
        'destination',
    ];

    public function items()
    {
        return $this->hasMany(VehicleItem::class);
    }
}
