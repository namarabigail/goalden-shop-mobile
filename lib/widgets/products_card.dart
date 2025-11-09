import 'package:flutter/material.dart';
import 'package:goalden_shop/screens/menu.dart';
import 'package:goalden_shop/screens/productslist_form.dart';

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.
  final ItemHomepage item; 

  const ItemCard(this.item, {super.key}); 
  @override
  Widget build(BuildContext context) {
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
        onTap: () {
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
