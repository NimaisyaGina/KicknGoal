
import 'dart:convert';

List<ProductEntry> productEntryListFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData is List) {
    return jsonData
        .map((e) => ProductEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  return [];
}

List<ProductEntry> productEntryListFromDynamic(List<dynamic> list) {
  return list.map((e) {
    if (e is Map<String, dynamic>) return ProductEntry.fromJson(e);
    return ProductEntry.fromJson(Map<String, dynamic>.from(e));
  }).toList();
}

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
  final String id;
  final String name;
  final String description;
  final String category;
  final String thumbnail; 
  final int productViews;
  final DateTime createdAt;
  final bool isFeatured;
  final int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.productViews,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) {
    return ProductEntry(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      productViews: _toInt(json['product_views']),
      createdAt: _parseDate(json['created_at']),
      isFeatured: _toBool(json['is_featured']),
      userId: _toInt(json['user_id']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'thumbnail': thumbnail,
        'product_views': productViews,
        'created_at': createdAt.toIso8601String(),
        'is_featured': isFeatured,
        'user_id': userId,
      };

  // --- helpers ---
  static int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    return int.tryParse(v.toString()) ?? 0;
  }

  static bool _toBool(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return s == '1' || s == 'true' || s == 'yes';
  }

  static DateTime _parseDate(dynamic v) {
    if (v == null) return DateTime.now();
    try {
      return DateTime.parse(v.toString());
    } catch (_) {
      return DateTime.now();
    }
  }

  bool get thumbnailIsDataUri => thumbnail.startsWith('data:');
}
