import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../configs/api.dart';
import '../models/quiz_model.dart';

class QuizService extends GetConnect {
  Future<List<QuizModel>> fetchQuiz(String quizId) async {
    final response =
        await http.get(Uri.parse('${Api.instance.quizUrl}/$quizId'));
    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => QuizModel.fromJson(e)).toList();
    }
  }
}
