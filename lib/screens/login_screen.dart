import 'package:flutter/material.dart';

import '../warna.dart';
import '../widgets/menu_item.dart';
import 'dashboard_screen.dart';

// halaman pertama (sebelum login)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _masukDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF63B3EC), Color(0xFF3D9AE8), Color(0xFF2A6FBF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _bagianLogo(),
              Expanded(child: _bagianPromo()),
              _kartuPesanMakan(),
              _menuCepat(),
              _tombolLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bagianLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12, left: 70),
                child: Text(
                  'Geser untuk Intip Saldo',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.phone_in_talk, size: 16, color: biruIcon),
                    SizedBox(width: 4),
                    Text('Call', style: TextStyle(color: biruIcon, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Icon(Icons.keyboard_double_arrow_down, color: Colors.white, size: 30),
          const SizedBox(height: 4),
          const Text(
            "livin'",
            style: TextStyle(
              color: Colors.white,
              fontSize: 62,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              height: 1,
              letterSpacing: -2,
            ),
          ),
          const Text(
            'by mandiri',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // gambar makanan + label oranye/kuning
  Widget _bagianPromo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset('assets/images/banner_food.jpg', fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _label('Kini di Livin\'', kuning, biruTua),
                _label('Bisa Pesan Makanan', const Color(0xFFF2711C), Colors.white),
                _label('dengan Livin\' Food', const Color(0xFF63B3EC), Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String teks, Color bg, Color warnaTeks) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      color: bg,
      child: Text(
        teks,
        style: TextStyle(color: warnaTeks, fontSize: 15, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _kartuPesanMakan() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: biruTua,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesan Makan? Livin\' Food Aja',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  'Mudah, hemat, dan banyak resto lokal!',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_forward, color: biruTua, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _menuCepat() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
      color: Colors.white24,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MenuItem(icon: Icons.contactless, label: 'e-money', warnaIcon: kuning, warnaLabel: Colors.white),
          ),
          Expanded(
            child: MenuItem(icon: Icons.bolt, label: 'Quick Pick', warnaLabel: Colors.white),
          ),
          Expanded(
            child: MenuItem(icon: Icons.qr_code_scanner, label: 'QR Bayar', warnaLabel: Colors.white),
          ),
          Expanded(
            child: MenuItem(
              icon: Icons.qr_code_2,
              label: 'QR Terima Transfer',
              warnaLabel: Colors.white,
              badge: 'BARU',
            ),
          ),
          Expanded(
            child: MenuItem(icon: Icons.atm, label: 'Setor Tarik', warnaLabel: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _tombolLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          onPressed: () => _masukDashboard(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: biruTua,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          icon: const Icon(Icons.face_retouching_natural, size: 26),
          label: const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
