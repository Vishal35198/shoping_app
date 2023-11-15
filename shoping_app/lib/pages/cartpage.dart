import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/pages/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // final List cart=[];
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<CartProvider>(context).cart);
    //  var yu=context.watch<CartProvider>();
    //  final List yu=Provider.of<CartProvider>(context).cart;
    // print(yu);
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart=context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My app'),
          backgroundColor: Colors.amber,
          actions: const [
            Icon(Icons.search),
          ],
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
              trailing: IconButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return  AlertDialog(
                    title: const Text("Delete Product"),
                    titleTextStyle: const TextStyle(fontSize: 20),
                    content: const Text('Are You Sure You want to Remove the product from your cart'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();}, child: const Text('NO',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)),
                      TextButton(onPressed: (){
                        Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                        Navigator.of(context).pop();
                      }, 
                      child: const Text('YES',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20,),)),
                    ],
                  );
                }
                );
              }, icon: const Icon(Icons.delete)),
              // final String abc=cartItem['title'];
              title: Text("${cartItem['title']}"),
              subtitle: Text("${cartItem['size']}"),
            );
          },
        ));
  }
}
