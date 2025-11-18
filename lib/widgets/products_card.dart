import 'package:flutter/material.dart';
import 'package:goalden_shop/screens/menu.dart';
import 'package:goalden_shop/screens/productslist_form.dart';
import 'package:goalden_shop/screens/product_entry_list.dart';
import 'package:goalden_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.
  final ItemHomepage item; 

  const ItemCard(this.item, {super.key}); 
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Color backgroundColor;
    if (item.name == "All Products") {
      backgroundColor = Colors.blue.shade200;
    } else if (item.name == "My Products") {
      backgroundColor = Colors.green.shade200;
    } else if (item.name == "Create Products") {
      backgroundColor = Colors.red.shade200;
    } else {
      backgroundColor = Colors.grey;
    }

    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: backgroundColor,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          if (item.name == "Create Products") {
             Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductsFormPage()));
          }
          else if (item.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                // Asumsi ProductEntryListPage diubah untuk menerima isFilterByUser: false (All)
                builder: (context) => const ProductEntryListPage(isFilterByUser: false)
              ),
            );
          }
          // --- MY PRODUCTS ---
          else if (item.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                // Asumsi ProductEntryListPage diubah untuk menerima isFilterByUser: true (My)
                builder: (context) => const ProductEntryListPage(isFilterByUser: true)
              ),
            );
          }
          else if (item.name == "Logout") {
            // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
            // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
            // If you using chrome,  use URL http://localhost:8000
            
            final response = await request.logout(
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message See you again, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(message),
                        ),
                    );
                }
            }
        }
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
