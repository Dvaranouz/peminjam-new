import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_app/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status == "logged") {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final loadingLogin = false.obs;

  login(String username, String password) async {
    loadingLogin.value = true; // Start loading

    try {
      FocusScope.of(Get.overlayContext!).unfocus();
      formKey.currentState?.save();

      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.login,
          data: dio.FormData.fromMap({
            "name": usernameController.text.toString(),
            "password": passwordController.text.toString()
          }),
        );

        if (response.statusCode == 200) {
          final ResponseLogin responseLogin =
              ResponseLogin.fromJson(response.data);
          await StorageProvider.write(
              StorageKey.idUser, "${responseLogin.data?.id}");
          await StorageProvider.write(StorageKey.status, "logged");
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }

      loadingLogin.value = false; // Stop loading
    } on dio.DioException catch (e) {
      loadingLogin.value = false; // Stop loading
      Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
    } catch (e) {
      loadingLogin.value = false; // Stop loading
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      throw Exception('Error: $e');
    }
  }
}
