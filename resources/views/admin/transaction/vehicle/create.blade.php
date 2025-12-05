@extends('layouts.master')

@section('title', 'Input Kendaraan Keluar')

@section('content')
<div class="container mt-4">
    <h4 class="mb-3">Input Kendaraan Keluar</h4>
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    <form action="{{ route('vehicle_transactions.store') }}" method="POST">
        @csrf

        {{-- Informasi Kendaraan --}}
        <div class="card mb-4">
            <div class="card-header">Informasi Kendaraan</div>
            <div class="card-body row g-3">
                <div class="col-md-4">
                    <label for="vehicle_id" class="form-label">Nomor Kendaraan</label>
                    <select name="vehicle_id" class="form-select" required>
                        <option value="">-- Pilih Nomor Kendaraan --</option>
                        @foreach($vehicles as $vehicle)
                            <option value="{{ $vehicle->id }}">{{ $vehicle->license_plat }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Nama Kendaraan</label>
                    <input type="text" name="vehicle_name" class="form-control" readonly>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Nama Sopir</label>
                    <input type="text" name="driver_name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <select name="supplier" class="form-control" required>
                        <option value="">-- Pilih Supplier --</option>
                        @foreach ($suppliers as $supplier)
                            <option value="{{ $supplier->name }}">{{ $supplier->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        {{-- Barang yang Dibawa --}}
        <div class="card mb-4">
            <div class="card-header">Barang yang Dibawa</div>
            <div class="card-body">
                <table class="table table-bordered" id="itemsTable">
                    <thead>
                        <tr>
                            <th>Nama Barang</th>
                            <th>Jumlah</th>
                            <th>Harga Beli (Rp)</th>
                            <th>Total Harga (Rp)</th>
                            <th>Deskripsi</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <button type="button" class="btn btn-sm btn-primary" id="addItemBtn">Tambah Barang</button>
            </div>
        </div>

        {{-- Total dan Simpan --}}
        <div class="d-flex justify-content-between align-items-center">
            <h5>Total Harga Semua Barang: <span id="grandTotal">Rp 0</span></h5>
            <button type="submit" class="btn btn-success">Simpan</button>
        </div>
    </form>
</div>

{{-- Script Dinamis --}}
<script>
    let products = @json($products);
    let vehicles = @json($vehicles);
    let itemIndex = 0;

    document.querySelector('select[name="vehicle_id"]').addEventListener('change', function () {
        let selectedId = this.value;
        let selectedVehicle = vehicles.find(v => v.id == selectedId);
        document.querySelector('input[name="vehicle_name"]').value = selectedVehicle ? selectedVehicle.name : '';
    });

    document.getElementById('addItemBtn').addEventListener('click', function () {
        let row = document.createElement('tr');
        row.innerHTML = `
            <td>
                <select name="items[${itemIndex}][product_id]" class="form-select product-select" required>
                    ${products.map(p => `<option value="${p.id}" data-price="${p.purchase_price}">${p.name}</option>`).join('')}
                </select>
            </td>
            <td><input type="number" name="items[${itemIndex}][quantity]" class="form-control quantity-input" min="1" required></td>
            <td><input type="text" name="items[${itemIndex}][purchase_price]" class="form-control price-display" readonly></td>
            <td><input type="text" name="items[${itemIndex}][subtotal]" class="form-control total-display" readonly></td>
            <td><input type="text" name="items[${itemIndex}][description]" class="form-control"></td>
            <td><button type="button" class="btn btn-danger btn-sm remove-btn">Hapus</button></td>
        `;
        document.querySelector('#itemsTable tbody').appendChild(row);
        itemIndex++;
        updateListeners();
    });

    function updateListeners() {
        document.querySelectorAll('.product-select').forEach(select => {
            select.addEventListener('change', updateRow);
        });
        document.querySelectorAll('.quantity-input').forEach(input => {
            input.addEventListener('input', updateRow);
        });
        document.querySelectorAll('.remove-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                btn.closest('tr').remove();
                updateGrandTotal();
            });
        });
    }

    function updateRow() {
        document.querySelectorAll('#itemsTable tbody tr').forEach(row => {
            let select = row.querySelector('.product-select');
            let quantity = row.querySelector('.quantity-input').value;
            let price = select.selectedOptions[0]?.dataset.price || 0;
            let total = price * quantity;

            row.querySelector('.price-display').value = price;
            row.querySelector('.total-display').value = total;
        });
        updateGrandTotal();
    }

    function updateGrandTotal() {
        let total = 0;
        document.querySelectorAll('.total-display').forEach(input => {
            total += parseInt(input.value) || 0;
        });
        document.getElementById('grandTotal').textContent = 'Rp ' + total.toLocaleString();
    }
</script>
@endsection
