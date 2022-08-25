import 'package:ecobrick_app/app/cores/core_colors.dart';
import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/modules/auth/controllers/authentication_manager.dart';
import 'package:ecobrick_app/app/modules/guru/guruhome/views/guruhome_view.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_images.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  AuthenticationManager authenticationManager =
      Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: authenticationManager.getRole() == 3 ? body(size) : GuruhomeView(),
    );
  }

  Container body(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              Lottie.asset(CoreImages.happyUserJson, width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reza Rahardian ${authenticationManager.getRole()}',
                      style:
                          CoreStyles.uSubTitle.copyWith(color: Colors.black)),
                  Text('Indonesia', style: CoreStyles.uContent),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Text('Selamat Datang !',
              style: CoreStyles.uTitle.copyWith(color: CoreColor.secondary)),
          const SizedBox(height: 8),
          item1(size),
          const SizedBox(height: 16),
          Text('Menu',
              style:
                  CoreStyles.uSubTitle.copyWith(color: CoreColor.kTextColor)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => Get.toNamed(Routes.EKSPLORASI),
                child: itemMenu("assets/icons/orbit.svg", Colors.orange,
                    'Eksplorasi', 'Ecobrick'),
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: GestureDetector(
                onTap: () => Get.toNamed(Routes.VIDEO),
                child: itemMenu("assets/icons/video.svg", Colors.green, 'Video',
                    'Tutorial'),
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: GestureDetector(
                onTap: () => Get.toNamed(Routes.GAME),
                child: itemMenu(
                    "assets/icons/game.svg", Colors.blue, 'Game', 'Edukatif'),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Text('Sering dikunjungi',
              style:
                  CoreStyles.uSubTitle.copyWith(color: CoreColor.kTextColor)),
          const SizedBox(height: 8),
          Container(
            width: size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(child: Image.asset(CoreImages.dashboardImage)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Mengapa buat \nEcobrick ?',
                          style: CoreStyles.uTitle.copyWith(
                              color: CoreColor.secondary, fontSize: 20),
                          textAlign: TextAlign.center),
                      Text(
                        'alasan mengapa kita\nharus membuat Ecobrick',
                        style: CoreStyles.uContent
                            .copyWith(color: CoreColor.kTextColor),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: CoreColor.secondary),
                        child: Text(
                          'Lanjut',
                          style:
                              CoreStyles.uContent.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container itemMenu(String iconSvg, Color color, String title, String sub) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: CoreStyles.uTitle
                      .copyWith(color: Colors.white, fontSize: 20),
                ),
                Text(
                  '$sub',
                  style: CoreStyles.uSubTitle.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              iconSvg,
              color: Colors.white.withOpacity(0.5),
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Container item1(Size size) {
    return Container(
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                CoreImages.backTopImage,
                height: 150,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                CoreImages.peopleImage,
                height: 150,
              )),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CoreColor.secondary),
                  child: Text(
                    'Lanjut',
                    style: CoreStyles.uContent.copyWith(color: Colors.white),
                  ),
                ),
                Text('Apa itu \nEcobrick ?',
                    style: CoreStyles.uTitle
                        .copyWith(color: CoreColor.secondary, fontSize: 20)),
                Text('Pelajari lebih lanjut!',
                    style: CoreStyles.uContent
                        .copyWith(color: CoreColor.kTextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
