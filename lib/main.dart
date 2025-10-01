import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/src/view/shopping/shopping_view.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeService())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'House Of Tomorrow',
      theme: context.themeService.themeData,
      debugShowCheckedModeBanner: false,
      home: const ShoppingView(),
    );
  }
}
