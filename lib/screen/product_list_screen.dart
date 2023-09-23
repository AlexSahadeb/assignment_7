import 'package:assingment_7/screen/cart_page.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 15),
    Product(name: 'Product 4', price: 20),
    Product(name: 'Product 5', price: 25),
    Product(name: 'Product 6', price: 10),
    Product(name: 'Product 7', price: 30),
    Product(name: 'Product 8', price: 40),
    Product(name: 'Product 9', price: 22),
    Product(name: 'Product 10', price: 15),
    Product(name: 'Product 11', price: 18),
    Product(name: 'Product 12', price: 60),
    Product(name: 'Product 13', price: 40),
    Product(name: 'Product 14', price: 50),
    Product(name: 'Product 15', price: 30),
  ];

  int cartTotal = 0;

  void addToCart(Product product) {
    setState(() {
      product.incrementCounter();
      if (product.counter == 5) {
        _showCongratulationsDialog(product.name);
      }
      cartTotal++;
    });
  }

  void _showCongratulationsDialog(String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: Text('You\'ve bought 5 $productName!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void goToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartTotal: cartTotal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing:
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(product.counter.toString()),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          addToCart(product);
                        },
                      ),
                    ],
                  ),
                  );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            goToCartPage();
          },
          child: const Text('Go to Cart'),
        ),
      ],
    );
  }
}
