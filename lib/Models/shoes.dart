import 'package:flutter/material.dart';

import '../mongodb.dart';


class ShoeColor {
  final String image;
  final String color;
  final int price;
  final int qty;

  ShoeColor({
    required this.image,
    required this.color,
    required this.price,
    required this.qty,
  });

  factory ShoeColor.fromJson(Map<String, dynamic> json) {
    String colorString = json['color'].replaceAll('#', '');
    Color color = Color(int.parse(colorString, radix: 16));
    return ShoeColor(
      image: json['image'],
      color: json['color'],
      price: json['price'],
      qty: json['qty'],
    );
  }
}

class Shoes {
  final String name;
  final String type;
  final String ratings;
  final List<ShoeColor> colors;

  Shoes({
    required this.name,
    required this.type,
    required this.ratings,
    required this.colors,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) {
    var colorList = json['colors'] as List;
    List<ShoeColor> parsedColors = colorList.map((color) => ShoeColor.fromJson(color)).toList();

    return Shoes(
      name: json['name'],
      type: json['type'],
      ratings: json['ratings'],
      colors: parsedColors,
    );
  }
}

class MongoDatabase {
  static List<Shoes> shoesLists = [];

  static Future<void> fetchShoesData() async {
    var collection = db.collection('shoes');
    var shoesData = await collection.find().toList();

    shoesLists.clear(); // Clear the list before adding new data

    for (var data in shoesData) {
      var shoes = Shoes.fromJson(data);
      shoesLists.add(shoes);
    }
  }
}

// Globally accessible list of Shoes
List<Shoes> listShoes = MongoDatabase.shoesLists;
