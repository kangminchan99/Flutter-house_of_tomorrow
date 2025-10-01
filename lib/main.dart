import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeService())],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House Of Tomorrow',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('House Of Tomorrow'))),
    );
  }
}
