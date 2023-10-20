import 'package:flutter/material.dart';
import '../Models/shoes.dart';

class FavoriteScreen extends StatefulWidget {
  final Set<Shoes> favoriteShoes;

  FavoriteScreen({required this.favoriteShoes});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: ListView.builder(
        itemCount: widget.favoriteShoes.length,
        itemBuilder: (context, index) {
          Shoes shoe = widget.favoriteShoes.elementAt(index);
          return ListTile(
            title: Text(shoe.name),
            subtitle: Text('Price: Rs.${shoe.colors[0].price}'),
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
                  widget.favoriteShoes.remove(shoe);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
