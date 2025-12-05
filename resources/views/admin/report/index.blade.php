@extends('layouts.master', ['title' => 'Barang Keluar'])

@section('content')
<x-container>
    <div class="col-12 d-print-none">
        <form action="{{ route('admin.report') }}" method="GET">
            <div class="row">
                <div class="col-6">
                    <x-input title="Tanggal Awal" name="from" type="date" placeholder="" value="{{ $fromDate }}" />
                </div>
                <div class="col-6">
                    <x-input title="Tanggal Akhir" name="to" type="date" placeholder="" value="{{ $toDate }}" />
                </div>
            </div>
            <x-button-save title="Cari Data" icon="search" class="btn btn-primary mt-3" />
        </form>
    </div>

    @isset($fromDate, $toDate)
    <div class="col-12 my-3">
        <x-card title="LAPORAN DATA BARANG" class="card-body p-0">
            <x-button-save title="Cetak Laporan" icon="print" class="btn btn-success my-3 d-print-none" onclick="window.print()" />

            <x-table>
                <thead>
                    <tr>
                        <th>Nama Barang</th>
                        <th>Kategori</th>
                        <th>Kuantitas</th>
                        <th>Total Modal</th>
                        <th>Total Uang Masuk</th>
                        <th>Total Laba</th>
                        <th>Margin (%)</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($items as $item)
                    <tr>
                        <td>{{ $item->product_name }}</td>
                        <td>{{ $item->category_name }}</td>
                        <td>{{ $item->total_quantity }}</td>
                        <td>Rp {{ number_format($item->total_modal, 0, ',', '.') }}</td>
                        <td>Rp {{ number_format($item->total_income, 0, ',', '.') }}</td>
                        <td>Rp {{ number_format($item->total_profit, 0, ',', '.') }}</td>
                        <td>{{ $item->margin_percent }}%</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2"><strong>Total Keseluruhan</strong></td>
                        <td><strong>{{ $totalQuantity }}</strong></td>
                        <td><strong>Rp {{ number_format($totalModal, 0, ',', '.') }}</strong></td>
                        <td><strong>Rp {{ number_format($totalIncome, 0, ',', '.') }}</strong></td>
                        <td><strong>Rp {{ number_format($totalProfit, 0, ',', '.') }}</strong></td>
                        <td><strong>{{ $averageMargin }}%</strong></td>
                    </tr>
                    <tr>
                        <td colspan="5"><strong>Total Pengeluaran</strong></td>
                        <td colspan="2"><strong>Rp {{ number_format($totalPengeluaran, 0, ',', '.') }}</strong></td>
                    </tr>
                    <tr>
                        <td colspan="5"><strong>Laba Bersih</strong></td>
                        <td colspan="2"><strong>Rp {{ number_format($labaBersih, 0, ',', '.') }}</strong></td>
                    </tr>
                </tfoot>
            </x-table>
        </x-card>
    </div>
    @endisset
</x-container>

{{-- CSS untuk menyembunyikan elemen saat cetak --}}
<style>
@media print {
    .d-print-none {
        display: none !important;
    }
}
</style>
@endsection
