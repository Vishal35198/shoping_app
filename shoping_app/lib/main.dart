import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/pages/cart_provider.dart';
// import 'package:shoping_app/pages/global_variable.dart';
import 'package:shoping_app/pages/home_page.dart';
// import 'package:shoping_app/pages/home_page.dart';
// import 'package:shoping_app/pages/product_details_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            ),
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            textTheme: const TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            useMaterial3: true),
        home: const Homepage(),
      ),
    );
  }
}
