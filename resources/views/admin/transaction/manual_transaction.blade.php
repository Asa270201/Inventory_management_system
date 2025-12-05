@extends('layouts.master')

@section('content')
<style>
    .form-section {
        background-color: #f8f9fc;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    .form-section h5 {
        font-weight: bold;
        color: #4e73df;
        margin-bottom: 15px;
    }

    .form-control {
        margin-bottom: 10px;
    }

    .btn-primary {
        background-color: #4e73df;
        border: none;
    }

    .btn-success {
        background-color: #1cc88a;
        border: none;
    }

    .btn-secondary {
        background-color: #36b9cc;
        border: none;
    }

    .btn-danger {
        background-color: #e74a3b;
        border: none;
    }

    .summary-box {
        background-color: #ffffff;
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 8px;
    }

    .summary-box span {
        font-weight: bold;
        font-size: 16px;
        display: block;
        margin-bottom: 10px;
    }

    .alert-success {
        margin-bottom: 20px;
    }
</style>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Transaksi Manual</h1>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <form method="POST" action="{{ route('admin.manual.transaction.store') }}">
        @csrf
        <div class="row">
            <!-- Kiri: Customer & Produk -->
            <div class="col-md-8">
                <div class="form-section">
                    <h5>🧑‍💼 Data Customer</h5>
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
                    <input type="text" id="email" class="form-control" placeholder="Email" readonly>
                    <input type="text" id="divisi" class="form-control" placeholder="Divisi" readonly>
                </div>

                <div class="form-section">
                    <h5>🛒 Keranjang Produk</h5>
                    <button type="button" class="btn btn-primary mb-2" id="add-product">+ Tambah Produk</button>
                    <div id="product-container">
                        <div class="form-row mb-2">
                            <select name="products[]" class="form-control product-select" required>
                                <option value="" disabled selected>-- Pilih Produk --</option>
                                @foreach($products as $product)
                                    <option value="{{ $product->id }}" data-price="{{ $product->selling_price }}">
                                        {{ $product->name }}
                                    </option>
                                @endforeach
                            </select>
                            <input type="number" name="quantities[]" class="form-control quantity-input" min="1" placeholder="Qty">
                            <input type="text" class="form-control price-display" placeholder="Subtotal" readonly>
                            <button type="button" class="btn btn-danger remove-product">🗑️</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Kanan: Ringkasan -->
            <div class="col-md-4">
                <div class="form-section summary-box">
                    <h5>📦 Ringkasan Order</h5>
                    <span id="totalItems">Total Barang: 0 item</span>
                    <span id="totalHarga">Total Harga Jual: Rp 0</span>
                    <button type="submit" class="btn btn-success btn-block">Simpan Transaksi</button>
                </div>
            </div>
        </div>
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
    row.querySelector('.quantity-input').value = '';
    row.querySelector('.price-display').value = '';
    container.appendChild(row);
});

document.addEventListener('click', function (e) {
    if (e.target.classList.contains('remove-product')) {
        const rows = document.querySelectorAll('#product-container .form-row');
        if (rows.length > 1) {
            e.target.closest('.form-row').remove();
            updateTotal();
        }
    }
});

function updateTotal() {
    let totalQty = 0;
    let totalPrice = 0;
    const selectedProducts = new Set();
    let duplicateFound = false;

    document.querySelectorAll('#product-container .form-row').forEach(row => {
        const select = row.querySelector('.product-select');
        const qtyInput = row.querySelector('.quantity-input');
        const priceDisplay = row.querySelector('.price-display');

        const qty = parseInt(qtyInput.value) || 0;
        const price = parseInt(select.selectedOptions[0]?.getAttribute('data-price')) || 0;
        const subtotal = qty * price;

        priceDisplay.value = 'Rp ' + subtotal.toLocaleString();
        totalQty += qty;
        totalPrice += subtotal;

        const val = select.value;
        if (selectedProducts.has(val)) {
            duplicateFound = true;
            select.classList.add('is-invalid');
        } else {
            selectedProducts.add(val);
            select.classList.remove('is-invalid');
        }
    });

    if (duplicateFound) {
        alert('Produk tidak boleh dipilih lebih dari satu kali!');
    }

    document.getElementById('totalItems').innerText = totalQty + ' item';
    document.getElementById('totalHarga').innerText = 'Rp ' + totalPrice.toLocaleString();
}

document.addEventListener('input', function (e) {
    if (e.target.classList.contains('quantity-input') || e.target.classList.contains('product-select')) {
        updateTotal();
    }
});
</script>
@endsection
