class UserList {
  final bool? success;
  final List<User>? users;

  UserList({this.success, this.users});

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      success: json['success'],
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class User {
  final Interest? interest;
  final UserData? userData;
  final String? id;
  final String? name;
  final String? phone;
  final String? bio;
  final String? state;
  final String? city;
  final List<dynamic>? sellItems;
  final List<dynamic>? buyItems;
  final List<dynamic>? cart;
  final String? createdAt;
  final int? v;

  User({
    this.interest,
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      interest: json['intrest'] != null
          ? Interest.fromJson(json['intrest'] as Map<String, dynamic>)
          : null,
      userData: json['userData'] != null
          ? UserData.fromJson(json['userData'] as Map<String, dynamic>)
          : null,
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      bio: json['bio'],
      state: json['state'],
      city: json['city'],
      sellItems: json['sellItems'] as List<dynamic>?,
      buyItems: json['buy_items'] as List<dynamic>?,
      cart: json['cart'] as List<dynamic>?,
      createdAt: json['createdAt'],
      v: json['__v'],
    );
  }
}

class Interest {
  final List<dynamic>? recentViews;
  final List<dynamic>? fav;

  Interest({this.recentViews, this.fav});

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      recentViews: json['recentViews'] as List<dynamic>?,
      fav: json['fav'] as List<dynamic>?,
    );
  }
}

class UserData {
  final List<dynamic>? soldItems;
  final List<dynamic>? purchasedItems;

  UserData({this.soldItems, this.purchasedItems});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      soldItems: json['sold_items'] as List<dynamic>?,
      purchasedItems: json['purchased_items'] as List<dynamic>?,
    );
  }
}
