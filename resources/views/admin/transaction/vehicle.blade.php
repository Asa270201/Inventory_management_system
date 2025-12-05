@extends('layouts.master', ['title' => 'Kendaraan Keluar'])

@section('content')
    <x-container>
        <div class="col-12">
            <div class="d-flex justify-content-end align-items-center">
                <form action="{{ route('admin.transaction.vehicle') }}" method="GET">
                    <div class="input-icon mb-3">
                        <input type="text" class="form-control" placeholder="Search…" name="q" value="{{ request()->q }}">
                        <span class="input-icon-addon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"></path>
                                <circle cx="10" cy="10" r="7"></circle>
                                <line x1="21" y1="21" x2="15" y2="15"></line>
                            </svg>
                        </span>
                    </div>
                </form>
            </div>

            <x-card title="DAFTAR BARANG MASUK" class="card-body p-0">
                <x-table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama Supplier</th>
                            <th>Nama Barang</th>
                            <th>Kategori Barang</th>
                            <th>Jumlah Barang</th>
                            <th>Harga Beli</th>
                            <th>Subtotal</th>
                            <th>Deskripsi</th>
                            <th>Waktu Input</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($vehicleItems as $i => $item)
                            <tr>
                                <td>{{ $i + $vehicleItems->firstItem() }}</td>
                                <td>{{ $item->Supplier }}</td> {{-- Ambil langsung dari kolom supplier --}}
                                <td>{{ $item->product_name }}</td>
                                <td>{{ $item->product->category->name ?? '-' }}</td>
                                <td>{{ $item->quantity }}</td>
                                <td>Rp {{ number_format($item->purchase_price, 0, ',', '.') }}</td>
                                <td>Rp {{ number_format($item->subtotal, 0, ',', '.') }}</td>
                                <td>{{ $item->description ?? '-' }}</td>
                                <td>{{ \Carbon\Carbon::parse($item->created_at)->format('d-m-Y H:i') }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </x-table>

                <div class="d-flex justify-content-end">{{ $vehicleItems->links() }}</div>
            </x-card>

            <a href="{{ route('vehicle_transactions.create') }}" class="btn btn-success mb-3">+ Input Barang Masuk</a>
        </div>
    </x-container>
@endsection
