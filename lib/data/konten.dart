// Data dummy buat banner, kartu promo, dan e-wallet

class BannerPromo {
  final String gambar;
  final String judul;
  final String subjudul;

  const BannerPromo(this.gambar, this.judul, this.subjudul);
}

const daftarBanner = [
  BannerPromo('assets/images/banner_food.jpg', 'Pesan Makan Lebih Hemat', 'Diskon hingga 50% di resto lokal pilihan'),
  BannerPromo('assets/images/banner_shop.jpg', 'Belanja Online Cashback 20%', 'Bayar pakai Livin\' tiap tanggal 25'),
  BannerPromo('assets/images/banner_travel.jpg', 'Liburan Akhir Tahun', 'Cicilan 0% untuk tiket dan hotel'),
  BannerPromo('assets/images/banner_promo.jpg', 'Hidup Sehat Mulai Hari Ini', 'Promo katering sehat khusus nasabah'),
];

class Promo {
  final String gambar;
  final String judul;
  final String info;

  const Promo(this.gambar, this.judul, this.info);
}

const daftarPromo = [
  Promo('assets/images/card_coffee.jpg', 'Ngopi Hemat', 'Beli 1 gratis 1 sampai 30 Nov'),
  Promo('assets/images/card_cinema.jpg', 'Nonton Bioskop', 'Diskon Rp25.000 tiap Rabu'),
  Promo('assets/images/card_travel.jpg', 'Tiket Pesawat', 'Cashback hingga Rp300.000'),
  Promo('assets/images/card_invest.jpg', 'Mulai Investasi', 'Reksadana mulai dari Rp10.000'),
];

class Dompet {
  final String nama;
  final int warna; // warna brand, format 0xFFRRGGBB
  final String? logo; // kalau null, nanti pakai teks nama

  const Dompet(this.nama, this.warna, [this.logo]);
}

const daftarDompet = [
  Dompet('GoPay', 0xFF00AED6, 'assets/logos/gopay.png'),
  Dompet('OVO', 0xFF4C2A86),
  Dompet('DANA', 0xFF118EEA),
  Dompet('ShopeePay', 0xFFEE4D2D),
  Dompet('LinkAja', 0xFFE82529, 'assets/logos/linkaja.png'),
];
