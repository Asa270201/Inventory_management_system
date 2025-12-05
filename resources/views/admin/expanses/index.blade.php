@extends('layouts.master')

@section('title', 'Data Pengeluaran')

@section('content')

@if(session('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif

@if($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="container mt-4">
    <h2 class="mb-4 text-center">Form Pengeluaran</h2>

    <div class="card mb-4">
        <div class="card-body">
            <form action="{{ route('expenses.store') }}" method="POST">
                @csrf
                <div class="form-group mb-3">
                    <label for="nama_pengeluaran">Nama Pengeluaran</label>
                    <input type="text" name="nama_pengeluaran" class="form-control" required>
                </div>

                <div class="form-group mb-3">
                    <label for="jumlah">Jumlah (Rp)</label>
                    <input type="number" name="jumlah" class="form-control" step="0.01" required>
                </div>

                <div class="form-group mb-3">
                    <label for="tanggal">Tanggal</label>
                    <input type="date" name="tanggal" class="form-control" required>
                </div>

                <div class="form-group mb-3">
                    <label for="keterangan">Keterangan</label>
                    <textarea name="keterangan" class="form-control" rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Simpan Pengeluaran</button>
            </form>
        </div>
    </div>

    <h4 class="mb-3">Riwayat Pengeluaran</h4>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Nama Pengeluaran</th>
                    <th>Jumlah</th>
                    <th>Tanggal</th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <tbody>
                @forelse($expenses as $expense)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $expense->nama_pengeluaran }}</td>
                    <td>Rp {{ number_format($expense->jumlah, 0, ',', '.') }}</td>
                    <td>{{ \Carbon\Carbon::parse($expense->tanggal)->format('d-m-Y') }}</td>
                    <td>{{ $expense->keterangan }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="text-center">Belum ada data pengeluaran.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
