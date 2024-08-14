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
          dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              fillColor: Colors.black,
            ),
            menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            labelLarge: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          scaffoldBackgroundColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(16)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ))),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            splashColor: Colors.black,
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 120, 240)),
          listTileTheme: ListTileThemeData(
            tileColor: const Color.fromARGB(137, 46, 46, 46),
            textColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
          ),
          useMaterial3: true,
        ),
        home: const ExchangeViewPage(),
      ),
    );
  }
}
