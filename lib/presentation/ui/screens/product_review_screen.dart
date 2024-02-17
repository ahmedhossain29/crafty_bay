import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (context, index) {
            return const ListTile(
              trailing: Icon(Icons.person),
              title: Text('Customer Name'),
              subtitle: Text('Product Details'),
            );
          }),
        ],
      ),
    );
  }
}
