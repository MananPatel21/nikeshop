import 'package:flutter/material.dart';

import '../Models/data.dart';
import '../Pages/cart.dart';
import '../Pages/favorite.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/shoes/nike.png", width: 40, height: 40,),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen(favoriteShoes: favoriteShoes)),
                  );
                }, icon: const Icon(Icons.favorite),),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                }, icon: const Icon(Icons.shopping_bag_outlined)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}