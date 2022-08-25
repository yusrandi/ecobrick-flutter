import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Video Tutorial'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                color: Colors.green,
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
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Text('Cara Membuat Ecobrick',
                                style: CoreStyles.uTitle.copyWith(
                                    color: CoreColor.secondary, fontSize: 20)),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.PLAYER, arguments: 0),
                              child: Image.asset(
                                CoreImages.videoAImage,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Cara Membuat Sofa Ecobrick',
                                style: CoreStyles.uTitle.copyWith(
                                    color: CoreColor.secondary, fontSize: 20)),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.PLAYER, arguments: 1),
                              child: Image.asset(
                                CoreImages.videoBImage,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Cara Membuat Meja Ecobrick',
                                style: CoreStyles.uTitle.copyWith(
                                    color: CoreColor.secondary, fontSize: 20)),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(Routes.PLAYER, arguments: 2),
                              child: Image.asset(
                                CoreImages.videoCImage,
                                width: size.width,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
