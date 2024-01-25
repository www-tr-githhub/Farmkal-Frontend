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
  int? numOfRevies;
  String? seller;
  int? rating;
  DateTime? createdAt;
  List<RImage>? images;
  List<dynamic>? reviews;
  int? score;
  int? v;
  String? description;
  String? price;
  String? category;

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
    this.description,
    this.price,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        numOfRevies: json["numOfRevies"],
        seller: json["seller"],
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        images: json["images"] == null
            ? []
            : List<RImage>.from(json["images"]!.map((x) => RImage.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        score: json["score"],
        v: json["__v"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "numOfRevies": numOfRevies,
        "seller": seller,
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "score": score,
        "__v": v,
        "description": description,
        "price": price,
        "category": category,
      };
}

class RImage {
  String? publicId;
  String? url;
  String? id;

  RImage({
    this.publicId,
    this.url,
    this.id,
  });

  factory RImage.fromJson(Map<String, dynamic> json) => RImage(
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
