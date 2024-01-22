// // To parse this JSON data, do
// //
// //     final recentproduct = recentproductFromJson(jsonString);

// import 'dart:convert';

// Recentproduct recentproductFromJson(String str) =>
//     Recentproduct.fromJson(json.decode(str));

// String recentproductToJson(Recentproduct data) => json.encode(data.toJson());

// class Recentproduct {
//   bool? success;
//   List<Product>? product;

//   Recentproduct({
//     this.success,
//     this.product,
//   });

//   factory Recentproduct.fromJson(Map<String, dynamic> json) => Recentproduct(
//         success: json["success"],
//         product: json["product"] == null
//             ? []
//             : List<Product>.from(
//                 json["product"]!.map((x) => Product.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "product": product == null
//             ? []
//             : List<dynamic>.from(product!.map((x) => x.toJson())),
//       };
// }

// // class Product {
// //     String? id;
// //     String? name;
// //     int? numOfRevies;
// //     String? seller;
// //     int? rating;
// //     DateTime? createdAt;
// //     List<dynamic>? images;
// //     List<dynamic>? reviews;
// //     int? score;
// //     int? v;

// //     Product({
// //         this.id,
// //         this.name,
// //         this.numOfRevies,
// //         this.seller,
// //         this.rating,
// //         this.createdAt,
// //         this.images,
// //         this.reviews,
// //         this.score,
// //         this.v,
// //     });

// //     factory Product.fromJson(Map<String, dynamic> json) => Product(
// //         id: json["_id"],
// //         name: json["name"],
// //         numOfRevies: json["numOfRevies"],
// //         seller: json["seller"],
// //         rating: json["rating"],
// //         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
// //         images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
// //         reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
// //         score: json["score"],
// //         v: json["__v"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "name": name,
// //         "numOfRevies": numOfRevies,
// //         "seller": seller,
// //         "rating": rating,
// //         "createdAt": createdAt?.toIso8601String(),
// //         "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
// //         "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
// //         "score": score,
// //         "__v": v,
// //     };
// // }
