@extends('layouts.master')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Transaksi Manual</h1>

    <form action="{{ route('admin.manual.transaction.store') }}" method="POST">
        @csrf

        <div class="card shadow mb-4">
            <div class="card-header py-3 bg-primary text-white">
                <h6 class="m-0 font-weight-bold">Informasi Customer</h6>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="customer_id">Pilih Customer</label>
                    <select id="customerSelect" name="customer_id" class="form-control" required>
                        <option value="" disabled selected>-- Pilih Customer --</option>
                        @foreach($users as $user)
                            <option value="{{ $user->id }}"
                                    data-email="{{ $user->email }}"
                                    data-divisi="{{ $user->department }}">
                                {{ $user->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="text" id="email" class="form-control" readonly>
                </div>

                <div class="form-group">
                    <label>Divisi</label>
                    <input type="text" id="divisi" class="form-control" readonly>
                </div>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3 bg-success text-white">
                <h6 class="m-0 font-weight-bold">Detail Barang</h6>
            </div>
            <div class="card-body">
                <div id="product-container">
                    <div class="form-row mb-3">
                        <div class="col-md-6">
                            <label>Produk</label>
                            <select name="products[]" class="form-control" required>
                                <option value="" disabled selected>-- Pilih Produk --</option>
                                @foreach($products as $product)
                                    <option value="{{ $product->id }}">{{ $product->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Jumlah</label>
                            <input type="number" name="quantities[]" class="form-control" min="1" required>
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button type="button" class="btn btn-danger btn-sm remove-product">Hapus</button>
                        </div>
                    </div>
                </div>

                <button type="button" class="btn btn-info btn-sm" id="add-product">+ Tambah Produk</button>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Simpan Transaksi</button>
    </form>
</div>

<script>
document.getElementById('customerSelect').addEventListener('change', function () {
    const selected = this.options[this.selectedIndex];
    document.getElementById('email').value = selected.getAttribute('data-email');
    document.getElementById('divisi').value = selected.getAttribute('data-divisi');
});

document.getElementById('add-product').addEventListener('click', function () {
    const container = document.getElementById('product-container');
    const row = container.children[0].cloneNode(true);
    row.querySelector('select').value = '';
    row.querySelector('input').value = '';
    container.appendChild(row);
});

document.addEventListener('click', function (e) {
    if (e.target.classList.contains('remove-product')) {
        const rows = document.querySelectorAll('#product-container .form-row');
        if (rows.length > 1) {
            e.target.closest('.form-row').remove();
        }
    }
});
</script>
@endsection
