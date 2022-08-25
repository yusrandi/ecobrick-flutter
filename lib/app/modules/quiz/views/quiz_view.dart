import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/data/configs/api.dart';
import 'package:ecobrick_app/app/data/models/quiz_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var item = Get.arguments;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']),
        centerTitle: true,
        backgroundColor: item['background'],
        elevation: 0,
      ),
      body: Obx(() => controller.status.value == Status.running
          ? const Center(child: CircularProgressIndicator())
          : body(context, item, size)),
    );
  }

  Stack body(BuildContext context, item, Size size) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: item['background'],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Obx(
                () => Text(
                  'Soal ${controller.index} / ${controller.countLength.value}',
                  style: CoreStyles.uTitle.copyWith(color: Colors.white),
                ),
              ),
              timerProgress(item),
              Expanded(
                  child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        controller.listItemQuiz.value.soal!.split('|').length >
                                1
                            ? iniGambar()
                            : iniText(),
                        const SizedBox(height: 16),
                        itemJawaban(controller.listItemQuiz.value, 'A',
                            controller.listItemQuiz.value.a!),
                        itemJawaban(controller.listItemQuiz.value, 'B',
                            controller.listItemQuiz.value.b!),
                        itemJawaban(controller.listItemQuiz.value, 'C',
                            controller.listItemQuiz.value.c!),
                        itemJawaban(controller.listItemQuiz.value, 'D',
                            controller.listItemQuiz.value.d!),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }

  iniText() {
    return Text(
      controller.listItemQuiz.value.soal!.split('|')[0],
      textAlign: TextAlign.center,
      style:
          CoreStyles.uTitle.copyWith(color: CoreColor.secondary, fontSize: 20),
    );
  }

  iniGambar() {
    return Column(
      children: [
        Image.network(
            "${Api.imageURL}${controller.listItemQuiz.value.soal!.split('|')[0]}"),
        Text(
          controller.listItemQuiz.value.soal!.split('|')[1],
          textAlign: TextAlign.center,
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
        )
      ],
    );
  }

  Obx timerProgress(item) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: controller.progress.value,
              color: Colors.black,
              backgroundColor: item['background'],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Text(
            '${(controller.seconds)}',
            style: CoreStyles.uTitle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  itemJawaban(QuizModel model, String jawabanUser, String jawabanLabel) {
    String hasil = jawabanUser == model.jawaban ? 'benar' : 'salah';
    return GestureDetector(
      onTap: () => controller.jawabanUser(model.id!, jawabanUser, hasil),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
            child:
                jawabanLabel.contains('.png') || jawabanLabel.contains('.jpg')
                    ? jawabanGambar(jawabanLabel)
                    : jawabanLabelVoid(jawabanLabel)),
      ),
    );
  }

  jawabanLabelVoid(String jawabanLabel) {
    return Text(
      jawabanLabel,
      style: CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
      textAlign: TextAlign.center,
    );
  }

  jawabanGambar(String jawabanLabel) {
    return Image.network("${Api.imageURL}$jawabanLabel");
  }
}
