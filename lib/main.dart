import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tiktok_clone/config/config.dart';
import 'package:tiktok_clone/infraestructure/infraestructure.dart';
import 'package:tiktok_clone/presentation/providers/providers.dart';
import 'package:tiktok_clone/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl(videosDataSource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        // Lazy loading by default
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage()
        )
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}