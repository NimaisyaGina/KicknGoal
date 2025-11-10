import 'package:flutter/material.dart';
// Impor drawer [cite: 191]
import 'package:kickngoal/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});
  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  // [cite: 226]
  final _formKey = GlobalKey<FormState>();
  // [cite: 236-241]
  String _title = "";
  String _content = "";
  String _price = ""; // simpan sebagai string lalu parse saat validasi
  String _category = ""; // default akan di-set ke first category di initState
  String _thumbnail = "";
  bool _isFeatured = false;
  // [cite: 241-251]
  final List<String> _categories = [
    'new',
    'popular',
    'exclusive',
    'on sale',
  ];


  @override
  void initState() {
    super.initState();
    _category = _categories.first;
  }

  bool _looksLikeUrl(String s) {
    if (s.isEmpty) return false;
    final uri = Uri.tryParse(s);
    return uri != null && (uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https'));
  }

  @override
  Widget build(BuildContext context) {
    // [cite: 203]
    return Scaffold(
      appBar: AppBar(
        // [cite: 206]
        title: const Center(
          child: Text(
            'Form Tambah Product',
          ),
        ),
        backgroundColor: Colors.indigo, // [cite: 211]
        foregroundColor: Colors.white, // [cite: 212]
      ),
      // TODO [cite: 214] diisi
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey, // [cite: 228]
        child: SingleChildScrollView(
          // [cite: 256]
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // [cite: 262]
            children: [
              // === Title === [cite: 265-291]
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
                      _title = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Nama minimal 3 karakter.";
                    }
                    if (value.trim().length > 100) {
                      return "Nama maksimal 100 karakter.";
                    }
                    return null;
                  },
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Harga (misal 100.000)",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    // coba parse
                    final parsed = double.tryParse(value.replaceAll(',', '.'));
                    if (parsed == null) {
                      return "Harga harus berupa angka.";
                    }
                    if (parsed <= 0) {
                      return "Harga harus lebih besar dari 0.";
                    }
                    // optional: batas maksimal, misal <= 1.000.000.000
                    if (parsed > 1000000000) {
                      return "Harga terlalu besar.";
                    }
                    return null;
                  },
                ),
              ),

              // === Content / Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi produk",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _content = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal 10 karakter.";
                    }
                    if (value.trim().length > 2000) {
                      return "Deskripsi terlalu panjang.";
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
                            child: Text(cat[0].toUpperCase() + cat.substring(1)),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue ?? _categories.first;
                    });
                  },
                ),
              ),

              // === Thumbnail URL (opsional) ===
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
                      _thumbnail = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) return null; // opsional
                    if (!_looksLikeUrl(value.trim())) {
                      return "Format URL tidak valid (harus http/https).";
                    }
                    // optional: cek panjang URL
                    if (value.trim().length > 1000) {
                      return "URL terlalu panjang.";
                    }
                    return null;
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

              // === Tombol Simpan ===
              // === Tombol Simpan ===
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Tampilkan dialog dengan data yang diambil dari state vars
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Berita berhasil disimpan!'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Judul: ${_title.isEmpty ? "-" : _title}'),
                                  Text('Isi: ${_content.isEmpty ? "-" : _content}'),
                                  Text('Kategori: ${_category}'),
                                  Text('Thumbnail: ${_thumbnail.isEmpty ? "-" : _thumbnail}'),
                                  Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      ).then((_) {
                        // Reset hanya setelah dialog ditutup agar dialog tetap menampilkan data
                        _formKey.currentState!.reset();

                        setState(() {
                          _title = "";
                          _content = "";
                          _category = _categories.first;
                          _thumbnail = "";
                          _isFeatured = false;
                        });
                      });
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
