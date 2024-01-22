// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  bool? success;
  List<Product>? products;

  ProductList({
    this.success,
    this.products,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        success: json["success"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  Name? name;
  Description? description;
  Price? price;
  Category? category;
  int? numOfRevies;
  String? city;
  Seller? seller;
  int? rating;
  DateTime? createdAt;
  List<dynamic>? images;
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
    this.city,
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
        name: nameValues.map[json["name"]]!,
        description: descriptionValues.map[json["description"]]!,
        price: priceValues.map[json["price"]]!,
        category: categoryValues.map[json["category"]]!,
        numOfRevies: json["numOfRevies"],
        city: json["city"],
        seller: sellerValues.map[json["seller"]]!,
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        score: json["score"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": nameValues.reverse[name],
        "description": descriptionValues.reverse[description],
        "price": priceValues.reverse[price],
        "category": categoryValues.reverse[category],
        "numOfRevies": numOfRevies,
        "city": city,
        "seller": sellerValues.reverse[seller],
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "score": score,
        "__v": v,
      };
}

enum Category { VECHIEL }

final categoryValues = EnumValues({"vechiel": Category.VECHIEL});

enum Description {
  A_BRAND_NEW_TRACTOR_AT_BEST_PRICE,
  TRACTOR_CAN_BE_USED_FOR_VARIOUS_PURPOSE
}

final descriptionValues = EnumValues({
  "A brand new tractor at best price":
      Description.A_BRAND_NEW_TRACTOR_AT_BEST_PRICE,
  "Tractor can be used for various purpose":
      Description.TRACTOR_CAN_BE_USED_FOR_VARIOUS_PURPOSE
});

enum Name { TRACTOR }

final nameValues = EnumValues({"Tractor": Name.TRACTOR});

enum Price { THE_100000, THE_150000 }

final priceValues =
    EnumValues({"1,00,000": Price.THE_100000, "1,50,000": Price.THE_150000});

enum Seller { THE_657412_E6_F57_AFB297312_F702 }

final sellerValues = EnumValues(
    {"657412e6f57afb297312f702": Seller.THE_657412_E6_F57_AFB297312_F702});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
