import 'package:flutter/material.dart';
import 'package:flutter_entreprises/ui/screens/home.dart';
import 'package:flutter_entreprises/ui/screens/add_company.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/add_company': (context) => AddCompany(),
      },
      initialRoute: '/home',
      //home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
