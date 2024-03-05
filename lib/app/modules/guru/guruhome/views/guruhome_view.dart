import 'package:ecobrick_app/app/cores/core_colors.dart';
import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:ecobrick_app/app/cores/core_styles.dart';
import 'package:ecobrick_app/app/data/models/home_model.dart';
import 'package:ecobrick_app/app/modules/guru/guruhome/views/main_grafik_tes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../controllers/guruhome_controller.dart';

class GuruhomeView extends GetView<GuruhomeController> {
  GuruhomeView({Key? key}) : super(key: key);
  final GuruhomeController guruhomeController = Get.put(GuruhomeController());

  List<_ChartData> data = [
    _ChartData('Quiz 1', 12),
    _ChartData('Quiz 2', 15),
    _ChartData('Quiz 3', 20),
    _ChartData('Quiz 4', 6),
  ];
  List<_ChartData> data2 = [
    _ChartData('Quiz 1', 20),
    _ChartData('Quiz 2', 10),
    _ChartData('Quiz 3', 13),
    _ChartData('Quiz 4', 16),
  ];

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Scaffold body() {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(CoreImages.backBotImage)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Syahrizal ",
                            style: CoreStyles.uTitle,
                          ),
                          Text(
                            "Guru | 13020140084 ",
                            style: CoreStyles.uSubTitle,
                          ),
                        ],
                      )),
                      Image.asset(CoreImages.logoImageSmall, width: 50),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("List Siswa",
                      style:
                          CoreStyles.uSubTitle.copyWith(color: Colors.black)),
                  Container(
                    height: 100,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            child: Image.asset(CoreImages.logoImageSmall),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemCount: 10),
                  ),
                  FutureBuilder<HomeModel>(
                    future: guruhomeController.getHomeA(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      HomeModel data = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text("Grafik Hasil Perkategori",
                              style: CoreStyles.uSubTitle
                                  .copyWith(color: Colors.black)),
                          bar2(data),
                          const SizedBox(height: 16),
                          Text("Grafik Keseluruhan Siswa",
                              style: CoreStyles.uSubTitle
                                  .copyWith(color: Colors.black)),
                          bar2(data),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bar2(HomeModel model) {
    List<_ChartData> cartDataBenar = [];
    List<_ChartData> cartDataSalah = [];

    List<String> label = model.labelA!;
    List<int> benar = model.dataxbenarA!;
    List<int> salah = model.dataxsalahA!;

    for (var i = 0; i < label.length; i++) {
      cartDataBenar.add(_ChartData(label[i], benar[i].toDouble()));
      cartDataSalah.add(_ChartData(label[i], salah[i].toDouble()));
    }
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 5),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: cartDataBenar,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Benar',
                color: CoreColor.primary),
            ColumnSeries<_ChartData, String>(
                dataSource: cartDataSalah,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Salah',
                color: Colors.redAccent),
          ])
    ]);
  }

  Center bar1(HomeModel data) {
    return Center(
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 300.0,
              maxWidth: 600.0,
            ),
            padding: const EdgeInsets.all(24.0),
            child: Chart(
              layers: layers(data),
              padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
                bottom: 12.0,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 300.0,
              maxWidth: 600.0,
            ),
            padding: const EdgeInsets.all(24.0),
            child: Chart(
              layers: layers(data),
              padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
                bottom: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ChartLayer> layers(HomeModel model) {
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 10.0,
            min: 1.0,
            textStyle: TextStyle(
              color: CoreColor.primary,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 5.0,
            max: 20.0,
            min: 0.0,
            textStyle: TextStyle(
              color: CoreColor.primary,
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartGroupBarLayer(
        items: List.generate(
          model.labelA!.length,
          (index) => [
            ChartGroupBarDataItem(
              color: const Color(0xFF8043F9),
              x: index + 7,
              value: model.dataxbenarA![index].toDouble(),
            ),
            ChartGroupBarDataItem(
              color: const Color(0xFFFF4150),
              x: index + 7,
              value: model.dataxsalahA![index].toDouble(),
            ),
          ],
        ),
        settings: const ChartGroupBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipBarShape<ChartGroupBarDataItem>(
          backgroundColor: Colors.white,
          currentPos: (item) => item.currentValuePos,
          currentSize: (item) => item.currentValueSize,
          onTextValue: (item) => '€${item.value.toString()}',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Color(0xFF8043F9),
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
