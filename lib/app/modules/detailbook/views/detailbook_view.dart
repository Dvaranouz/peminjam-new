import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';
import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 30,
              height: 30,
              child: Image.asset(
                "logorl.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: HexColor('#c4a8ff'),
      body: controller.obx((state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              for (int index = 0; index < state!.length; index++)
                SliverPadding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                // Your decoration here
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: state[index].image ?? '',
                                          width: 200,
                                          height: 300,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${state[index].judul}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            // Ukuran font judul yang lebih besar
                                            fontWeight: FontWeight.bold,
                                            // Berat huruf tebal untuk menonjolkan judul
                                            color: Colors
                                                .deepPurple, // Warna judul yang mencolok
                                          ),
                                        ),
                                        Text(
                                          "Penulis: ${state[index].penulis}\n" // Tambahkan baris baru untuk tanggal
                                          "Tanggal Publikasi: ${state[index].tanggalPublikasi}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            // Ukuran font penulis dan tanggal publikasi
                                            color: Colors
                                                .black87, // Warna yang konsisten dengan tema
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Text(
                                              "${state[index].sinopsis}",
                                              textAlign: TextAlign.justify,
                                              // Teks rata kanan dan kiri
                                              style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                // Ukuran font sinopsis
                                                color: Colors.black87,
                                                // Warna yang konsisten dengan tema
                                                height:
                                                    1.5, // Tinggi baris yang disesuaikan untuk kenyamanan membaca
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Form(
                                            key: controller.formKey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20.0, left: 20.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .ADD_PEMINJAMAN,
                                                              parameters: {
                                                                'id': (state[index]
                                                                            .id ??
                                                                        0)
                                                                    .toString(),
                                                                'judul': state[
                                                                            index]
                                                                        .judul ??
                                                                    ""
                                                              });
                                                        },
                                                        child: Container(
                                                          width: 300,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Color(
                                                                0xffE1BEE7),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Pinjam',
                                                              style: GoogleFonts
                                                                  .inriaSans(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: IconButton(
                                                    icon: Icon(Icons.favorite),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      controller.post();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state[index].ulasan?.length ?? 0,
                                  itemBuilder: (ctx, ulasanIndex) {
                                    var ulasan =
                                        state[index].ulasan![ulasanIndex];
                                    var userName = ulasan.user != null
                                        ? ulasan.user!.name ?? ''
                                        : '';
                                    var rating = ulasan.rating ?? 0;

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12.0),
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '$userName',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (index) => Icon(
                                                      index < rating
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      color: Colors.amber,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '" ${ulasan.ulasan ?? ''}"',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: state.length,
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
