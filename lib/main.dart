import 'package:flutter/material.dart';
import 'package:interview_tenacious/controllers/provider.dart';
import 'package:interview_tenacious/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ApiProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff59BEA6),
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff59BEA6),
              onPrimary: Colors.white,
              secondary: Color(0xff59BEA6),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.black,
              onBackground: Colors.black,
              surface: Colors.black,
              onSurface: Colors.black)),
      routes: {'/': (context) => HomePage()},
    );
  }
}
