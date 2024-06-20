import 'package:design_x/design_x.dart';
import 'package:example/home_page.dart';
import 'package:example/theme/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return XTheme(
      data: themeData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            primary: Colors.red,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
