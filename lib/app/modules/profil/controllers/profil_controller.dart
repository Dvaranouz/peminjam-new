import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

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

  void logout() async {
    await StorageProvider.write(
        StorageKey.status, "LOGOUT"); // Hapus status login
    Get.offAllNamed(Routes.LOGIN); // Navigasi kembali ke halaman login
  }
}
