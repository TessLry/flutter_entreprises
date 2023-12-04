import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_entreprises/blocs/company_cubit.dart';
import 'package:flutter_entreprises/router.dart';

void main() {
  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit();

  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
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
      routes: AppRouter.routes,
      initialRoute: AppRouter.homePage,
      debugShowCheckedModeBanner: false,
    );
  }
}
