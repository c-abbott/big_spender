import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_spender/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 245, 245, 250));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.black87);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark()
            .copyWith(useMaterial3: true, colorScheme: kDarkColorScheme),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: Colors.black87,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleMedium: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Proxima Nova'),
                bodySmall: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Proxima Nova',
                ),
              ),
        ),
        //themeMode: ThemeMode.dark,
        home: const Expenses(),
      ),
    );
  });
}
