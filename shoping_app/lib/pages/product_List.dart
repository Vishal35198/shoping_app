import 'package:flutter/material.dart';
import 'package:shoping_app/pages/global_variable.dart';
import 'package:shoping_app/pages/product_card.dart';
import 'package:shoping_app/pages/product_details_page.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
    final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  // var filter;
  // ignore: prefer_typing_uninitialized_variables
  var selectedFilter;
  @override
    void initState() { 
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
        const border = OutlineInputBorder(
        borderSide: BorderSide(color:Colors.grey),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Shoes Collection ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                //to occupy the remaing screen
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                      //it is change d
                    },
                    child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Colors.amber
                            :  const Color.fromRGBO(217,217,214,0.5),
                        label: Text(filter),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                );
              },
            ),
          ),
          Expanded(
            // width: double.infinity,
            // height: 200,
            // color: Colors.purple,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return ProductDetailPage(product: product);
                      })
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    bgcolor: index.isEven ? const Color.fromRGBO(37, 150, 190,0.2) : const Color.fromRGBO(217,217,214,0.5)
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}