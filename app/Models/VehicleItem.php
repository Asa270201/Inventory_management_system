<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VehicleItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'vehicle_transaction_id',
        'supplier',
        'product_id',
        'category_id',
        'product_name',
        'quantity',
        'purchase_price',
        'subtotal',
        'description',
    ];

    public function transaction()
    {
        return $this->belongsTo(VehicleTransaction::class, 'vehicle_transaction_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

}
