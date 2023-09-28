import 'dart:convert';
import 'package:evaluate/models/earth_quake_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class EarthQuakesService {
  Future<List<EarthQuakeItem>> getList(String type) async {
    try {
      var client = http.Client();
      var uri = Uri.https("selcuksarikoz.com", "depremapp", {"list": "week"});
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        List body = json.decode(response.body);
        return body.map((e) => EarthQuakeItem.fromJson(e)).toList();
      } else {
        throw "Could'nt get data";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

final listProvider =
    Provider<EarthQuakesService>((ref) => EarthQuakesService());
