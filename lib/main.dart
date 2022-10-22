import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'temple_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //画面向き指定
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp, //縦固定
    ],
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final exDate = DateTime.now().toString().split(' ')[0];

    final year = exDate.split('-')[0];

    return MaterialApp(
      title: 'Temple',
      theme: ThemeData(brightness: Brightness.dark),
      home: TempleListScreen(year: year),
      debugShowCheckedModeBanner: false,
    );
  }
}
