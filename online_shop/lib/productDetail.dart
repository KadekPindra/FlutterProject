import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, String> product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gambar Produk
            Image.asset(
              product['image']!,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            // Nama Produk
            Text(
              product['name']!,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            // Deskripsi Produk
            Text(
              product['description']!,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
