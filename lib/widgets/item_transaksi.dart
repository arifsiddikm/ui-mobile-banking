import 'package:flutter/material.dart';

import '../data/transaksi.dart';
import '../utils/format.dart';
import '../warna.dart';

// satu baris transaksi (dipakai di dashboard & halaman mutasi)
class ItemTransaksi extends StatelessWidget {
  final Transaksi data;

  const ItemTransaksi({super.key, required this.data});

  IconData _pilihIcon() {
    switch (data.jenis) {
      case 'qr':
        return Icons.qr_code_2;
      case 'transfer':
        return Icons.arrow_circle_right_outlined;
      case 'biaya':
        return Icons.paid_outlined;
      case 'topup':
        return Icons.account_balance_wallet_outlined;
      case 'bayar':
        return Icons.receipt_long_outlined;
      default:
        return Icons.savings_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final warnaNominal = data.masuk ? hijau : Colors.black87;
    final tanda = data.masuk ? '+' : '-';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_pilihIcon(), color: biruIcon, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.judul,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  data.keterangan,
                  style: const TextStyle(color: abuTeks, fontSize: 13, height: 1.3),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text.rich(
            TextSpan(
              style: TextStyle(color: warnaNominal, fontSize: 15, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: '$tanda IDR ${rupiah(data.nominal)}'),
                const WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Text('00', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
