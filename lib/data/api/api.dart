import 'dart:convert';

import 'package:cultino/data/hive/theDataHive.dart';
import 'package:cultino/data/hive/theKrishiHive.dart';
import 'package:cultino/data/hiveboxes/boxes.dart';
import 'package:http/http.dart' as http;

class Api {
  Future addDataToHive(DataHive dataCache) async {
    print("adding data to Hive");
    final watchList = APICacheHive()..data = dataCache;

    final box = Boxes.getApiCache();
    box.add(watchList);
  }

  void getkrishiApiData() async {

    var url = Uri.parse(
        'https://thekrishi.com/test/mandi?lat=28.44108136&lon=77.0526054&ver=89&lang=hi&crop_id=10');
    var response = await http.get(url);
    print("fetched data from  internet");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      addDataToHive(DataHive.fromJson(json["data"]));
    } else {
      throw Error();
    }
  }
}
