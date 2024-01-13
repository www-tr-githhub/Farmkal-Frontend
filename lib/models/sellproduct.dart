// To parse this JSON data, do
//
//     final sellProduct = sellProductFromJson(jsonString);

import 'dart:convert';

SellProduct sellProductFromJson(String str) => SellProduct.fromJson(json.decode(str));

String sellProductToJson(SellProduct data) => json.encode(data.toJson());

class SellProduct {
    bool? success;
    Product? product;

    SellProduct({
        this.success,
        this.product,
    });

    factory SellProduct.fromJson(Map<String, dynamic> json) => SellProduct(
        success: json["success"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "product": product?.toJson(),
    };
}

class Product {
    String? name;
    int? numOfRevies;
    String? seller;
    int? rating;
    DateTime? createdAt;
    String? id;
    List<dynamic>? images;
    List<dynamic>? reviews;
    int? score;
    int? v;

    Product({
        this.name,
        this.numOfRevies,
        this.seller,
        this.rating,
        this.createdAt,
        this.id,
        this.images,
        this.reviews,
        this.score,
        this.v,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        numOfRevies: json["numOfRevies"],
        seller: json["seller"],
        rating: json["rating"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        id: json["_id"],
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        score: json["score"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "numOfRevies": numOfRevies,
        "seller": seller,
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "_id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "score": score,
        "__v": v,
    };
}
