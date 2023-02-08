import 'package:flutter/material.dart';
import 'package:flutter_app_films/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Films',
      initialRoute: "home",
      routes: {
     "home": (_) =>  const HomeScreen(),
     "details": (_) => const DetailsScreen()


      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color:Colors.purpleAccent,
        )
      )
    );
  }
}