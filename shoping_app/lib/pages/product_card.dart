import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final Color bgcolor;
  const ProductCard({super.key, required this.title, required this.price, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // color: bgcolor,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgcolor,
            border: Border.all(), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '$price',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
               const SizedBox(
                // color: Colors.blueAccent,
                  height: 250,
                  child: Center(
                      child:
                          Image(image: NetworkImage('https://i.ibb.co/y45p7xK/3191-removebg-preview.png'))))
            ],
          ),
        ),
      ),
    );
  }
}
