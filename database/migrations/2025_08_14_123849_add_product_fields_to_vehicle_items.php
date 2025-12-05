<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
{
    Schema::table('vehicle_items', function (Blueprint $table) {
        $table->unsignedBigInteger('product_id')->after('vehicle_transaction_id');
        $table->decimal('purchase_price', 12, 2)->default(0)->after('quantity');
        $table->decimal('subtotal', 12, 2)->default(0)->after('purchase_price');

        // Optional: jika ingin relasi
        $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
    });
}

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vehicle_items', function (Blueprint $table) {
            //
        });
    }
};
