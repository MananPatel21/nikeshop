import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nikeshop/Models/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/shoes.dart';
import '../mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class FavoriteScreen extends StatefulWidget {
  final Set<Shoes> favoriteShoes;

  FavoriteScreen({required this.favoriteShoes});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState(favoriteShoes: favoriteShoes);
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Set<Shoes> favoriteShoes;

  _FavoriteScreenState({required this.favoriteShoes});

  Future<void> updateUserCartDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');

    try {
      var collection = db.collection('users');
      List<String> cartItemJsonList = cartItems.map((item) => jsonEncode(item.toJson())).toList();
      List<String> favoriteShoesJsonList = favoriteShoes.map((shoe) => jsonEncode(shoe.toJson())).toList();

      await collection.update(
        mongo.where.eq('email', email),
        mongo.modify
            .set('cartItems', cartItemJsonList)
            .set('indexNumbers', indexNumber)
            .set('quantity', quantity)
            .set('favorites', favoriteShoesJsonList),
      );

      print('User cart details updated successfully.');
    } catch (e) {
      print("Error occurred while updating user cart details!");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: ListView.builder(
        itemCount: favoriteShoes.length,
        itemBuilder: (context, index) {
          Shoes shoe = favoriteShoes.elementAt(index);
          return ListTile(
            title: Text(shoe.name),
            // subtitle: Text(''),
            leading: Image.asset(
              shoe.colors[0].image,
              width: 50,
              height: 50,
            ),
            trailing: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  favoriteShoes.remove(shoe);
                  updateUserCartDetails();
                });
              },
            ),
          );
        },
      ),
    );
  }
}
