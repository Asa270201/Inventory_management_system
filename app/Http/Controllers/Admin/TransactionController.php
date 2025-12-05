<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Product;
use App\Models\Rent;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Models\TransactionDetail;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Vehicle;
use App\Models\VehicleTransaction;
use App\Models\VehicleItem;

class TransactionController extends Controller
{
    public function product()
    {
        $transactions = Transaction::with('details.product')->latest()->paginate(10);

        $grandQuantity = TransactionDetail::sum('quantity');

        return view('admin.transaction.product', compact('transactions', 'grandQuantity'));
    }

    public function vehicle(Request $request)
    {
        // Data kendaraan keluar (jika masih digunakan)
        $rents = Rent::with(['user', 'vehicle'])->paginate(10);

        // Data barang keluar dari vehicle_items
        $vehicleItems = VehicleItem::with('product.category')
            ->when($request->q, fn($query, $q) => $query->where('product_name', 'like', "%{$q}%"))
            ->paginate(10);

        return view('admin.transaction.vehicle', [
            'rents' => $rents,
            'vehicleItems' => $vehicleItems,
            'title' => 'Daftar Kendaraan Keluar'
        ]);
    }

    public function createVehicle()
{
    // Ambil data kategori barang jika perlu
    $categories = Category::all();
        $vehicles = Vehicle::all();

        return view('admin.transaction.vehicle.create', [
            'categories' => $categories,
            'vehicles' => $vehicles,
            'title' => 'Input Kendaraan Keluar'
        ]);
}

public function storeVehicle(Request $request)
{
    // Validasi input
    $validated = $request->validate([
        'vehicle_number' => 'required|string',
        'driver_name' => 'required|string',
        'destination' => 'required|string',
        'items.*.category_id' => 'required|exists:categories,id',
        'items.*.quantity' => 'required|integer|min:1',
        'items.*.description' => 'nullable|string',
    ]);

    // Simpan transaksi kendaraan
    $transaction = VehicleTransaction::create([
        'vehicle_number' => $validated['vehicle_number'],
        'driver_name' => $validated['driver_name'],
        'destination' => $validated['destination'],
    ]);

    // Simpan barang-barang yang dibawa
    foreach ($validated['items'] as $item) {
        $transaction->items()->create($item);
    }

    return redirect()->route('transaction.vehicle.index')->with('success', 'Data kendaraan berhasil disimpan.');
}

public function createManual()
{
    $users = User::all();
    $products = Product::all();

    return view('admin.transaction.manual_transaction', [
        'users' => $users,
        'products' => $products,
        'title' => 'Transaksi Manual'
    ]);
}

public function storeManual(Request $request)
{
    $request->validate([
        'customer_id' => 'required|exists:users,id',
        'products.*' => 'required|exists:products,id',
        'quantities.*' => 'required|integer|min:1',
    ]);

    DB::transaction(function () use ($request) {
        // Simpan transaksi utama
        $transaction = Transaction::create([
            'user_id' => $request->customer_id,
            'invoice' => 'INV-' . strtoupper(Str::random(8)),
            'created_at' => now(),
            'updated_at' => now()
        ]);

        // Simpan detail dan kurangi stok
        foreach ($request->products as $index => $productId) {
            $product = Product::findOrFail($productId);
            $quantity = $request->quantities[$index];
            $totalPrice = $product->selling_price * $quantity;

            // Simpan detail transaksi
            TransactionDetail::create([
                'transaction_id' => $transaction->id,
                'product_id' => $productId,
                'quantity' => $quantity,
                'total_price' => $totalPrice,
                'created_at' => now(),
                'updated_at' => now()
            ]);

            // Kurangi stok produk
            $product->decrement('quantity', $quantity);
        }
    });

    return redirect()->route('admin.manual.transaction')->with('success', 'Transaksi berhasil disimpan.');
}

}