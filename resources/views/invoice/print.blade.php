<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Invoice {{ $transaction->invoice }}</title>
    <style>
        @page { size: 210mm 330mm; margin: 20mm; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .box { border: 1px dashed #999; padding: 10px; margin-bottom: 20px; }
        .logo { width: 150px; margin-bottom: 10px; }
        .header { text-align: center; }
        .header h2 { margin: 0; font-size: 18px; }
        .header p { margin: 5px 0; font-size: 14px; }
        .info { font-size: 14px; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            font-size: 14px;
        }
        th { background-color: #f2f2f2; }
        .total {
            text-align: right;
            font-size: 14px;
            font-weight: bold;
            margin-top: 10px;
        }
        .signature-section {
            margin-top: 30px;
            font-size: 14px;
            padding: 10px;
        }
        .signature-section .right {
            float: right;
            width: 40%;
            text-align: center;
        }
        .clear { clear: both; }
        .footer {
            margin-top: 30px;
            font-size: 14px;
            text-align: center;
            padding-top: 10px;
        }
    </style>
</head>
<body onload="window.print()">
    <div style="display: flex; align-items: center; margin-bottom: 20px;">
        <div style="flex: 0 0 150px;">
            <img src="{{ asset('Logo.jpg') }}" alt="Logo Perusahaan" style="width: 150px;">
        </div>
        <div style="flex: 1; text-align: center; padding-left: 20px;">
            <h2 style="margin: 0;">CV. HAZIQ BERKAH JAYA MANDIRI</h2>
            <p style="margin: 2px 0;">Jl.SM Amin Kelurahan No.149</p>
            <p style="margin: 2px 0;">Simpang Baru, Kec. Tampan</p>
            <p style="margin: 2px 0;">Kota Pekanbaru</p>
        </div>
    </div>
    <hr style="border: 2px solid red; margin-bottom: 20px;">
    <h2 style="text-align: center;">INVOICE</h2>
    <div class="info">
        <p><strong>No: {{ $transaction->invoice }}</strong></p>
        <p><strong>BILL TO: {{ $transaction->user->name ?? '-' }}</strong></p>
    </div>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Nama Produk</th>
                    <th>Kategori</th>
                    <th>Kuantitas</th>
                    <th>Total Harga</th>
                </tr>
            </thead>
            <tbody>
                @foreach($details as $detail)
                <tr>
                    <td>{{ $detail->product->name ?? '-' }}</td>
                    <td>{{ $detail->product->category->name ?? '-' }}</td>
                    <td>{{ $detail->quantity }}</td>
                    <td>Rp {{ number_format($detail->total_price, 0, ',', '.') }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="total">
            Total: Rp {{ number_format($details->sum('total_price'), 0, ',', '.') }}
        </div>
    </div>
    <div style="margin-top: 20px; font-size: 14px;">
        <p>Demikian surat tagihan ini kami sampaikan. Untuk kelancaran administrasi, harap seluruh pembayaran hanya ditransfer ke rekening berikut:</p>
        <p><strong>Bank Mandiri:</strong> 167 000 5452 866 (M.Nurjoni)</p>
        <p><strong>Bank Centra Asia (BCA):</strong> 6145 030 777 (M.Nurjoni)</p>
    </div>

    <div class="signature-section">
        <div class="right">
            <img src="{{ asset('Tanda Tangan.jpg') }}" alt="Tanda Tangan" style="width: 150px;">
            <p><strong>(M.Nurjoni)</strong></p>
        </div>
        <div class="clear"></div>
    </div>

    <div class="footer">
        Terima kasih telah bertransaksi dengan kami!
    </div>
</body>
</html>
