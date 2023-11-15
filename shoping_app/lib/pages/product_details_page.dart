import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/pages/cart_provider.dart';
// import 'package:shoping_app/pages/cart_provider.dart';
// import 'package:shoping_app/pages/global_variable.dart';
// import 'package:shoping_app/pages/global_variable.dart';
// import 'package:shoping_app/pages/global_variable.dart';
// import 'package:shoping_app/main.dart';
// import 'home_page.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // var selectedsize;
  // late Map<String, Object> product;
  // final Map<String, Object> product=products['sizes'] as Map<String,Object>;
  // late Map<String, Object> product;

  // List<int> sizeList = product['sizes'] as List<int>;
  // ignore: prefer_typing_uninitialized_variables
  int selectedsize = 0;
  void onTap() {
    if (selectedsize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'size': selectedsize,
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Select Size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Amazon',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Image(
            image: AssetImage('assets/images/3191.jpg'),
            height: 300,
          ),
          Expanded(
            child: Container(
              height: 100,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 247, 249, 1),
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Text('hello'),
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      // color: Colors.amber,
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['sizes'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List<int>)[index];
                            // if(product['size'] as List<int> == NULL)
                            if (widget.product['sizes'] == null) {
                              return const Text('Error ');
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedsize = size;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Chip(
                                    label: Text(size.toString()),
                                    backgroundColor: selectedsize == size
                                        ? Colors.amber
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 42.5)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber),
                            // minimumSize: const Size(double.infinity, 50)
                          ),
                          onPressed: onTap,
                          child: const Text('Add to cart')),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
