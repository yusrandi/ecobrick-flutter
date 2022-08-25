// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  QuizModel({
    this.id,
    this.quizId,
    this.soal,
    this.a,
    this.b,
    this.c,
    this.d,
    this.jawaban,
  });

  int? id;
  int? quizId;
  String? soal;
  String? a;
  String? b;
  String? c;
  String? d;
  String? jawaban;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        quizId: json["quiz_id"],
        soal: json["soal"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        jawaban: json["jawaban"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_id": quizId,
        "soal": soal,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "jawaban": jawaban,
      };
}
