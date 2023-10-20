import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:nikeshop/constant.dart';

ObjectId newObjectID(){
  return ObjectId();
}

var db;
class MongoDatabaseInit{
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
  }
  Future<void> updateShoeQuantities(String shoeName, String color, int newQuantity, int indexNumber) async {
    try {
      var collection = db.collection('shoes');
      await collection.update(
        where.eq('name', shoeName).and(where.eq('colors.color', color)),
        modify.set('colors.${indexNumber}.qty', newQuantity),
      );
    } catch (e) {
      print("Some Error Occurred in Updating Quantity!");
      print(e);
    }
  }


}