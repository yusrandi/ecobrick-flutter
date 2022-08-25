import 'package:ecobrick_app/app/data/configs/api.dart';
import 'package:ecobrick_app/app/data/models/home_model.dart';
import 'package:ecobrick_app/app/data/models/user_model.dart';
import 'package:ecobrick_app/app/data/services/home_service.dart';
import 'package:ecobrick_app/app/data/services/quiz_service.dart';
import 'package:ecobrick_app/app/data/services/user_service.dart';

import 'package:http/http.dart' as http;

void main() async {
  HomeModel response = await HomeService().getHome();
  print(response.dataxbenarA);
}
