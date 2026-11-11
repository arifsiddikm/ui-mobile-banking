import 'package:flutter/material.dart';

import '../data/transaksi.dart';
import '../utils/format.dart';
import '../warna.dart';
import '../widgets/item_transaksi.dart';

// halaman list mutasi, ada tab 6 bulan terakhir
class MutasiScreen extends StatelessWidget {
  const MutasiScreen({super.key});

  // 6 bulan terakhir: Juni - November 2026
  static const bulanTab = [6, 7, 8, 9, 10, 11];
  static const tahun = 2026;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bulanTab.length,
      initialIndex: bulanTab.length - 1, // langsung ke bulan terakhir
      child: Scaffold(
        backgroundColor: biruBawah,
        body: Column(
          children: [
            _header(context),
            Expanded(child: _isiTransaksi()),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: gradientBiru),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined, color: Colors.white),
                  ),
                ],
              ),
              _kartuDebit(),
              const SizedBox(height: 10),
              const Text(
                'Tabungan Mandiri',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(noRekening, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(width: 8),
                  const Icon(Icons.copy, color: Colors.white, size: 18),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Rp ${rupiah(saldoUtama)},50',
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // kartu debit mini (gambar manual pakai Container)
  Widget _kartuDebit() {
    return Container(
      width: 96,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [Color(0xFF9AA5B1), Color(0xFF4B5563)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('mandiri', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'VISA',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  // bagian putih: judul, tab bulan, dan list
  Widget _isiTransaksi() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 48,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaksi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: abuTeks)),
                Text('e-Statement', style: TextStyle(color: biruIcon, fontSize: 16)),
              ],
            ),
          ),
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black87,
            unselectedLabelColor: abuTeks,
            indicatorColor: biruIcon,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            tabs: [
              for (final b in bulanTab) Tab(text: namaBulan[b - 1]),
            ],
          ),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              children: [
                for (final b in bulanTab) _listBulan(b),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listBulan(int bulan) {
    final data = semuaTransaksi
        .where((t) => t.tanggal.month == bulan && t.tanggal.year == tahun)
        .toList();

    int totalMasuk = 0;
    int totalKeluar = 0;
    for (final t in data) {
      if (t.masuk) {
        totalMasuk += t.nominal;
      } else {
        totalKeluar += t.nominal;
      }
    }

    // susun widget: ringkasan, lalu header tanggal tiap ganti hari
    final isi = <Widget>[_ringkasan(totalMasuk, totalKeluar)];
    DateTime? tanggalSebelumnya;

    for (final t in data) {
      if (tanggalSebelumnya != t.tanggal) {
        isi.add(Container(
          width: double.infinity,
          color: abuBg,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(tanggalPendek(t.tanggal), style: const TextStyle(color: abuTeks, fontSize: 15)),
        ));
        tanggalSebelumnya = t.tanggal;
      }
      isi.add(ItemTransaksi(data: t));
      isi.add(const Divider(height: 1));
    }

    return ListView(padding: EdgeInsets.zero, children: isi);
  }

  Widget _ringkasan(int masuk, int keluar) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: _kotakRingkasan('Uang Masuk', masuk, hijau)),
          const SizedBox(width: 12),
          Expanded(child: _kotakRingkasan('Uang Keluar', keluar, Colors.redAccent)),
        ],
      ),
    );
  }

  Widget _kotakRingkasan(String judul, int nominal, Color warna) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: warna.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul, style: const TextStyle(color: abuTeks, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            'IDR ${rupiah(nominal)}',
            style: TextStyle(color: warna, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
