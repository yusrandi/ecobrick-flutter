import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  List<dynamic> listGame = <dynamic>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    initGame();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  initGame() {
    listGame.addAll([
      {
        'id': 1,
        'title': 'Quiz 1',
        'background': Colors.orange,
        'quiz': [
          {
            'soal': 'ini adalah soalnya 1',
            'a': 'ini jawaba A',
            'b': 'ini jawaba B',
            'c': 'ini jawaba C',
            'd': 'ini jawaba D',
            'benar': 'a',
          },
          {
            'soal': 'ini adalah soalnya 2',
            'a': 'ini jawaba A',
            'b': 'ini jawaba B',
            'c': 'ini jawaba C',
            'd': 'ini jawaba D',
            'benar': 'a',
          },
          {
            'soal': 'ini adalah soalnya 3',
            'a': 'ini jawaba A3',
            'b': 'ini jawaba B3',
            'c': 'ini jawaba C3',
            'd': 'ini jawaba D3',
            'benar': 'a',
          },
        ],
      },
      {
        'id': 2,
        'title': 'Quiz 2',
        'background': Colors.blue,
        'quiz': [
          {
            'soal': 'ini adalah soalnya 2',
            'a': 'ini jawaba A',
            'b': 'ini jawaba B',
            'c': 'ini jawaba C',
            'd': 'ini jawaba D',
            'benar': 'a',
          }
        ],
      },
      {
        'id': 3,
        'title': 'Quiz 3',
        'background': Colors.purple,
        'quiz': [
          {
            'soal': 'ini adalah soalnya 2',
            'a': 'ini jawaba A',
            'b': 'ini jawaba B',
            'c': 'ini jawaba C',
            'd': 'ini jawaba D',
            'benar': 'a',
          }
        ],
      },
      {
        'id': 4,
        'title': 'Quiz 4',
        'background': Colors.green,
        'quiz': [
          {
            'soal': 'ini adalah soalnya 2',
            'a': 'ini jawaba A',
            'b': 'ini jawaba B',
            'c': 'ini jawaba C',
            'd': 'ini jawaba D',
            'benar': 'a',
          }
        ],
      },
    ]);
  }
}
