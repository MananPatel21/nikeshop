
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
    return ShoeColor(
      image: json['image'],
      color: json['color'],
      price: json['price'],
      qty: json['qty'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'color': color,
      'price': price,
      'qty': qty,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'ratings': ratings,
      'colors': colors.map((color) => color.toJson()).toList(),
    };
  }

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
