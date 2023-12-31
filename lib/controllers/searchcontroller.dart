import 'dart:convert';

void main() {
  String jsonString = '''
  {
    "_id": "6589928cf48931d01672f980",
    "name": "Himanshu",
    "phone": "6377556820",
    "bio": "This is my bio",
    "latitude": 26.0045,
    "longitude": 75.5432,
    "state": "Rajasthan",
    "city": "churu",
    "sellItems": [],
    "buy_items": [],
    "cart": [],
    "createdAt": "2023-12-25T14:32:44.739Z",
    "__v": 0
  }
  ''';

  try {
    Map<String, dynamic> user = jsonDecode(jsonString);
    print(user);
  } catch (e) {
    print('An error occurred: $e');
  }
}
