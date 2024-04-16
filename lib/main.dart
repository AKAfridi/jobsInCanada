import 'package:flutter/material.dart';
import 'package:jobs_in_canada/Screens/home_screen.dart';
import 'package:jobs_in_canada/helper/adhelper.dart';

void main() {
  runApp(const MyApp());
  Adhelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            scrolledUnderElevation: 10,
            elevation: 10,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
            shadowColor: Colors.black54,
            backgroundColor: Color(0xff4f0000),
          ),
          listTileTheme: ListTileThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              tileColor: const Color(0xff4f0000),
              textColor: Colors.white,
              iconColor: Colors.white),
          cardTheme: const CardTheme(elevation: 10, shadowColor: Colors.black),
          scaffoldBackgroundColor: Colors.white60,
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff4f0000), elevation: 20)),
      home: const HomeScreen(),
    );
  }
}
