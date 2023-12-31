// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
    bool? success;
    List<User>? users;

    Search({
        this.success,
        this.users,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        success: json["success"],
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class User {
    Intrest? intrest;
    UserData? userData;
    String? id;
    String? name;
    String? phone;
    String? bio;
    String? state;
    String? city;
    List<dynamic>? sellItems;
    List<dynamic>? buyItems;
    List<dynamic>? cart;
    DateTime? createdAt;
    int? v;
    double? latitude;
    double? longitude;

    User({
        this.intrest,
        this.userData,
        this.id,
        this.name,
        this.phone,
        this.bio,
        this.state,
        this.city,
        this.sellItems,
        this.buyItems,
        this.cart,
        this.createdAt,
        this.v,
        this.latitude,
        this.longitude,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        intrest: json["intrest"] == null ? null : Intrest.fromJson(json["intrest"]),
        userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        bio: json["bio"],
        state: json["state"],
        city: json["city"],
        sellItems: json["sellItems"] == null ? [] : List<dynamic>.from(json["sellItems"]!.map((x) => x)),
        buyItems: json["buy_items"] == null ? [] : List<dynamic>.from(json["buy_items"]!.map((x) => x)),
        cart: json["cart"] == null ? [] : List<dynamic>.from(json["cart"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        v: json["__v"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "intrest": intrest?.toJson(),
        "userData": userData?.toJson(),
        "_id": id,
        "name": name,
        "phone": phone,
        "bio": bio,
        "state": state,
        "city": city,
        "sellItems": sellItems == null ? [] : List<dynamic>.from(sellItems!.map((x) => x)),
        "buy_items": buyItems == null ? [] : List<dynamic>.from(buyItems!.map((x) => x)),
        "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Intrest {
    List<dynamic>? recentViews;
    List<dynamic>? fav;

    Intrest({
        this.recentViews,
        this.fav,
    });

    factory Intrest.fromJson(Map<String, dynamic> json) => Intrest(
        recentViews: json["recentViews"] == null ? [] : List<dynamic>.from(json["recentViews"]!.map((x) => x)),
        fav: json["fav"] == null ? [] : List<dynamic>.from(json["fav"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "recentViews": recentViews == null ? [] : List<dynamic>.from(recentViews!.map((x) => x)),
        "fav": fav == null ? [] : List<dynamic>.from(fav!.map((x) => x)),
    };
}

class UserData {
    List<dynamic>? soldItems;
    List<dynamic>? purchasedItems;

    UserData({
        this.soldItems,
        this.purchasedItems,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        soldItems: json["sold_items"] == null ? [] : List<dynamic>.from(json["sold_items"]!.map((x) => x)),
        purchasedItems: json["purchased_items"] == null ? [] : List<dynamic>.from(json["purchased_items"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "sold_items": soldItems == null ? [] : List<dynamic>.from(soldItems!.map((x) => x)),
        "purchased_items": purchasedItems == null ? [] : List<dynamic>.from(purchasedItems!.map((x) => x)),
    };
}
