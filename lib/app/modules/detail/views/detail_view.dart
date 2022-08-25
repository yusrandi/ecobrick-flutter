import 'package:ecobrick_app/app/cores/core_colors.dart';
import 'package:ecobrick_app/app/cores/core_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_styles.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final DetailController detailController = Get.put(DetailController());
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eksplorasi Ecobrick',
                    style: CoreStyles.uTitle.copyWith(color: Colors.white),
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
                        child: detailController.index.value == 0
                            ? apaItu()
                            : detailController.index.value == 1
                                ? mengapa()
                                : detailController.index.value == 2
                                    ? manfaat()
                                    : detailController.index.value == 3
                                        ? sejarah()
                                        : detailController.index.value == 4
                                            ? pembuatan()
                                            : Container(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  apaItu() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Apa itu Ecobrick",
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    CoreImages.apaItuAImage,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Ecobrick adalah sebuah inovasi visioner yang dikembangkan sebagai solusi pengolahan limbah plastik. ",
                    style: CoreStyles.uSubTitle
                        .copyWith(color: CoreColor.secondary),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Diambil dari dua kata yaitu, eco dan brick, yang berarti bata ramah lingkungan.",
                    style: CoreStyles.uSubTitle
                        .copyWith(color: CoreColor.secondary),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Diambil dari dua kata yaitu, eco dan brick, yang berarti bata ramah lingkungan.",
                    style: CoreStyles.uSubTitle
                        .copyWith(color: CoreColor.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    CoreImages.apaItuBImage,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.orange),
              child: Text(
                " Ecobrick terbuat dari material plastik atau sampah plastik, Ecobrick ini memiliki sifat dasar dari plastik tersebut yaitu kuat, anti air, dan awet.",
                style: CoreStyles.uSubTitle.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  mengapa() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Mengapa Buat Ecobrick ?",
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.mengapaAImage,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "1. Plastik terlalu hebat untuk disia-siakan.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Text(
                "2. Ecobrick Mencegah Plastik Mencemari Biosfer.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Text(
                "3. Membuat Ecobrick Menginspirasi Kesadaran Ekologis.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "4. Ecobrick Mencegah Plastik Dari Daur Ulang Industrial.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.mengapaBImage,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Text(
                "5. Ecobrick Menyelamatkan Plastik dari Pembakaran dan Mengamankan",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "6. Ecobrick Memberdayakan Rumah Tangga, Komunitas, dan Perusahaan.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.mengapaCImage,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "7. Ecobrick Pengalih ke Kehidupan Regeneratif dan Sirkuler",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "8. Ecobrick Solusi Plastik Rendah Energi.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.mengapaDImage,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "9. Ecobrick Dapat Dimanfaatkan untuk Jangka Panjang/Waktu Tak Terbatas",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  manfaat() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Apa Manfaat Ecobrick",
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.manfaatAImage,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "Bisa digunakan untuk bahan pembuatan meja, kursi, tembok, maupun prakarya lainnya.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Bisa digunakan untuk bahan pembuatan meja, kursi, tembok, maupun prakarya lainnya.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Bisa digunakan untuk bahan pembuatan meja, kursi, tembok, maupun prakarya lainnya.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.manfaatBImage,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                CoreImages.manfaatCImage,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "Bisa digunakan untuk bahan pembuatan meja, kursi, tembok, maupun prakarya lainnya.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "Untuk menyelamatkan bumi dari limbah plastik",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                "Menjadi Mata Pencaharian Baru dengan Memberdayakan SDM.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: Container()),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                "Menjadi hobi baru.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  sejarah() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Sejarah Ecobrick",
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Istilah ecobrick pada awalnya diperkenalkan pria asal Kanada, yang bernama Russell Maier dan.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.sejarahAImage,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                CoreImages.sejarahBImage,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                " istrinya yang berasal dari Indonesia Ani Himawati Maier Indonesia tahun 2012 di Philippines dan Bali.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Pasangan suami istri ini sangat menyadari bahaya sampah plastik bagi kesehatan dan dampak buruknya terhadap lingkungan.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.sejarahCImage,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  pembuatan() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Cara Pembuatan Ecobrick",
          style: CoreStyles.uTitle
              .copyWith(color: CoreColor.secondary, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.caraAImage,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "1.	Kumpulkan sebanyak mungkin sampah-sampah berbahan plastik seperti (kantongan plastik, pembungkus snack, spanduk bekas, karung bekas dan lain-lain). Kemudian potong kecil kecil.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.caraBImage,
                height: 100,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "2.	Siapkan botol berbahan plastik seperti air mineral atau botol minuman.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.caraCImage,
                height: 100,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "3.	Masukkan sampah yang sudah terpotong kecil-kecil ke dalam botol satu demi satu.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.caraDImage,
                height: 100,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "4.	Tekan sampah plastik kedalam botol menggunakan batang kayu atau bambu hingga padat.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                CoreImages.caraEImage,
                height: 100,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                "5.	Susun botol plastik yang sudah berisi sampah plastik sesuai kebutuhan anda.",
                style:
                    CoreStyles.uSubTitle.copyWith(color: CoreColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                CoreImages.caraFImage,
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
