import 'package:flutter/material.dart';

import '../warna.dart';

// ikon bulat + label di bawahnya, dipakai di login & dashboard
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color warnaIcon;
  final Color warnaLabel;
  final Color warnaBg;
  final String? badge; // contoh: "BARU"
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.warnaIcon = biruIcon,
    this.warnaLabel = Colors.black87,
    this.warnaBg = Colors.white,
    this.badge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: warnaBg, shape: BoxShape.circle),
                child: Icon(icon, color: warnaIcon, size: 28),
              ),
              if (badge != null)
                Positioned(
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: hijau,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(color: warnaLabel, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
