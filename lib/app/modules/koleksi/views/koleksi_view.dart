import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<BookController>(); // Ganti BookController sesuai dengan nama controller Anda
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Daftar Buku yang di Koleksi'),
        backgroundColor: Color(0xffE1BEE7),
        leading: IconButton(
          onPressed: () {
            Routes.PROFIL;
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0), // Menambahkan padding kiri dan kanan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: controller.obx(
                (state) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Mengatur jumlah kolom
                    mainAxisSpacing: 1.0, // Spasi vertikal antara item
                    crossAxisSpacing: 1.0, // Spasi horizontal antara item
                    childAspectRatio:
                        0.6, // Rasio lebar-ke-tinggi setiap item, membuat item berbentuk persegi
                  ),
                  itemCount: state!.length,
                  itemBuilder: (ctx, index) {
                    final book = state[index];
                    // Periksa apakah judul atau penulis buku mengandung teks pencarian
                    final bool isMatch = (book.judul
                                ?.toString()
                                ?.toLowerCase()
                                ?.contains(
                                    controller.searchQuery.toString() ?? '') ??
                            false) ||
                        (book.penulis?.toString()?.toLowerCase()?.contains(
                                controller.searchQuery.toString() ?? '') ??
                            false);

                    // Tampilkan item hanya jika judul atau penulis cocok dengan teks pencarian
                    if (controller.searchQuery != null &&
                        controller.searchQuery!.isNotEmpty &&
                        !isMatch) {
                      return SizedBox.shrink(); // Item kosong jika tidak cocok
                    }
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL_BOOK,
                            parameters: {
                              'id': (state[index].id ?? 0).toString(),
                              'judul': state[index].judul ?? ""
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(0, 2),
                                        blurRadius: 5)
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  alignment: Alignment.center,
                                  width: media.width * 0.35,
                                  height: media.width * 0.5,
                                  imageUrl: state[index].image ?? '',
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${state[index].judul} ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "by ${state[index].penulis} ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.catamaran(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
