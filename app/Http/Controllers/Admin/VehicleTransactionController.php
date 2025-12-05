<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Vehicle;
use App\Models\Product;
use App\Models\VehicleTransaction;
use App\Models\VehicleItem;
use App\Models\Supplier;

class VehicleTransactionController extends Controller
{
    /**
     * Menampilkan form input kendaraan keluar
     */
    public function create()
    {
        $vehicles = Vehicle::all();
        $products = Product::all();
        $suppliers = Supplier::all();
       return view('admin.transaction.vehicle.create', [
            'vehicles' => $vehicles,
            'products' => $products,
            'suppliers' => $suppliers,
            'title' => 'Input Kendaraan Keluar'
        ]);

    }

    /**
     * Menyimpan transaksi kendaraan keluar dan update stok barang
     */

    public function store(Request $request)
    {
        $validated = $request->validate([
            'driver_name' => 'required|string|max:100',
            'supplier' => 'required|string|max:255',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.quantity' => 'required|numeric|min:1',
            'items.*.purchase_price' => 'required|numeric|min:0',
            'items.*.subtotal' => 'required|numeric|min:0',
            'items.*.description' => 'nullable|string|max:255',
        ]);

        foreach ($validated['items'] as $item) {
            $product = Product::find($item['product_id']);

            VehicleItem::create([
                'supplier' => $validated['supplier'],
                'product_id' => $product->id,
                'category_id' => $product->category_id,
                'product_name' => $product->name,
                'quantity' => $item['quantity'],
                'purchase_price' => $item['purchase_price'],
                'subtotal' => $item['subtotal'],
                'description' => $item['description'] ?? null,
            ]);

            $product->increment('quantity', $item['quantity']);
        }

        return redirect()->back()->with('success', 'Data berhasil diupload dan quantity produk bertambah.');
    }
}
