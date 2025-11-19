import 'package:flutter/material.dart';
import 'package:goalden_shop/models/product_entry.dart';
import 'package:goalden_shop/widgets/left_drawer.dart';
import 'package:goalden_shop/screens/product_detail.dart';
import 'package:goalden_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool isFilterByUser;
  const ProductEntryListPage({super.key, this.isFilterByUser = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late String _currentFilter;
  @override
  void initState() {
    super.initState();
    _currentFilter = widget.isFilterByUser ? 'user' : 'all';
  }

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    String url;
    const String baseUrl = 'http://localhost:8000/'; 
    
    if (_currentFilter == 'user') {
      url = '${baseUrl}json-user/'; 
    } else {
      url = '${baseUrl}json/'; 
    }

    final response = await request.get(url);
    // Decode response to json format
    var data = response;
    
    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final String pageTitle = _currentFilter == 'user'
        ? 'My Products' 
        : 'All Products';

    return Scaffold(
        appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SegmentedButton<String>(
              // Value saat ini
              selected: <String>{_currentFilter},
              // Pilihan yang tersedia
              segments: const <ButtonSegment<String>>[
                ButtonSegment(
                  value: 'all', 
                  label: Text('All'), 
                  icon: Icon(Icons.list)),
                ButtonSegment(
                  value: 'user', 
                  label: Text('My'), 
                  icon: Icon(Icons.person)),
              ],
              // Aksi saat tombol diklik
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  // Ubah state filter dan panggil ulang FutureBuilder
                  _currentFilter = newSelection.first;
                });
              },
            ),
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in goaldenshop yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}