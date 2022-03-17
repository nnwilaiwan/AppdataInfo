import 'dart:io';

import 'package:datainfoapp/model/dataInfo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DataInfoDB {
  String dbName;

  DataInfoDB({required this.dbName});

  Future<Database> openDatabase() async {
    var appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);

    return db;
  }

  //save
  Future<int> InsertData(DataInfo newdata) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store('expense');

    var keyId = store.add(db, {
      "id": newdata.id,
      "name": newdata.name,
      "age": newdata.age,
      "idCard": newdata.idCard,
      "birthday": newdata.birthday,
      "tel": newdata.tel,
      "villageName": newdata.villageName,
      "houseNumber": newdata.houseNumber,
      "soi": newdata.soi,
      "road": newdata.road,
      "subdistrict": newdata.subdistrict,
      "district": newdata.district,
      "province": newdata.province,
      "zipcode": newdata.zipcode,
      "dateCreate": newdata.dateCreate?.toIso8601String()
    });
    db.close();
    return keyId;
  }

  // get data
  Future<List<DataInfo>> loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store('expense');

    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<DataInfo> allDataInfoList = [];
    for (var item in snapshot) {
      allDataInfoList.add(
        DataInfo(
            id: item['id'].toString(),
            name: item['name'].toString(),
            age: int.parse(item['age'].toString()),
            idCard: item['idCard'].toString(),
            birthday: item['birthday'].toString(),
            tel: item['tel'].toString(),
            villageName: item['villageName'].toString(),
            houseNumber: item['houseNumber'].toString(),
            soi: item['soi'].toString(),
            road: item['road'].toString(),
            subdistrict: item['subdistrict'].toString(),
            district: item['district'].toString(),
            province: item['province'].toString(),
            zipcode: item['zipcode'].toString(),
            dateCreate: DateTime.parse(item['dateCreate'].toString())),
      );
    }
    print(snapshot);
    return allDataInfoList;
  }

  Future<List> listallDetail(String id) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store('expense');
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List listdata = [];
    for (var item in snapshot) {
      if (item['id'].toString() == id) {
        listdata.add({
          "id": item['id'].toString(),
          "name": item['name'].toString(),
          "age": int.parse(item['age'].toString()),
          "idCard": item['idCard'].toString(),
          "birthday": item['birthday'].toString(),
          "tel": item['tel'].toString(),
          "villageName": item['villageName'].toString(),
          "houseNumber": item['houseNumber'].toString(),
          "soi": item['soi'].toString(),
          "road": item['road'].toString(),
          "subdistrict": item['subdistrict'].toString(),
          "district": item['district'].toString(),
          "province": item['province'].toString(),
          "zipcode": item['zipcode'].toString(),
          "dateCreate": DateTime.parse(item['dateCreate'].toString())
        });
      }
    }
    print(listdata);
    return listdata;
  }
}
