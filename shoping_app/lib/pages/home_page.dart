// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoping_app/pages/cartpage.dart';
import 'package:shoping_app/pages/product_List.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int currentPage=0;
  List<Widget> pages =const [
    ProductList(),
     Cart()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.amber,
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        items: const [
        BottomNavigationBarItem(icon:Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: '')
      ]),
        body: pages[currentPage]
    );
  }
}
