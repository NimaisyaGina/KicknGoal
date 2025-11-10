import 'package:flutter/material.dart';
import 'package:kickngoal/widgets/left_drawer.dart';
// Impor widget product_card
import 'package:kickngoal/widgets/product_card.dart';
import 'package:kickngoal/screens/productlist_form.dart'; // supaya bisa navigasi langsung juga

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Nimaisya Gina Herapati"; //nama
  final String npm = "2406429885"; //npm
  final String kelas = "C"; //kelas

  final List<ItemHomepage> items = [
    ItemHomepage("See Kick n Goal Products", Icons.sports_soccer),
    ItemHomepage("Tambah Produk", Icons.add), // ubah teks jadi Tambah Produk agar konsisten
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kick n Goal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(), // tambahkan drawer agar konsisten
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Kick n Goal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Tombol All Products (Biru) -> placeholder
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(200, 60),
                    ),
                    onPressed: () {
                      // Bisa diganti navigasi ke halaman produk list jika ada
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Kamu telah menekan tombol All Products")),
                      );
                    },
                    icon: const Icon(Icons.sports_soccer, color: Colors.white),
                    label: const Text(
                      'All Products',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Tombol My Products (Hijau) -> placeholder
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(200, 60),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Kamu telah menekan tombol My Products")),
                      );
                    },
                    icon: const Icon(Icons.inventory, color: Colors.white),
                    label: const Text(
                      'My Products',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Tombol Create Product (Merah) -> navigasi ke form tambah produk
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(200, 60),
                    ),
                    onPressed: () {
                      // navigasi ke halaman ProductFormPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductFormPage()),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Create Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}
