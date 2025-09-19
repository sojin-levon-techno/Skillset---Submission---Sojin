class ProductModel {
  final int? id;
  final List<dynamic>? variations;
  final bool? inWishlist;
  final int? avgRating;
  final List<String>? images;
  final bool? variationExists;
  final int? salePrice;
  final String? name;
  final String? description;
  final String? caption;
  final String? featuredImage;
  final int? mrp;
  final int? stock;
  final bool? isActive;
  final String? discount;
  final DateTime? createdDate;
  final String? productType;
  final dynamic showingOrder;
  final String? variationName;
  final int? category;
  final int? taxRate;

  ProductModel({
    this.id,
    this.variations,
    this.inWishlist,
    this.avgRating,
    this.images,
    this.variationExists,
    this.salePrice,
    this.name,
    this.description,
    this.caption,
    this.featuredImage,
    this.mrp,
    this.stock,
    this.isActive,
    this.discount,
    this.createdDate,
    this.productType,
    this.showingOrder,
    this.variationName,
    this.category,
    this.taxRate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        variations: json["variations"] == null
            ? []
            : List<dynamic>.from(json["variations"]!.map((x) => x)),
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        variationExists: json["variation_exists"],
        salePrice: json["sale_price"],
        name: json["name"],
        description: json["description"],
        caption: json["caption"],
        featuredImage: json["featured_image"],
        mrp: json["mrp"],
        stock: json["stock"],
        isActive: json["is_active"],
        discount: json["discount"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        productType: json["product_type"],
        showingOrder: json["showing_order"],
        variationName: json["variation_name"],
        category: json["category"],
        taxRate: json["tax_rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variations":
            variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "in_wishlist": inWishlist,
        "avg_rating": avgRating,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "variation_exists": variationExists,
        "sale_price": salePrice,
        "name": name,
        "description": description,
        "caption": caption,
        "featured_image": featuredImage,
        "mrp": mrp,
        "stock": stock,
        "is_active": isActive,
        "discount": discount,
        "created_date": createdDate?.toIso8601String(),
        "product_type": productType,
        "showing_order": showingOrder,
        "variation_name": variationName,
        "category": category,
        "tax_rate": taxRate,
      };

  /// ✅ Add this
  ProductModel copyWith({
    int? id,
    List<dynamic>? variations,
    bool? inWishlist,
    int? avgRating,
    List<String>? images,
    bool? variationExists,
    int? salePrice,
    String? name,
    String? description,
    String? caption,
    String? featuredImage,
    int? mrp,
    int? stock,
    bool? isActive,
    String? discount,
    DateTime? createdDate,
    String? productType,
    dynamic showingOrder,
    String? variationName,
    int? category,
    int? taxRate,
  }) {
    return ProductModel(
      id: id ?? this.id,
      variations: variations ?? this.variations,
      inWishlist: inWishlist ?? this.inWishlist,
      avgRating: avgRating ?? this.avgRating,
      images: images ?? this.images,
      variationExists: variationExists ?? this.variationExists,
      salePrice: salePrice ?? this.salePrice,
      name: name ?? this.name,
      description: description ?? this.description,
      caption: caption ?? this.caption,
      featuredImage: featuredImage ?? this.featuredImage,
      mrp: mrp ?? this.mrp,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
      discount: discount ?? this.discount,
      createdDate: createdDate ?? this.createdDate,
      productType: productType ?? this.productType,
      showingOrder: showingOrder ?? this.showingOrder,
      variationName: variationName ?? this.variationName,
      category: category ?? this.category,
      taxRate: taxRate ?? this.taxRate,
    );
  }
}
