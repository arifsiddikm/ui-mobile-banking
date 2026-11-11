import 'package:flutter/material.dart';

import '../data/konten.dart';
import '../data/transaksi.dart';
import '../utils/format.dart';
import '../warna.dart';
import '../widgets/banner_slider.dart';
import '../widgets/item_transaksi.dart';
import '../widgets/menu_item.dart';
import 'mutasi_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _saldoTampil = true;
  final int _tabAktif = 0;

  void _bukaMutasi() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MutasiScreen()),
    );
  }

  void _belumAda(String nama) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Menu $nama belum tersedia (UI saja)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuBg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 20),
            _menuUtama(),
            _judulBagian('e-Wallet'),
            _listDompet(),
            const SizedBox(height: 24),
            const BannerSlider(),
            _judulBagian('Promo Pilihan'),
            _sliderPromo(),
            _judulBagian('Transaksi Terakhir', aksi: 'Lihat Semua'),
            _transaksiTerakhir(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _navBawah(),
    );
  }

  // ---------- HEADER BIRU ----------
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      decoration: const BoxDecoration(
        gradient: gradientBiru,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Text('A', style: TextStyle(color: biruIcon, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat malam,', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text('Arif Siddik', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => _belumAda('Notifikasi'),
                  icon: const Icon(Icons.notifications_none, color: Colors.white),
                ),
                IconButton(
                  onPressed: () => _belumAda('Bantuan'),
                  icon: const Icon(Icons.headset_mic_outlined, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Tabungan Mandiri', style: TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 2),
            Text(
              noRekening,
              style: const TextStyle(color: Colors.white70, letterSpacing: 1),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  _saldoTampil ? 'Rp ${rupiah(saldoUtama)},50' : 'Rp ••••••••',
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => setState(() => _saldoTampil = !_saldoTampil),
                  child: Icon(
                    _saldoTampil ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _aksiCepat(Icons.send, 'Transfer\nRupiah', 'Transfer'),
                _aksiCepat(Icons.receipt_long, 'Bayar/VA', 'Bayar/VA'),
                _aksiCepat(Icons.add_card, 'Top-up', 'Top-up'),
                _aksiCepat(Icons.history, 'Mutasi\nRekening', 'Mutasi', buka: _bukaMutasi),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _aksiCepat(IconData icon, String label, String nama, {VoidCallback? buka}) {
    return SizedBox(
      width: 76,
      child: MenuItem(
        icon: icon,
        label: label,
        warnaLabel: Colors.white,
        onTap: buka ?? () => _belumAda(nama),
      ),
    );
  }

  // ---------- MENU GRID ----------
  Widget _menuUtama() {
    final menu = [
      [Icons.qr_code_scanner, 'QR Bayar'],
      [Icons.atm, 'Setor Tarik'],
      [Icons.restaurant, 'Livin\' Food'],
      [Icons.trending_up, 'Investasi'],
      [Icons.phone_android, 'Pulsa & Data'],
      [Icons.flight_takeoff, 'Tiket'],
      [Icons.volunteer_activism, 'Donasi'],
      [Icons.grid_view, 'Lainnya'],
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 14,
        childAspectRatio: 0.95,
        children: menu.map((m) {
          return MenuItem(
            icon: m[0] as IconData,
            label: m[1] as String,
            warnaBg: const Color(0xFFE6F2FC),
            onTap: () => _belumAda(m[1] as String),
          );
        }).toList(),
      ),
    );
  }

  Widget _judulBagian(String judul, {String? aksi}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(judul, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: biruTua)),
          if (aksi != null)
            InkWell(
              onTap: _bukaMutasi,
              child: Text(aksi, style: const TextStyle(color: biruIcon, fontWeight: FontWeight.w600)),
            ),
        ],
      ),
    );
  }

  // ---------- E-WALLET ----------
  Widget _listDompet() {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: daftarDompet.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final dompet = daftarDompet[i];
          return InkWell(
            onTap: () => _belumAda(dompet.nama),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: dompet.logo != null
                      ? Image.asset(dompet.logo!, fit: BoxFit.contain)
                      : Center(
                          // belum ada logo -> pakai teks warna brand
                          child: Text(
                            dompet.nama,
                            style: TextStyle(
                              color: Color(dompet.warna),
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 6),
                Text(dompet.nama, style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  // ---------- SLIDER KARTU PROMO ----------
  Widget _sliderPromo() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: daftarPromo.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final promo = daftarPromo[i];
          return Container(
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(promo.gambar, height: 120, width: 220, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(promo.judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Text(promo.info, style: const TextStyle(color: abuTeks, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ---------- 4 TRANSAKSI TERBARU ----------
  Widget _transaksiTerakhir() {
    final terbaru = semuaTransaksi.take(4).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          for (int i = 0; i < terbaru.length; i++) ...[
            ItemTransaksi(data: terbaru[i]),
            if (i != terbaru.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }

  // ---------- NAV BAWAH ----------
  Widget _navBawah() {
    return BottomNavigationBar(
      currentIndex: _tabAktif,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: biruIcon,
      unselectedItemColor: abuTeks,
      onTap: (i) {
        if (i == 1) {
          _bukaMutasi();
        } else if (i != 0) {
          _belumAda('ini');
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Mutasi'),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'QR'),
        BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}
