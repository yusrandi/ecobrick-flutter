import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/controllers/authentication_manager.dart';
import '../configs/api.dart';

class LaporanService extends GetConnect {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<String> laporanStore(String quizId, String jawaban) async {
    var response = await http.post(Uri.parse(Api().resultUrl), body: {
      "user_id": _authManager.getToken()!,
      "quiz_id": quizId,
      "jawaban": jawaban,
    });

    print(response.body);
    return response.body;
  }
}
