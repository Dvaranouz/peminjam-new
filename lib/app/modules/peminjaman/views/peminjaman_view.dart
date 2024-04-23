import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Peminjaman'),
        backgroundColor: Colors.purple.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.PROFIL);
          },
        ),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (ctx, index) {
            return _buildPeminjamanTile(state[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }

  Widget _buildPeminjamanTile(dynamic peminjaman) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
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
        child: ListTile(
          title: Text(
            "${peminjaman.buku?.judul}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text("Penulis: ${peminjaman.buku?.penulis}"),
              SizedBox(height: 6),
              Text("Penerbit: ${peminjaman.buku?.penerbit}"),
              SizedBox(height: 4),
              Text("Tanggal Pinjam: ${peminjaman.tanggalPinjam}"),
              SizedBox(height: 4),
              Text("Tanggal Kembali: ${peminjaman.tanggalKembali}"),
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${peminjaman.status}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
