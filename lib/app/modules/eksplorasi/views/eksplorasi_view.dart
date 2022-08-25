import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_images.dart';
import '../controllers/eksplorasi_controller.dart';

class EksplorasiView extends GetView<EksplorasiController> {
  EksplorasiView({Key? key}) : super(key: key);
  var items = [
    MenuEksplorasi(Routes.HOME, CoreImages.dashboardImage,
        'Mengapa buat Ecobrick', 'alasan mengapa kita harus membuat Ecobrick'),
    MenuEksplorasi(Routes.DETAIL, CoreImages.dashboardImage,
        'Mengapa buat Ecobrick', 'alasan mengapa kita harus membuat Ecobrick'),
    MenuEksplorasi(Routes.DETAIL, CoreImages.dashboardImage,
        'Apa manfaat Ecobrick', 'berikut manfaat dari Ecobrick'),
    MenuEksplorasi(Routes.DETAIL, CoreImages.dashboardImage, 'Sejarah Ecobrick',
        'sejarah terbentuknya Ecobrick'),
    MenuEksplorasi(Routes.DETAIL, CoreImages.dashboardImage,
        'Cara Pembuatan Ecobrick', 'tata cara pembuatan Ecobrick'),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Ecobrickschool'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                color: Colors.amber,
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
                  'Eksplorasi Ecobrick',
                  style: CoreStyles.uTitle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Expanded(
                          child: Text('Search',
                              style: CoreStyles.uSubTitle
                                  .copyWith(color: Colors.black45))),
                      SizedBox(width: 8),
                      Icon(Icons.mic),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            MenuEksplorasi menu = items[index];
                            return item1(size, index, menu);
                          },
                          itemCount: items.length)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container item1(Size size, int index, MenuEksplorasi menu) {
    return Container(
      margin: EdgeInsets.all(16),
      width: size.width,
      height: 170,
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
      child: index == 0 ? itemGambarDikanan() : itemGambarDikiri(menu, index),
    );
  }

  itemGambarDikanan() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL, arguments: 0),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                CoreImages.backTopImage,
                height: 130,
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

  itemGambarDikiri(MenuEksplorasi menu, int index) {
    return GestureDetector(
      onTap: () => Get.toNamed(menu.route, arguments: index),
      child: Row(
        children: [
          Expanded(child: Image.asset(menu.image)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(menu.title,
                    style: CoreStyles.uTitle
                        .copyWith(color: CoreColor.secondary, fontSize: 20),
                    textAlign: TextAlign.center),
                SizedBox(height: 16),
                Text(
                  menu.content,
                  style:
                      CoreStyles.uContent.copyWith(color: CoreColor.kTextColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuEksplorasi {
  String route;
  String image;
  String title;
  String content;
  MenuEksplorasi(this.route, this.image, this.title, this.content);
}
