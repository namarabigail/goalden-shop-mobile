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

<details>
<summary>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</summary>

### 1.  Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() digunakan untuk menambahkan halaman baru ke atas stack navigasi, sehingga pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol back. Sedangkan, Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru, sehingga halaman sebelumnya tidak bisa kembali karena sudah dihapus dari stack. 

Pada aplikasi saya, Navigator.push() cocok digunakan ketika berpindah ke halaman seperti Create Product, karena setelah mengisi form, pengguna mungkin ingin kembali ke halaman sebelumnya. Sedangkan Navigator.pushReplacement() lebih cocok untuk navigasi dari drawer ke halaman Home, karena halaman Home dianggap sebagai halaman utama sehingga tidak perlu kembali ke halaman drawer sebelumnya.

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Pada aplikasi saya, widget Scaffold digunakan sebagai struktur dasar setiap halaman karena menyediakan kerangka tampilan yang konsisten. Di dalam Scaffold, saya menggunakan AppBar sebagai header untuk menampilkan judul halaman, sehingga pengguna dapat dengan mudah mengenali halaman yang sedang dibuka. Selain itu, saya juga memanfaatkan Drawer untuk menyediakan menu navigasi di sisi kiri aplikasi, sehingga pengguna dapat berpindah antarhalaman dengan lebih mudah.

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Pada halaman form, saya menggunakan widget SingleChildScrollView untuk memastikan seluruh elemen form tetap dapat dilihat dan diakses meskipun jumlah input yang ditampilkan cukup banyak sehingga pengguna tetap dapat melakukan scroll ke bawah tanpa terjadi overflow pada layar. Selain itu, setiap field input saya bungkus menggunakan widget Padding, sehingga terdapat jarak yang membuat tampilan form terlihat lebih rapi dan nyaman dilihat. Saya juga menggunakan ListView untuk menampilkan data yang berbentuk daftar, seperti daftar produk, agar elemen-elemen tersebut tersusun secara vertikal dan dapat discroll dengan mudah.

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Pada aplikasi saya, saya menyesuaikan warna tema dengan menggunakan widget ThemeData di bagian MaterialApp. Dengan ThemeData, saya mengatur warna utama (primaryColor), warna teks, serta gaya tipografi (textTheme) agar tampilan aplikasi memiliki theme yang seragam. Selain itu, elemen seperti AppBar, tombol, dan icon juga disesuaikan menggunakan warna yang sama, sehingga visual aplikasi tetap konsisten di setiap halaman.

</details>