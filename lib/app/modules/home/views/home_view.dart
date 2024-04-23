import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
      init: BookController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.purple,
            currentIndex: 0,
            onTap: (int index) {
              if (index == 0) {
                Get.toNamed(Routes.HOME);
              } else if (index == 1) {
                Get.toNamed(Routes.BOOK);
              } else if (index == 2) {
                Get.toNamed(Routes.PROFIL);
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'Book',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.white,
            //Warna ikon yang dipilih
            unselectedItemColor: Colors.white30,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome User!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink.shade300,
                          border: Border.all(color: Colors.deepPurple.shade100),
                        ),
                      ),
                      Positioned(
                        height: 250,
                        right: 0,
                        bottom: 0,
                        child: Lottie.asset('lottie/anime.json'),
                      ),
                      Positioned.fill(
                        top: 35,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Makin Pintar Membaca Bersama Felix Argyle",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Hey kamu! yuk kita baca buku saja XD",
                              style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 140,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: controller.obx(
                    (state) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 0.46,
                      ),
                      itemCount: state!.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 4,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_BOOK, parameters: {
                                'id': (state[index].id ?? 0).toString(),
                                'judul': state[index].judul ?? ""
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: state[index].image ?? '',
                                      width: 180,
                                      height: 220,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  Text(
                                    "${state[index].judul} (${state[index].tanggalPublikasi})",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "${state[index].penulis} (${state[index].penerbit})",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
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
      },
    );
  }
}
