import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  final count = 0.obs;
  RxString title = "".obs;

  @override
  void onInit() {
    super.onInit();

    int index = Get.arguments;
    index == 0
        ? title.value = "Cara Membuat Ecobrick"
        : index == 1
            ? title.value = "Cara Membuat Sofa Ecobrick"
            : "Cara Membuat Meja Ecobrick";

    initializedPlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  void increment() => count.value++;
  Future<void> initializedPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        "https://lp2muniprima.ac.id/videoplayback.mp4");

    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.white,
          backgroundColor: Colors.yellow,
          bufferedColor: Colors.white),
      placeholder: Container(
        color: Colors.white,
      ),
      autoInitialize: true,
    );

    update();
  }
}
