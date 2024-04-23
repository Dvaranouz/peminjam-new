import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tglkembaliController = TextEditingController();
  final idUser = StorageProvider.read(StorageKey.idUser);
  final idBuku = Get.parameters['id'].toString();

  //TODO: Implement LoginController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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

  final loading = false.obs;

  Future<void> post() async {
    loading(true);
    print('tglkembaliController value: ${tglkembaliController.text}');
    print('user_id: $idUser');
    print('book_id: $idBuku');
    // print('tglkembaliController value: ${}');
    if (tglkembaliController.text.isEmpty || idUser.isEmpty || idBuku.isEmpty) {
      Get.snackbar("Sorry", "Simpan Gagal", backgroundColor: Colors.orange);
    } else {
      final response =
          await ApiProvider.instance().post(Endpoint.pinjam, data: {
        "tanggal_kembali": tglkembaliController.text.toString(),
        "user_id": int.parse(idUser),
        "book_id": int.parse(idBuku)
      });
      if (response.statusCode == 200) {
        Get.back();
      } else {
        Get.snackbar("Sorry", "Simpan Gagal", backgroundColor: Colors.orange);
      }
    }
    loading(false);
  }
}
