<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $fromDate = $request->from;
        $toDate = $request->to;

        // Ambil data transaksi
        $items = DB::table('transaction_details')
            ->join('products', 'transaction_details.product_id', '=', 'products.id')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->select(
                'products.name as product_name',
                'categories.name as category_name',
                DB::raw('SUM(transaction_details.quantity) as total_quantity'),
                DB::raw('SUM(transaction_details.quantity * products.purchase_price) as total_modal'),
                DB::raw('SUM(transaction_details.quantity * products.selling_price) as total_income'),
                DB::raw('SUM((products.selling_price - products.purchase_price) * transaction_details.quantity) as total_profit'),
                DB::raw('ROUND(SUM((products.selling_price - products.purchase_price) * transaction_details.quantity) / NULLIF(SUM(transaction_details.quantity * products.purchase_price), 0) * 100, 2) as margin_percent')
            )
            ->whereBetween('transaction_details.created_at', [$fromDate, $toDate])
            ->whereNotNull('products.selling_price')
            ->whereNotNull('products.purchase_price')
            ->groupBy('products.id', 'products.name', 'categories.name')
            ->get();

        // Total keseluruhan
        $totalIncome = $items->sum('total_income');
        $totalModal = $items->sum('total_modal');
        $totalProfit = $items->sum('total_profit');
        $totalQuantity = $items->sum('total_quantity');
        $averageMargin = $totalModal > 0 ? round(($totalProfit / $totalModal) * 100, 2) : 0;

        // Ambil total pengeluaran dari tabel expenses
        $totalPengeluaran = DB::table('expenses')
            ->whereBetween('tanggal', [$fromDate, $toDate])
            ->sum('jumlah');

        // Hitung laba bersih
        $labaBersih = $totalProfit - $totalPengeluaran;

        return view('admin.report.index', compact(
            'items',
            'fromDate',
            'toDate',
            'totalIncome',
            'totalModal',
            'totalProfit',
            'totalQuantity',
            'averageMargin',
            'totalPengeluaran',
            'labaBersih'
        ));
    }
}
