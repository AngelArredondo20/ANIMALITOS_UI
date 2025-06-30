import 'package:animalitos_ui/providers/authentication_user.dart';
import 'package:animalitos_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './themes/theme.dart';
import './screens/login_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'App con Tema y Rutas',
        theme: AppTheme.lightTheme,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage()
        },
      ),
    );
  }
}
