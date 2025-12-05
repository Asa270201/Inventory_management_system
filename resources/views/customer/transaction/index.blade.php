@extends('layouts.master', ['title' => 'Transaksi'])

@section('content')
    <x-container>
        <div class="col-12">
            <x-card title="DAFTAR TRANSAKSI" class="card-body p-0">
                <x-table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Invoice</th>
                            <th>Nama Produk</th>
                            <th>Kategori Produk</th>
                            <th>Kuantitas</th>
                            <th>Total Harga</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($transactions as $i => $transaction)
                            <tr>
                                <td>{{ $i + $transactions->firstItem() }}</td>
                                <td>{{ $transaction->user->name }}</td>
                                <td>
                                    @foreach ($transaction->details as $details)
                                        <li>{{ $details->product->name }}</li>
                                    @endforeach
                                </td>
                                <td>
                                    @foreach ($transaction->details as $details)
                                        <li>{{ $details->product->category->name }}</li>
                                    @endforeach
                                </td>
                                <td>
                                    @foreach ($transaction->details as $details)
                                        <li>{{ $details->quantity }} - {{ $details->product->unit }}</li>
                                    @endforeach
                                </td>
                                <td>
                                    @foreach ($transaction->details as $details)
                                        <li>{{ $details->total_price }}</li>
                                    @endforeach
                                </td>
                                <td>
                                    {{ number_format($transaction->total_price, 0, ',', '.') }}
                                    <a href="{{ route('invoice.print', $transaction->id) }}" class="btn btn-sm btn-primary ml-2" target="_blank">
                                        Cetak Invoice
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        <tr>
                            <td colspan="4" class="font-weight-bold text-uppercase">
                                Total Transaksi
                            </td>
                            <td class="font-weight-bold text-danger text-right">
                                {{ $transactions->count() }}x Transaksi
                            </td>
                        </tr>
                    </tbody>
                </x-table>
            </x-card>
            <div class="d-flex justify-content-end">{{ $transactions->links() }}</div>
        </div>
    </x-container>
@endsection
