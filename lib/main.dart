import 'package:flutter/material.dart';

import 'package:tiktok_clone/config/config.dart';
import 'package:tiktok_clone/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const DiscoverScreen(),
    );
  }
}