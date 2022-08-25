import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/controllers/authentication_manager.dart';
import '../../routes/app_pages.dart';
import '../configs/api.dart';
import '../models/user_model.dart';

class UserService extends GetConnect {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<UserModel> getUser(String id) async {
    final response = await http.get(Uri.parse('${Api.instance.getUser}/$id'));

    UserModel user = UserModel.fromJson(json.decode(response.body)['data']);

    return user;
  }

  Future<String> userRegis(UserModel user, String pass) async {
    var response = await http.post(Uri.parse('${Api().getUser}/regis'), body: {
      "name": user.name,
      "phone": user.phone,
      "code": user.code,
      "password": pass,
    });

    // print(_response.body);
    var data = json.decode(response.body);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(response.body)['data']);

      // login(user.id.toString());
      _authManager.login(user.id.toString(), user.roleId!);

      await Get.offAndToNamed(Routes.HOME);
    }

    return data["responsemsg"];
  }

  Future<String> userLogin(String nis, String pass) async {
    var response = await http.post(Uri.parse('${Api().getUser}/login'), body: {
      "code": nis,
      "password": pass,
    });

    // print(_response.body);
    var data = json.decode(response.body);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(response.body)['user']);

      // login(user.id.toString());
      _authManager.login(user.id.toString(), user.roleId!);

      await Get.offAndToNamed(Routes.HOME);
    }

    return data["responsemsg"];
  }
}
