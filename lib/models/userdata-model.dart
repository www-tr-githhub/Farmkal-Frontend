// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
    bool? success;
    User? user;
    String? token;

    Userdata({
        this.success,
        this.user,
        this.token,
    });

    factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        success: json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    String? name;
    String? phone;
    String? bio;
    double? latitude;
    double? longitude;
    String? state;
    String? city;
    Intrest? intrest;
    UserData? userData;
    List<dynamic>? sellItems;
    List<dynamic>? buyItems;
    List<dynamic>? cart;
    String? id;
    DateTime? createdAt;
    int? v;

    User({
        this.name,
        this.phone,
        this.bio,
        this.latitude,
        this.longitude,
        this.state,
        this.city,
        this.intrest,
        this.userData,
        this.sellItems,
        this.buyItems,
        this.cart,
        this.id,
        this.createdAt,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        phone: json["phone"],
        bio: json["bio"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        state: json["state"],
        city: json["city"],
        intrest: json["intrest"] == null ? null : Intrest.fromJson(json["intrest"]),
        userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
        sellItems: json["sellItems"] == null ? [] : List<dynamic>.from(json["sellItems"]!.map((x) => x)),
        buyItems: json["buy_items"] == null ? [] : List<dynamic>.from(json["buy_items"]!.map((x) => x)),
        cart: json["cart"] == null ? [] : List<dynamic>.from(json["cart"]!.map((x) => x)),
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "bio": bio,
        "latitude": latitude,
        "longitude": longitude,
        "state": state,
        "city": city,
        "intrest": intrest?.toJson(),
        "userData": userData?.toJson(),
        "sellItems": sellItems == null ? [] : List<dynamic>.from(sellItems!.map((x) => x)),
        "buy_items": buyItems == null ? [] : List<dynamic>.from(buyItems!.map((x) => x)),
        "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
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
