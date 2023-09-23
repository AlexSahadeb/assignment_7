import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int cartTotal;

  const CartPage({super.key, required this.cartTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products: $cartTotal'),
      ),
    );
  }
}
