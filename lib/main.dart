import 'package:chisel/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Services/Database Services/notes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Chisel services
  await NotesService().ensureInitialized();

  // Run Chisel
  runApp(const ChiselApp());
}

class ChiselApp extends StatelessWidget {
  const ChiselApp({super.key});

  final ColorScheme darkScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff53595D),
    onPrimary: Color(0xffF05D5E),
    secondary: Color(0xff53595D),
    onSecondary: Color(0xffFF66B3),
    error: Color(0xff4C5C68),
    onError: Color(0xffCAD178),
    surface: Color(0xff3A3C40),
    onSurface: Color(0xffFFE8E8),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chisel',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xffBD7979),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          useMaterial3: true,
          bottomAppBarTheme: BottomAppBarTheme(color: darkScheme.primary),
          iconTheme: IconThemeData(color: darkScheme.onPrimary),
        textTheme: TextTheme(
            headlineSmall: TextStyle(
                color: darkScheme.onPrimary,
                fontWeight: FontWeight.bold
            ),
          bodyMedium: TextStyle(
            color: darkScheme.onSurface
          )
        )
      ),
      home: const HomeScreen(),
    );
  }
}