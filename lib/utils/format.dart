const namaBulan = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

// 50482317 -> "50.482.317"
String rupiah(int angka) {
  return angka.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
}

// DateTime(2026, 11, 5) -> "05 Nov 2026"
String tanggalPendek(DateTime tgl) {
  final hari = tgl.day.toString().padLeft(2, '0');
  final bulan = namaBulan[tgl.month - 1].substring(0, 3);
  return '$hari $bulan ${tgl.year}';
}
