import 'package:flutter/material.dart';
import 'package:ilabtest/view/pages/exchange_view_page.dart';
import 'package:ilabtest/view_model/currency_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CurrenryViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 0, 120, 240),
              titleTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 0, 120, 240)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 120, 240)),
          useMaterial3: true,
        ),
        home: const ExchangeViewPage(),
      ),
    );
  }
}
