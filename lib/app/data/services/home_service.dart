import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../configs/api.dart';
import '../models/home_model.dart';

class HomeService extends GetConnect {
  Future<HomeModel> getHome() async {
    final response = await http.get(Uri.parse(Api.instance.homeUrl));

    HomeModel home = HomeModel.fromJson(json.decode(response.body)['data']);

    return home;
  }
}
