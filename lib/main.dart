import 'package:flutter/material.dart';
import 'package:nikeshop/Pages/signin.dart';
import 'Models/shoes.dart';
import 'mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabaseInit.connect();
  while (db == null) {
    await Future.delayed(Duration(milliseconds: 100));
  }
  await MongoDatabase.fetchShoesData();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Shoes",
      theme: ThemeData.dark(),
      home: SigninPageUI(),
    );
  }
}
