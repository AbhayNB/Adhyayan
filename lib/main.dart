import 'package:adhyayan/screens/main_screen.dart';
import 'package:adhyayan/screens/login.dart';
import 'package:adhyayan/screens/splash_screen.dart';
// import 'package:adhyayan/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 47, 53, 236),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          theme: theme,
          home: auth.isAuth ? SplashScreen() : LoginScreen(),
        ),
      ),
    );
  }
}
