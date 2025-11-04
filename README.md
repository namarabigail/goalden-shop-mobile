# Tugas Individu PBP Semester Ganjil 2025/2026
Abigail Namaratonggi P - 2406495773 - PBP C

<details>
<summary>Tugas 7: Elemen Dasar Flutter</summary> 

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur yang menggambarkan bagaimana widget saling berhubungan dalam aplikasi Flutter. Setiap widget bisa menjadi parent yang memiliki satu atau beberapa child, dan setiap child akan mengikuti properti atau aturan dari parent-nya. Parent widget bertanggung jawab mengatur tata letak, posisi, serta gaya dari child widget-nya. Hubungan parent-child ini membuat Flutter bisa membangun tampilan secara terstruktur, di mana perubahan pada satu widget bisa memengaruhi tampilan keseluruhan aplikasi dengan cara yang efisien dan rapi.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
* **Scaffold**: Widget utama yang berfungsi sebagai kerangka dasar tampilan aplikasi.
* **AppBar**: widget yang muncul di bagian atas halaman dan berisi elemen seperti judul atau tombol navigasi. Pada aplikasi saya, AppBar menampilkan teks GOALDENSHOP
* **InfoCard**: Widget custom yang menampilkan informasi penting seperti NPM, nama, dan kelas.
* **ItemCard**: Widget custom yang digunakan untuk menampilkan tombol berupa kartu dengan warna berbeda. Dalma apliaksi saya, widget ini digunakan untuk menampilkan tombol All Products, My Products, dan Create Products.
* **SnackBar**: Widget yang menampilkan pesan singkat di bagian bawah layar. Fungsinya untuk memberi feedback ke pengguna setelah suatu aksi dilakukan, seperti ketika tombol ditekan.

### 3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp berfungsi sebagai kerangka utama aplikasi Flutter yang menggunakan konsep Material Design. Widget ini mengatur tema, judul, navigasi, dan halaman awal aplikasi. Pada aplikasi saya, MaterialApp digunakan di main.dart untuk menampilkan halaman MyHomePage() dengan tema warna biru. Widget ini sering dijadikan root karena sudah mengatur banyak fitur dasar seperti navigasi antarhalaman, animasi, dan pengaturan tampilan default aplikasi.

### 4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
StatelessWidget adalah widget yang tidak memiliki state. Widget ini tidak dapat diubah setelah dibuat, artinya perubahan apa pun pada variabel, ikon, tombol, atau pengambilan data tidak dapat mengubah status aplikasi. StatelessWidget ocok dipakai jika tampilan tidak perlu update otomatis setelah event, misal logo, icon, dan lainnya. Sedangkan StatefulWidget adalah widget yang memiliki state, sehingga statusnya dapat diubah setelah dibuat. State-nya bisa diupdate berkali-kali (misalnya karena user input, animasi, atau data baru). StatefulWidget cocok dipakai jika tampilan bergantung dengan data yang bisa berubah, misal form input, tombol counter, dan lainnya.

### 5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang digunakan Flutter untuk memberikan informasi tentang posisi suatu widget di dalam widget tree. Setiap widget di Flutter memiliki BuildContext masing-masing yang berfungsi sebagai referensi lokasi widget tersebut dalam hierarki aplikasi. BuildContext penting karena digunakan untuk mengatur konfigurasi widget, mengambil data tema aplikasi, melakukan navigasi antarhalaman, serta mengakses data lokal atau state dari widget lain.
Dalam metode build(), BuildContext digunakan agar widget dapat menyesuaikan tampilan atau perilakunya berdasarkan lingkungannya, misal untuk mengambil warna tema, ukuran layar, atau memanggil SnackBar.

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload di Flutter memungkinkan developer melihat hasil perubahan kode secara instan tanpa menjalankan ulang seluruh aplikasi. Proses ini hanya mengirim bagian kode yang berubah ke Dart VM dan memperbarui widget tree tanpa menghapus state aplikasi. Fitur ini sangat cepat dan ideal untuk mengubah tampilan atau memperbaiki bug. Sedangkan hot restart memuat ulang seluruh aplikasi dari awal dan menghapus semua state yang sedang berjalan. Hot reload mempertahankan state untuk perubahan kecil, sedangkan hot restart menghapus state untuk perubahan besar pada struktur aplikasi.

</details>