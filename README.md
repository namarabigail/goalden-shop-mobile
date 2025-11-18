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

<details>
<summary>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</summary>

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?
Membuat model Dart (seperti ProductEntry) sangat penting karena Dart adalah bahasa yang ketat dalam hal tipe (type-safe), sementara data JSON dari web itu tidak punya tipe (untyped). Contohnya, jika kita pakai Map<String, dynamic> tanpa model, kita tidak dapat memastikan apakah data['price'] itu berupa int atau String. Jika ada field yang salah tipe, aplikasi dapat crash saat sedang berjalan. Dengan model, kita mengubah data JSON menjadi objek Dart yang jelas tipe datanya (int price;, String? size;), sehingga menghindari adanya error saat aplikasi berjalan.
 
### 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
* Package `http`: Pondasi dasar di Flutter untuk melakukan GET, POST, dll. `http` hanya mengirim dan menerima data mentah.
* `CookieRequest`: Dirancang untuk mengatasi kerumitan autentikasi berbasis Sesi/Cookie Django. `CookieRequest` secara otomatis mengambil session cookie dan CSRF token setelah login berhasil, lalu melampirkan keduanya di setiap permintaan POST/GET berikutnya.

### 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest harus dibagikan menggunakan Provider karena instance ini bertindak sebagai penyimpan status sesi (session state) pengguna yang login.
* Objek ini menyimpan cookie otentikasi yang krusial.
* Setiap widget yang perlu memverifikasi status login (misal: tombol "Logout") atau mengambil data terotentikasi (misal: ProductEntryListPage saat mode 'My Products') harus menggunakan instance yang sama.
* Dengan Provider, kita menghindari widget harus mencari atau membuat ulang cookie di setiap layar, yang meningkatkan efisiensi dan skalabilitas aplikas
 
### 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Komunikasi Flutter dan Django membutuhkan konfigurasi keamanan dan jaringan yang spesifik untuk mengatasi masalah cross-origin. Agar Android Emulator dapat terhubung ke server Django yang berjalan di PC sayayes, IP khusus 10.0.2.2 harus ditambahkan ke ALLOWED_HOSTS. Kebijakan CORS (Cross-Origin Resource Sharing) harus diaktifkan di Django, dan izin akses internet diperlukan di Android untuk memungkinkan request jaringan. Konfigurasi SameSite pada cookie juga wajib diatur agar session cookie dan CSRF token dapat dikirim dan diakui oleh Django, menjaga status autentikasi pengguna. Jika konfigurasi ini gagal, aplikasi tidak akan dapat login, mengirim data, atau mengambil item yang difilter, karena request akan diblokir oleh browser atau Django.

### 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. User melengkapi formulir pada ProductsFormPage. Saat tombol "Save" ditekan, validasi formulir diaktifkan. Data dari state formulir (seperti name, price, description, dll.) kemudian dikumpulkan dan di-encode menjadi format JSON.
2. JSON dikirimkan ke endpoint Django `/create-flutter/` melalui `request.postJson()`.
3. View Django menerima request POST. Body JSON di-decode, dan data field diekstrak. Objek model baru (Product atau sejenisnya) kemudian dibuat dan diasosiasikan dengan pengguna yang sedang login (`user = request.user`)
4. Objek product baru disimpan ke database (`new_product.save()`).
5. Setelah sukses, user diarahkan ke `ProductEntryListPage`. `FutureBuilder` di halaman ini memanggil `fetchProducts` yang memanggil endpoint `/json/` atau `/json-user`.
6. Django merespons dengan list JSON yang di-serialize. Kemudian, Flutter mengubah JSON itu kembali menjadi object ProductEntry (`ProductEntry.fromJson`) dan menampilkannya di `GridView.builder` menggunakan ProductEntryCard.
 
### 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
* **Register**: User mengirimkan data akun ke `/auth/register/`. Django view register akan memvalidasi apakah username dan password sesuai. Jika berhasil, user baru dibuat.
* **Login**: User ngirim username dan password ke `/auth/login/` melalui `request.login()`. Django memvalidasi kredensial, dan jika valid, Django membuat Sesi dan mengirimkan kembali session cookie. 
* CookieRequest pada Flutter menerima dan menyimpan session cookie tersebut. Status `request.loggedIn` diatur menjadi `True`.
* **Akses Terotentikasi**: Setiap `request.get()` atau `request.postJson()` yang dilakukan otomatis membawa cookie yang disimpan, sehingga Django mengenali kita sebagai `request.user`.
* **Logout**: User menekan tombol `Logout` di drawer. Flutter mengirimkan request ke `/auth/logout/`. Django view logout memanggil `auth_logout(request)` yang menghancurkan Sesi di database. Flutter menghapus cookie lokal dan user di-redirect ke LoginPage.
 
### 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
* Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Saya memastikan bahwa server berjalan, koneksi database aktif, dan endpoint dasar seperti `/json/` dapat diakses. Selanjutnya, saya mengonfigurasi Django untuk interaksi `cross-origin` dengan Flutter, yaitu dengan menginstal `django-cors-headers` dan mengatur variabel di settings.py seperti `CORS_ALLOW_ALL_ORIGINS = True` dan cookie settings (`CSRF_COOKIE_SAMESITE = 'None'`, dll.).
* Saya mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter menggunakan package         `pbp_django_auth` dan `provider`. Di `main.dart`, saya membungkus aplikasi dengan Provider untuk membagikan instance CookieRequest ke seluruh widget tree. Selanjutnya, saya membuat halaman login (`login.dart`) dan mengimplementasikan fitur registrasi akun (`register.dart`). Kedua halaman ini menggunakan method spesifik dari CookieRequest (seperti `request.login()` dan `request.postJson()`). Tombol `Logout` ditambahkan di left_drawer.dart dan memanggil `request.logout()`, yang kemudian menghancurkan sesi di Django dan me-redirect pengguna ke halaman login
* Setelah login berfungsi, saya membuat halaman yang berisi daftar semua item di Product Entry List Page. Halaman ini bersifat stateful dan menggunakan FutureBuilder untuk memanggil fungsi fetchProducts yang mengambil data dari endpoint JSON. Untuk memenuhi persyaratan tampilan (grid layout dan dynamic filtering), saya mengubah widget utama body menjadi Column yang menampung:
    * Filter Bar: Saya menggunakan SegmentedButton yang mengubah state internal (_currentFilter = 'all' atau 'user') saat diklik.
    * Product Grid: Saya mengganti ListView.builder dengan GridView.builder untuk menampilkan ProductEntryCard yang berisi name, price, thumbnail, dan is_featured.
* Saya melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
* Saya membuat halaman detail untuk setiap item yang dapat diakses dengan menekan Product Entry Card. Halaman ini menampilkan seluruh atribut dari model item yang dilewatkan. Saya menambahkan tombol untuk kembali ke halaman daftar item yang berfungsi menggunakan `Navigator.pop(context)`.
</details>