@extends('layouts.master', ['title' => 'Akun'])

@section('content')
    <x-container>
        <div class="col-12">
            <x-card title="PROFILE" class="card-body">
                <form action="{{ route('customer.setting.update', $user->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="form-group">
                        <label for="name">Nama</label>
                        <input type="text" name="name" class="form-control" value="{{ $user->name }}">
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" class="form-control" value="{{ $user->email }}">
                    </div>

                    <div class="form-group">
                        <label for="store_address">Alamat</label>
                        <input type="text" name="store_address" class="form-control" value="{{ $user->store_address }}" placeholder="Masukkan alamat toko">
                    </div>

                    <div class="form-group">
                        <label for="avatar">Avatar</label>
                        <input type="file" name="avatar" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Kosongkan jika tidak ingin mengubah">
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update
                    </button>
                </form>
            </x-card>
        </div>
    </x-container>
@endsection
