<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->paginate(10);

        $roles = Role::get();

        return view('admin.user.index', compact('users', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $user->syncRoles($request->role);

        return back()->with('toast_success', 'Role User Berhasil Diubah');
    }
    
    public function create()
{
    return view('admin.user.create', [
        'title' => 'Tambah Customer'
    ]);
}

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
            'store_address' => 'required|string|max:255', // ✅ validasi alamat toko
        ]);

        $user = new User();
        $user->name = $validated['name'];
        $user->email = $validated['email'];
        $user->password = Hash::make($validated['password']);
        $user->department = 'Umum';
        $user->store_address = $validated['store_address']; // ✅ simpan ke database
        $user->save();

        $user->assignRole('Customer');

        return redirect()->route('admin.user.index')->with('success', 'Customer berhasil ditambahkan');
    }
}
