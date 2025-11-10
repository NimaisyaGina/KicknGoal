# kickngoal

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# KicknGoal

Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
--> Widget tree pada Flutter adalah struktur hierarki di mana widget induk mengatur tata letak dan pengaturan widget anak. Widget induk seperti Column atau Row mengatur posisi widget anak, sementara widget anak dapat mewarisi pengaturan dari induknya dan mempengaruhi tampilan berdasarkan status yang dikelola oleh induk. Struktur ini memungkinkan pembuatan tampilan aplikasi yang terorganisir.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
--> Berikut adalah beberapa widget yang digunakan dalam proyek ini beserta penjelasan fungsinya:

    a. Scaffold
    --> Menyediakan struktur dasar untuk halaman dengan elemen-elemen seperti AppBar, Body, dan FloatingActionButton. Widget ini membantu membuat layout yang konsisten di seluruh aplikasi.

    b. AppBar
    --> Menampilkan bar di bagian atas layar yang biasanya berisi judul aplikasi atau menu navigasi. Digunakan untuk memberi konteks kepada pengguna mengenai halaman atau aplikasi yang sedang dibuka.

    c. Text
    --> Menampilkan teks di layar. Dalam proyek ini, widget Text digunakan untuk menampilkan informasi seperti nama aplikasi, pesan sambutan, dan informasi lainnya.

    d. Column
    -- Menyusun widget secara vertikal dalam satu kolom. Digunakan untuk mengatur elemen-elemen UI yang ditampilkan dalam urutan vertikal.

    e. Row
    --> Fungsi Menyusun widget secara horizontal dalam satu baris. Digunakan untuk menampilkan beberapa elemen secara berdampingan, seperti kartu informasi (InfoCard).

    f. SizedBox
    --> Fungsi Memberikan jarak atau spasi antara widget. Dalam proyek ini, SizedBox digunakan untuk memberi jarak vertikal antara elemen-elemen seperti tombol dan teks.

    g. ElevatedButton
    --> Membuat tombol yang memiliki efek elevasi, memberikan tampilan tombol yang lebih menonjol. Dalam proyek ini, digunakan untuk membuat tombol yang dapat di-klik, seperti "All Products", "My Products", dan "Create Product".

    h. Icon
    -->  Menampilkan ikon di layar. Digunakan pada tombol untuk memberikan representasi visual yang mendukung teks pada tombol, seperti ikon add, shopping_bag, dan newspaper.

    i. Card
    --> Menyediakan tampilan kartu dengan bayangan untuk memberikan kesan kedalaman. Digunakan untuk menampilkan elemen informasi seperti NPM, Nama, dan Kelas dalam proyek ini.

    j. Container
    --> Digunakan untuk menempatkan dan mengatur widget lainnya. Dapat digunakan untuk memberi padding, margin, atau pengaturan ukuran dan warna. Dalam proyek ini, digunakan untuk menampung elemen-elemen dalam kartu dan tombol.

    k. Material
    --> Menyediakan dasar bagi widget untuk menggunakan efek material design, seperti animasi dan pengaturan gaya. Digunakan di dalam ItemCard untuk memberikan interaktivitas saat tombol ditekan.

    l. InkWell
    --> Membuat efek interaktif saat widget ditekan, seperti perubahan warna atau animasi. Dalam proyek ini, digunakan untuk memberikan efek saat kartu di-klik dan menampilkan pesan dengan SnackBar.

    m. SnackBar
    --> Menampilkan pesan sementara di bagian bawah layar untuk memberi umpan balik kepada pengguna, seperti "Kamu telah menekan tombol All Products". Widget ini digunakan untuk memberikan pemberitahuan kepada pengguna setelah mereka melakukan interaksi.

    n. InfoCard (Custom Widget)
    --> Kartu informasi kustom yang menampilkan teks dengan judul dan konten. Digunakan untuk menampilkan informasi seperti NPM, Nama, dan Kelas secara konsisten dalam aplikasi.

    o. GridView.count
    --> Menampilkan widget dalam format grid dengan jumlah kolom yang ditentukan. Digunakan untuk menampilkan item secara dinamis dalam grid, seperti kartu produk yang diwakili oleh ItemCard.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
--> MaterialApp adalah kelas atau widget yang sudah disediakan di Flutter. Ini merupakan komponen utama atau inti dari aplikasi Flutter. Widget MaterialApp memberikan pembungkus di sekitar widget Material lainnya. Dengan menggunakan widget ini, kita dapat mengakses berbagai komponen dan widget yang disediakan oleh Flutter SDK, seperti widget Text, DropdownButton, AppBar, Scaffold, ListView, StatelessWidget, StatefulWidget, IconButton, TextField, Padding, ThemeData, dan masih banyak lagi. Dengan menggunakan widget ini, kita dapat membuat aplikasi yang menarik dan mengikuti pedoman desain Material.


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
--> StatelessWidget adalah widget yang tidak mengalami perubahan, baik karena interaksi pengguna maupun perubahan nilai atau variabel. Widget ini cocok digunakan untuk tampilan statis, di mana data atau tampilan tidak dipengaruhi oleh interaksi atau perubahan data secara dinamis. Sebaliknya, StatefulWidget memiliki sifat dinamis, di mana widget dapat berubah sesuai dengan interaksi pengguna atau perubahan data. StatefulWidget digunakan ketika data pada widget perlu diperbarui berdasarkan interaksi pengguna, ketika UI memerlukan pembaruan dinamis, atau ketika widget membutuhkan logika atau variabel yang harus dipertahankan selama widget aktif.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
--> BuildContext adalah objek yang menunjukkan posisi widget dalam tree Flutter dan digunakan untuk mengakses informasi lingkungan seperti tema, ukuran layar, dan navigasi. Dalam metode build, BuildContext dipakai untuk mengambil data tersebut agar UI dapat ditampilkan sesuai konteks widget.


6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
--> Hot reload merupakan cara yang paling mudah dan cepat untuk menerapkan perubahan, memperbaiki bug, membuat antarmuka pengguna (UI), dan menambah fitur. Proses ini hanya memerlukan waktu sekitar satu detik untuk dijalankan. Pada hot reload, status yang telah disimpan tidak akan hilang. Namun, hot reload tidak dapat digunakan jika aplikasi dihentikan (killed). Sedangkan hot restart  memiliki fungsionalitas yang sedikit berbeda dibandingkan dengan hot reload. Meskipun lebih cepat dibandingkan dengan fungsi restart penuh, hot restart menghapus status yang telah disimpan dalam aplikasi kita. Kode akan dikompilasi ulang sepenuhnya dan aplikasi akan dimulai dari keadaan default. Meskipun memakan waktu lebih lama dibandingkan dengan hot reload, hot restart tetap lebih cepat daripada restart penuh.


Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
--> Perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada pengelolaan tumpukan layar. Metode push() menambahkan layar baru di atas layar sebelumnya tanpa menghapusnya, sehingga pengguna masih bisa kembali ke layar sebelumnya sehingga cocok untuk navigasi yang memerlukan fitur back, seperti dari halaman utama ke Form Tambah Produk. Sementara itu, pushReplacement() mengganti layar saat ini dengan layar baru dan menghapus layar sebelumnya dari tumpukan. Pendekatan ini ideal untuk navigasi dari drawer atau setelah proses login/logout agar tidak terjadi penumpukan layar dan tombol back hanya membawa pengguna ke halaman yang relevan atau keluar dari aplikasi.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
--> Scaffold berperan sebagai kerangka utama setiap halaman, menjadi wadah bagi komponen seperti AppBar dan Drawer. AppBar memastikan setiap layar memiliki judul dan akses ke Drawer yang konsisten. Penggunaan widget LeftDrawer() yang sama di semua halaman menjaga tampilan serta opsi navigasi utama (Home dan Create Products) tetap seragam. Dengan struktur ini, aplikasi memiliki identitas visual dan pengalaman pengguna yang konsisten di setiap halaman.


3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
--> Dalam desain antarmuka, layout widget berperan penting terutama pada formulir.
Padding digunakan untuk memberi jarak di sekitar elemen seperti TextFormField (Nama Produk, Harga, Deskripsi) agar tampilan lebih rapi dan mudah dibaca. Sementara SingleChildScrollView berfungsi membuat seluruh formulir bisa digulir, mencegah masalah pixel overflow saat keyboard muncul di layar kecil, sehingga semua elemen—termasuk tombol Save—tetap dapat dijangkau pengguna.


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
--> Untuk menjaga konsistensi identitas visual sesuai brand toko, penyesuaian tema warna di main.dart menjadi langkah penting. Dengan menetapkan primarySwatch Colors.blue, warna biru diterapkan secara otomatis ke berbagai komponen seperti AppBar, menciptakan keseragaman tampilan. Selain itu, penggunaan warna fungsional biru untuk All Products, hijau untuk My Products, dan merah untuk Create Product yangmembuat antarmuka tampak menarik sekaligus mudah dipahami pengguna.

