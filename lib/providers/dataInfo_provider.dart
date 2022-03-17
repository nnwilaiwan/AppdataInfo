import 'package:datainfoapp/database/dataInfo_db.dart';
import 'package:datainfoapp/model/dataInfo.dart';
import 'package:flutter/foundation.dart';

class DataInfoProvider with ChangeNotifier {
  List<DataInfo> datainfoList = [];
   List datainfoDetail = [];
  // List<DataInfo> datainfoList = [
  //   DataInfo(id: '1', title: 'one', age: 11, dateCrate: DateTime.now()),
  //   DataInfo(id: '2', title: 'two', age: 22, dateCrate: DateTime.now()),
  //   DataInfo(id: '3', title: 'three', age: 33, dateCrate: DateTime.now()),
  //   DataInfo(id: '4', title: 'four', age: 44, dateCrate: DateTime.now()),
  // ];

  //ดึงข้อมูล
  List<DataInfo> getDataInfo() {
    return datainfoList;
  }

  void initData() async {
    var db = DataInfoDB(dbName: 'dataInfo.db');
    // get data
    datainfoList = await db.loadAllData();
     notifyListeners();
  }

   void initDataDetail(String id) async {
    var db = DataInfoDB(dbName: 'dataInfo.db');
    datainfoDetail = await db.listallDetail(id);
     notifyListeners();
  }



  void addDataInfo(DataInfo newdata) async {
    var db = DataInfoDB(dbName: 'dataInfo.db');
    //save
    await db.InsertData(newdata);

    // get data
    datainfoList = await db.loadAllData();
    // datainfoList.insert(0, newdata);
    notifyListeners();
  }
}
