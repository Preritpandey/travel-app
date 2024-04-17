import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/model/dataModel.dart';

class DataServices {
  String BaseUrl = "https://api.slingacademy.com/v1/sample-data";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/users";
    http.Response res = await http.get(Uri.parse(BaseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
