import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'warna.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livin\' UTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: biruIcon),
        useMaterial3: true,
      ),
      // di web (chrome) tampilan dibatasi selebar HP biar kelihatan rapi
      builder: (context, child) {
        return Container(
          color: const Color(0xFFD9DEE5),
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: child,
          ),
        );
      },
      home: const LoginScreen(),
    );
  }
}
