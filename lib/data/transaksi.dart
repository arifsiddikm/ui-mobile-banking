// Data dummy buat tampilan aja, belum ada backend

const saldoUtama = 50482317;
const noRekening = '1630004250463';

class Transaksi {
  final String jenis; // qr, transfer, biaya, topup, bayar, setor
  final String judul;
  final String keterangan;
  final int nominal;
  final bool masuk; // true = uang masuk
  final DateTime tanggal;

  const Transaksi(
    this.jenis,
    this.judul,
    this.keterangan,
    this.nominal,
    this.masuk,
    this.tanggal,
  );
}

// diurutkan dari yang paling baru
final semuaTransaksi = <Transaksi>[
  // ---- November 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke WARUNG SURYADI\n611057364181', 39000, false, DateTime(2026, 11, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer dari BANK MANDIRI\nRINA AMELIA 9000016161110', 100000, true, DateTime(2026, 11, 5)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Kopi Senja\n611448126129', 10000, false, DateTime(2026, 11, 5)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 11, 5)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke WARUNG SURYADI\n611032451446', 21500, false, DateTime(2026, 11, 3)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke WARUNG SURYADI\n611031184312', 13000, false, DateTime(2026, 11, 3)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nDari BANK BCA\nDIMAS PRATAMA 90250113259', 2500000, true, DateTime(2026, 11, 3)),
  Transaksi('topup', 'Top-up', 'Top-up GoPay\n0812xxxx4471', 150000, false, DateTime(2026, 11, 2)),
  Transaksi('bayar', 'Bayar/VA', 'Tagihan listrik PLN\n5321xxxx0098', 325000, false, DateTime(2026, 11, 2)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nKe BANK BNI\nSITI NURHALIZA 0098123456', 500000, false, DateTime(2026, 11, 1)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan Oktober\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 11, 1)),

  // ---- Oktober 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Indomaret\n611022334455', 47800, false, DateTime(2026, 10, 30)),
  Transaksi('bayar', 'Bayar/VA', 'Internet IndiHome\n1200xxxx3321', 385000, false, DateTime(2026, 10, 28)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Ayam Geprek Bu Tini\n611098877665', 27000, false, DateTime(2026, 10, 25)),
  Transaksi('setor', 'Setor Tunai', 'Setor tunai di Cabang Bandung', 5000000, true, DateTime(2026, 10, 20)),
  Transaksi('topup', 'Top-up', 'Top-up DANA\n0857xxxx2210', 200000, false, DateTime(2026, 10, 17)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nKe BANK BRI\nBUDI SANTOSO 0123456789', 1750000, false, DateTime(2026, 10, 12)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 10, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan September\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 10, 1)),

  // ---- September 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Mie Gacoan\n611045678123', 68500, false, DateTime(2026, 9, 27)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer dari BANK BCA\nANDI WIJAYA 0123987456', 750000, true, DateTime(2026, 9, 22)),
  Transaksi('bayar', 'Bayar/VA', 'Pembayaran UKT Semester 5\nVA 8808xxxx1122', 4250000, false, DateTime(2026, 9, 15)),
  Transaksi('topup', 'Top-up', 'Top-up ShopeePay\n0813xxxx9087', 100000, false, DateTime(2026, 9, 12)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Fotokopi Barokah\n611011223344', 15000, false, DateTime(2026, 9, 8)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 9, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan Agustus\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 9, 1)),

  // ---- Agustus 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke WARUNG SURYADI\n611055443322', 32000, false, DateTime(2026, 8, 29)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nKe BANK BSI\nUMI KALSUM 7123456789', 3000000, false, DateTime(2026, 8, 24)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Alfamart\n611066778899', 56300, false, DateTime(2026, 8, 19)),
  Transaksi('setor', 'Setor Tunai', 'Setor tunai di ATM Setor Tarik', 2000000, true, DateTime(2026, 8, 14)),
  Transaksi('bayar', 'Bayar/VA', 'Tagihan listrik PLN\n5321xxxx0098', 298000, false, DateTime(2026, 8, 10)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 8, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan Juli\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 8, 1)),

  // ---- Juli 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Bakso Pak Kumis\n611012345678', 22000, false, DateTime(2026, 7, 30)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nKe BANK BCA\nDIMAS PRATAMA 90250113259', 850000, false, DateTime(2026, 7, 21)),
  Transaksi('topup', 'Top-up', 'Top-up GoPay\n0812xxxx4471', 250000, false, DateTime(2026, 7, 18)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer dari BANK MANDIRI\nRINA AMELIA 9000016161110', 1250000, true, DateTime(2026, 7, 11)),
  Transaksi('bayar', 'Bayar/VA', 'Tiket kereta api KAI\nKode booking 7XQ2LM', 168000, false, DateTime(2026, 7, 9)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 7, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan Juni\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 7, 1)),

  // ---- Juni 2026 ----
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Kopi Senja\n611044556677', 18000, false, DateTime(2026, 6, 28)),
  Transaksi('transfer', 'Transfer Rupiah', 'Transfer BI Fast\nKe BANK BNI\nSITI NURHALIZA 0098123456', 1500000, false, DateTime(2026, 6, 23)),
  Transaksi('bayar', 'Bayar/VA', 'Internet IndiHome\n1200xxxx3321', 385000, false, DateTime(2026, 6, 17)),
  Transaksi('setor', 'Setor Tunai', 'Setor tunai di Cabang Bandung', 10000000, true, DateTime(2026, 6, 13)),
  Transaksi('qr', 'QR Bayar', 'Pembayaran QR\nke Indomaret\n611077665544', 4500, false, DateTime(2026, 6, 9)),
  Transaksi('biaya', 'Biaya', 'Biaya administrasi kartu debit', 9000, false, DateTime(2026, 6, 5)),
  Transaksi('transfer', 'Transfer Rupiah', 'Gaji bulan Mei\nPT NUSANTARA DIGITAL', 12500000, true, DateTime(2026, 6, 1)),
];
