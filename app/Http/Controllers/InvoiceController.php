<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;
use App\Models\TransactionDetail;

class InvoiceController extends Controller
{
    public function print($id)
    {
        $transaction = Transaction::with(['user'])->findOrFail($id);

        $details = TransactionDetail::with('product.category')
            ->where('transaction_id', $id)
            ->get();

        $total_price = $details->sum('total_price');

        return view('invoice.print', compact('transaction', 'details', 'total_price'));
    }
}
