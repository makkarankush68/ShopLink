import 'package:flutter/material.dart';
import 'package:kmdha/constant/const.dart';
import 'package:kmdha/ui/screens/login_screen.dart';
import 'package:kmdha/ui/screens/home_screen.dart';

 
class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
