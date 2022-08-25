import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  PlayerView({Key? key}) : super(key: key);
  final PlayerController playerController = Get.put(PlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(() => Text(playerController.title.value)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<PlayerController>(
        init: PlayerController(),
        builder: (controller) => Center(
          child: controller.chewieController != null &&
                  controller.chewieController!.videoPlayerController.value
                      .isInitialized
              ? Chewie(controller: controller.chewieController!)
              : Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 8),
                    Text('Loading'),
                  ],
                ),
        ),
      ),
    );
  }
}
