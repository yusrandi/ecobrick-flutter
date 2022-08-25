import 'package:ecobrick_app/app/cores/core_colors.dart';
import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil'),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: CoreColor.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 120),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          CoreImages.logoImage,
                          height: 150,
                        ),
                        Text(
                          "Berdasarkan 4 Kategori Pertanyaan yang telah Anda Jawab, maka Skor yang diperoleh : ",
                          style: CoreStyles.uTitle,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Benar : ', style: CoreStyles.uSubTitle),
                            Text(
                                controller.listJawaban
                                    .where(
                                        (element) => element.hasil == 'benar')
                                    .length
                                    .toString(),
                                style: CoreStyles.uSubTitle),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Salah : ', style: CoreStyles.uSubTitle),
                            Text(
                                controller.listJawaban
                                    .where(
                                        (element) => element.hasil != 'benar')
                                    .length
                                    .toString(),
                                style: CoreStyles.uSubTitle),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: Colors.black),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Skor : ', style: CoreStyles.uTitle),
                            Text(
                                (controller.listJawaban
                                            .where((element) =>
                                                element.hasil == 'benar')
                                            .length *
                                        20)
                                    .toString(),
                                style: CoreStyles.uTitle),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.HOME),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: CoreColor.primary),
                            child: Center(
                              child: Text(
                                'Home',
                                style: CoreStyles.uSubTitle
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
