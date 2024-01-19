// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  bool? success;
  List<Product>? product;

  ProductList({
    this.success,
    this.product,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
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
  int? numOfRevies;
  Seller? seller;
  int? rating;
  DateTime? createdAt;
  List<Image>? images;
  List<dynamic>? reviews;
  int? score;
  int? v;

  Product({
    this.id,
    this.name,
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
        numOfRevies: json["numOfRevies"],
        seller: sellerValues.map[json["seller"]]!,
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        score: json["score"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
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

class Image {
  String? publicId;
  String? url;
  String? id;

  Image({
    this.publicId,
    this.url,
    this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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

enum Seller {
  THE_657412_E6_F57_AFB297312_F702,
  THE_658845_EB319_C4_F90_FF5_C282_D,
  THE_6589928_CF48931_D01672_F980
}

final sellerValues = EnumValues({
  "657412e6f57afb297312f702": Seller.THE_657412_E6_F57_AFB297312_F702,
  "658845eb319c4f90ff5c282d": Seller.THE_658845_EB319_C4_F90_FF5_C282_D,
  "6589928cf48931d01672f980": Seller.THE_6589928_CF48931_D01672_F980
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
