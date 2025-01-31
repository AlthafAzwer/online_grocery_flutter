import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; 

void main() {
  runApp(OnlineGroceryApp());
}

class OnlineGroceryApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Grocery App',
          theme: ThemeData(
            brightness: Brightness.light,
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),  
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[700],
            ),
          ), 
          themeMode: currentMode,  
          home: LoginScreen(themeNotifier: _themeNotifier), 
        );
      },
    );
  }
}
