@extends('layouts.master')

@section('title', 'Tambah Customer')

@section('content')
<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Tambah Customer</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('admin.user.store') }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label for="name" class="form-label">Nama Customer</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email Customer</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Masukkan email" required>
                </div>

                <div class="form-group">
                    <label for="store_address">Alamat Toko</label>
                    <input type="text" name="store_address" id="store_address" class="form-control" placeholder="Masukkan alamat toko" required>
                </div>

                <!-- <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select name="role" id="role" class="form-select" required>
                        <option value="Customer" selected>Customer</option>
                    </select>
                </div> -->

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Masukkan password" required>
                </div>

                <button type="submit" class="btn btn-success">
                    <i class="fas fa-save"></i> Simpan
                </button>
            </form>
        </div>
    </div>
</div>
@endsection
