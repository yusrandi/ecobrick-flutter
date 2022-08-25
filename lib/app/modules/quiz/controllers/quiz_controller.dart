import 'dart:async';
import 'dart:math';

import 'package:ecobrick_app/app/data/models/quiz_model.dart';
import 'package:ecobrick_app/app/data/services/laporan_service.dart';
import 'package:ecobrick_app/app/data/services/quiz_service.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';

enum Status { none, running, stopped, paused }

class QuizController extends GetxController {
  Rx<Status> status = Status.none.obs;

  final index = 1.obs;
  final countLength = 0.obs;

  RxDouble progress = 0.0.obs;
  RxInt seconds = 30.obs;
  int _start = 30;

  Timer? _timer;

  List<QuizModel> listQuiz = [];
  Rx<QuizModel> listItemQuiz = QuizModel().obs;

  List<JawabanModel> listJawaban = [];

  onProgress(pro) {
    progress.value = (pro * 3.3 / 100);
    seconds.value = _start--;
  }

  @override
  void onInit() async {
    super.onInit();

    listJawaban.clear();

    status.value = Status.running;

    var item = Get.arguments;
    print(item['id']);

    listQuiz = await listQuizFromDb(item['id'].toString());

    listItemQuiz.value = (listQuiz.toList()..shuffle()).first;

    status.value = Status.none;

    print(listQuiz.length);
    countLength.value = listQuiz.length;

    startTimer();
    print('on init');
  }

  Future<List<QuizModel>> listQuizFromDb(String quizId) async {
    return await QuizService().fetchQuiz(quizId);
  }

  @override
  void onReady() {
    super.onReady();
    print('on ready');
  }

  @override
  void onClose() {
    super.onClose();
    _timer!.cancel();
  }

  void increment() => index.value++;

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (seconds.value < 2) {
          // timer.cancel();
          if (index < countLength.value) {
            nextStep();
          }
        } else {
          onProgress(_start--);
        }
      },
    );
  }

  jawabanUser(int id, String jawaban, String hasil) {
    listJawaban.add(JawabanModel(id, jawaban, hasil));
    nextStep();
  }

  nextStep() {
    if (index < countLength.value) {
      index.value++;

      progress.value = 0.0;
      seconds.value = 30;
      _start = 30;

      listItemQuiz.value = (listQuiz.toList()..shuffle()).first;
      var contain =
          listJawaban.where((element) => element.id == listItemQuiz.value.id);

      while (contain.isNotEmpty) {
        listItemQuiz.value = (listQuiz.toList()..shuffle()).first;
      }
    } else {
      finishExam();
    }

    update();
  }

  finishExam() async {
    Get.snackbar(
        CoreStrings.appName, "Selesai, Mohon menunggu, anda akan dialihkan",
        backgroundColor: CoreColor.whiteSoft,
        duration: const Duration(seconds: 2));

    var quizzes = [];
    var jawabans = [];

    for (var element in listJawaban) {
      quizzes.add(element.id);
      jawabans.add(element.jawaban);
    }

    await LaporanService().laporanStore(quizzes.join(','), jawabans.join(','));

    // buat explode di api

    Get.offAndToNamed(Routes.RESULT, arguments: listJawaban);
  }
}

class JawabanModel {
  int id;
  String jawaban;
  String hasil;
  JawabanModel(this.id, this.jawaban, this.hasil);
}
