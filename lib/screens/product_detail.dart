import 'package:flutter/material.dart';
import 'package:goalden_shop/models/product_entry.dart'; 

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  static const String djangoBaseUrl = 'http://localhost:8000'; 

  const ProductDetailPage({super.key, required this.product});

  Widget _buildDetailRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.0,
                color: color ?? Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String imageUrl = product.thumbnail.isNotEmpty
        ? '$djangoBaseUrl/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}' 
        : ''; 
    
    final String brandText = product.brand.isNotEmpty ? product.brand : 'N/A';
    final String sellerText = product.userUsername.isNotEmpty 
        ? product.userUsername 
        : 'Anonymous Seller';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Thumbnail Image 
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey[200],
                child: const Center(
                  child: Text('No Image Available', style: TextStyle(color: Colors.grey)),
                ),
              ),

            // Product Details Content 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //  Featured Badge 
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        '✨ Featured Product',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  //  Name & ID 
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Seller: ${product.userUsername}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color.fromARGB(255, 5, 24, 133),
                    ),
                  ),
                  const SizedBox(height: 8),

                  //  Price 
                  Text(
                    'IDR ${product.price.toString()}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 24, 133),
                    ),
                  ),
                  const SizedBox(height: 16),

                  //  Detail Section: All Attributes 
                  const Text('Detail Atribut Lengkap:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),

                  _buildDetailRow('Seller', sellerText),
                  _buildDetailRow('Brand', brandText),
                  _buildDetailRow('Category', product.category[0].toUpperCase() + product.category.substring(1)),
                  _buildDetailRow('Size', product.size ?? 'Universal / N/A'),
                  _buildDetailRow('Stock', product.stock.toString()),
                  _buildDetailRow(
                    'Rating', 
                    '${product.rating.toStringAsFixed(1)} / 5.0', 
                    color: product.rating >= 4.0 ? Colors.orange.shade700 : null
                  ),
                  _buildDetailRow('Featured', product.isFeatured ? 'Yes' : 'No'),
                  
                  const SizedBox(height: 16),
                  const Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),

                  //  Description 
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 32),

                  // Tombol Kembali 
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Kembali ke halaman sebelumnya (Halaman Daftar Item)
                        Navigator.pop(context); 
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali ke Daftar Item', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}