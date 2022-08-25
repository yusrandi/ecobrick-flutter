import 'package:ecobrick_app/app/cores/core_colors.dart';
import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_styles.dart';
import '../controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  GameView({Key? key}) : super(key: key);
  final GameController gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Ecobrickschool'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Game Edukatif',
                  style: CoreStyles.uTitle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Quiz Time !!!',
                          style: CoreStyles.uTitle
                              .copyWith(color: CoreColor.secondary),
                        ),
                        const SizedBox(height: 16),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 16),
                              itemCount: gameController.listGame.length,
                              itemBuilder: (context, index) {
                                var item = gameController.listGame[index];
                                return menuItem(item);
                              }),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  menuItem(item) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.QUIZ, arguments: item),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 200,
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
        child: Row(
          children: [
            Lottie.asset(CoreImages.checklistJson, width: 150),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${item['title']}',
                      style: CoreStyles.uTitle
                          .copyWith(color: item['background'], fontSize: 20)),
                  Text(
                    'Jawablah pilihan ganda berikut dengan benar!',
                    style: CoreStyles.uSubTitle
                        .copyWith(color: CoreColor.kTextColor),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: item['background']),
                    child: Text(
                      'Mulai',
                      style: CoreStyles.uContent.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
