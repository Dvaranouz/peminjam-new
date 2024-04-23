import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        currentIndex: 1,
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Daftar Buku",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                controller.setSearchQuery(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cari buku....',
                hintStyle: GoogleFonts.inriaSans(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: controller.obx(
                (state) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: state!.length,
                  itemBuilder: (ctx, index) {
                    final book = state[index];
                    final bool isMatch = (book.judul
                                ?.toString()
                                ?.toLowerCase()
                                ?.contains(
                                    controller.searchQuery.toString() ?? '') ??
                            false) ||
                        (book.penulis?.toString()?.toLowerCase()?.contains(
                                controller.searchQuery.toString() ?? '') ??
                            false);

                    if (controller.searchQuery != null &&
                        controller.searchQuery!.isNotEmpty &&
                        !isMatch) {
                      return SizedBox.shrink();
                    }
                    return Card(
                      color: Color(0xffEEF5FF),
                      elevation: 4,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_BOOK, parameters: {
                            'id': (state[index].id ?? 0).toString(),
                            'judul': state[index].judul ?? ""
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              "${book.judul}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${book.penulis}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontSize: 13, color: Colors.black),
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
