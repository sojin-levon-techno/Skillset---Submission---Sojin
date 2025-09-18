// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
    final int? id;
    final Product? product;
    final Category? category;
    final String? name;
    final String? image;
    final int? showingOrder;

    BannerModel({
        this.id,
        this.product,
        this.category,
        this.name,
        this.image,
        this.showingOrder,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        name: json["name"],
        image: json["image"],
        showingOrder: json["showing_order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "category": category?.toJson(),
        "name": name,
        "image": image,
        "showing_order": showingOrder,
    };
}

class Category {
    final int? id;
    final String? name;
    final String? image;
    final bool? isActive;
    final int? showingOrder;
    final String? slug;
    final List<Product>? products;
    final dynamic hexcode1;
    final dynamic hexcode2;

    Category({
        this.id,
        this.name,
        this.image,
        this.isActive,
        this.showingOrder,
        this.slug,
        this.products,
        this.hexcode1,
        this.hexcode2,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isActive: json["is_active"],
        showingOrder: json["showing_order"],
        slug: json["slug"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        hexcode1: json["hexcode_1"],
        hexcode2: json["hexcode_2"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_active": isActive,
        "showing_order": showingOrder,
        "slug": slug,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "hexcode_1": hexcode1,
        "hexcode_2": hexcode2,
    };
}

class Product {
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

    Product({
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

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
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
        createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
        productType: json["product_type"],
        showingOrder: json["showing_order"],
        variationName: json["variation_name"],
        category: json["category"],
        taxRate: json["tax_rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
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
}
