import 'package:flutter/material.dart';
import 'package:goalden_shop/widgets/left_drawer.dart';

class ProductsFormPage extends StatefulWidget {
    const ProductsFormPage({super.key});

    @override
    State<ProductsFormPage> createState() => _ProductsFormPageState();
}

class _ProductsFormPageState extends State<ProductsFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int? _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey"; // default
  bool _isFeatured = false;
  int? _stock = 0;
  double? _rating = 0.0;
  String _size = "";
  String _brand = "";

  final List<String> _categories = [
    'jersey',
    'sepatu',
    'bola',
    'aksesoris',
    'merchandise',
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Product Form',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer:LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                // === Name ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Price ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Harga Produk (IDR)",
                      labelText: "Harga",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.tryParse(value ?? ''); 
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                      }
                      
                      final int? parsedValue = int.tryParse(value);

                      if (parsedValue == null) {
                        return "Harus berupa angka integer."; // Harus integer
                      }

                      if (parsedValue < 1) { 
                        return "Harga harus lebih besar dari 0!"; // Tidak boleh negatif/nol (PositiveIntegerField)
                      }
                      
                      return null;
                    },
                  ),
                ),

                // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Deskripsi Produk",
                      labelText: "Deskripsi Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi produk tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail (opsional)",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "URL tidak boleh kosong!";
                      }

                      if (!value.startsWith("http://") && !value.startsWith("https://")) { 
                        return "URL tidak valid";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Kategori",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(
                                  cat[0].toUpperCase() + cat.substring(1)),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                  ),
                ),

                // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Tandai sebagai Produk Unggulan"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),

                // === Stock ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number, // Hanya mengizinkan input angka
                    decoration: InputDecoration(
                      hintText: "Jumlah Stok",
                      labelText: "Stok",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _stock = int.tryParse(value ?? '');
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Stok tidak boleh kosong!";
                      }
                      
                      final int? parsedValue = int.tryParse(value);

                      if (parsedValue == null) {
                        return "Harus berupa angka integer."; // Harus integer
                      }

                      if (parsedValue < 0) { 
                        return "Stok tidak boleh negatif!"; // Tidak boleh negatif (PositiveIntegerField)
                      }
                      
                      return null;
                    },
                  ),
                ),

                // === Rating ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Rating Produk (0.0 - 5.0)",
                      labelText: "Rating",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _rating = double.tryParse(value ?? ''); 
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Rating tidak boleh kosong!"; // Tidak boleh kosong
                      }
                      
                      final double? parsedValue = double.tryParse(value);

                      if (parsedValue == null) {
                        return "Harus berupa angka (misal: 4.5)."; // Harus float
                      }

                      // Cek range
                      if (parsedValue < 0.0 || parsedValue > 5.0) { 
                        return "Rating harus antara 0.0 hingga 5.0.";
                      }
                      return null;
                    },
                  ),
                ),

                // === Size ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Ukuran Produk (Maks 10 Karakter)",
                      labelText: "Size",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _size = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Ukuran tidak boleh kosong!";
                      }
                      
                      if (value.length > 10) { 
                        return "Ukuran tidak boleh melebihi 10 karakter!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Brand ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Merek Produk",
                      labelText: "Brand",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _brand = value ?? '';
                      });
                    },
                    validator: (String? value) { 
                      if (value == null || value.isEmpty) {
                        return "Brand tidak boleh kosong!";
                      }
                      
                      if (value.length > 100) { 
                        return "Brand tidak boleh melebihi 100 karakter!"; // Cek Panjang String Maksimum
                      }
                      return null; 
                    },
                  ),
                ),

                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Produk berhasil disimpan!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nama: $_name'),
                                      Text('Harga: $_price'),
                                      Text('Deskripsi: $_description'),
                                      Text('Thumbnail: ${_thumbnail.isEmpty ? "Tidak Ada" : _thumbnail}'),
                                      Text('Kategori: $_category'),
                                      Text('Is Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
                                      Text('Stok: $_stock'),
                                      Text('Rating: $_rating'),
                                      Text('Ukuran: ${_size.isEmpty ? "N/A" : _size}'),
                                      Text('Brand: ${_brand.isEmpty ? "N/A" : _brand}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      );
  }
}