import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:nikeshop/Models/shoes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mongodb.dart';
final list = ["Jordan", "Running", "LifeStyle"];

List<Shoes> cartItems = [];
final indexNumber = [];
final quantity = [];
Set<Shoes> favoriteShoes = Set<Shoes>();

Future<void> initializeVariables() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('email');
  var collection = db.collection('users');
  var user = await collection.findOne(where.eq('email', userEmail));
  print("Hello From Data!!");
  if (user != null) {
    // print("User object: $user");
    indexNumber.addAll(user['indexNumbers'] ?? []);
    quantity.addAll(user['quantity'] ?? []);

    if (user['favorites'] != null) {
      List<dynamic> favoritesJsonList = user['favorites'];
      favoritesJsonList.forEach((favoriteJson) {
        Map<String, dynamic> parsedJson = json.decode(favoriteJson);
        Shoes favoriteShoe = Shoes.fromJson(parsedJson);
        favoriteShoes.add(favoriteShoe);
      });
    }

    if (user['cartItems'] != null) {
      List<String> cartItemsJsonList = List.castFrom(user['cartItems']);
      cartItems = cartItemsJsonList.map((cartItemJson) {
        Map<String, dynamic> parsedJson = json.decode(cartItemJson);
        return Shoes.fromJson(parsedJson);
      }).toList();
    }
  }
}
