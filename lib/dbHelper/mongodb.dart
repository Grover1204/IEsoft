import 'dart:developer';

import 'package:demoapp/dbHelper/constant.dart';
import 'package:demoapp/dbHelper/model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    print('mongo is connected');
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return 'Data inserted';
      } else {
        return 'something went wrong';
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
