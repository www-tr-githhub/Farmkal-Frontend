// To parse this JSON data, do
//
//     final sellProduct = sellProductFromJson(jsonString);

import 'dart:convert';

SellProduct sellProductFromJson(String str) =>
    SellProduct.fromJson(json.decode(str));

String sellProductToJson(SellProduct data) => json.encode(data.toJson());

class SellProduct {
  bool? success;
  List<Product>? product;

  SellProduct({
    this.success,
    this.product,
  });

  factory SellProduct.fromJson(Map<String, dynamic> json) => SellProduct(
        success: json["success"],
        product: json["product"] == null
            ? []
            : List<Product>.from(
                json["product"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  String? name;
  Description? description;
  String? price;
  Category? category;
  int? numOfRevies;
  Seller? seller;
  int? rating;
  DateTime? createdAt;
  List<RealImage>? images;
  List<dynamic>? reviews;
  int? score;
  int? v;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.numOfRevies,
    this.seller,
    this.rating,
    this.createdAt,
    this.images,
    this.reviews,
    this.score,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: descriptionValues.map[json["description"]]!,
        price: json["price"],
        category: categoryValues.map[json["category"]]!,
        numOfRevies: json["numOfRevies"],
        seller: sellerValues.map[json["seller"]]!,
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        images: json["images"] == null
            ? []
            : List<RealImage>.from(
                json["images"]!.map((x) => RealImage.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        score: json["score"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": descriptionValues.reverse[description],
        "price": price,
        "category": categoryValues.reverse[category],
        "numOfRevies": numOfRevies,
        "seller": sellerValues.reverse[seller],
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "score": score,
        "__v": v,
      };
}

enum Category { NONE, TRACTOR, VECHIEL }

final categoryValues = EnumValues({
  "none": Category.NONE,
  "tractor": Category.TRACTOR,
  "Vechiel": Category.VECHIEL
});

enum Description { UNDEFINED }

final descriptionValues = EnumValues({"undefined": Description.UNDEFINED});

class RealImage {
  String? publicId;
  String? url;
  String? id;

  RealImage({
    this.publicId,
    this.url,
    this.id,
  });

  factory RealImage.fromJson(Map<String, dynamic> json) => RealImage(
        publicId: json["public_id"],
        url: json["url"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
        "_id": id,
      };
}

enum Seller { THE_65945_C74_F5_EF966_F359_A3_F2_C }

final sellerValues = EnumValues(
    {"65945c74f5ef966f359a3f2c": Seller.THE_65945_C74_F5_EF966_F359_A3_F2_C});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
