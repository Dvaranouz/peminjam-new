import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_buku.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class KoleksiController extends GetxController with StateMixin<List<DataBuku>> {
  //TODO: Implement KoleksiController
  var searchQuery = ''.obs; // Gunakan obs dari GetX untuk membuatnya reactive

  //TODO: Implement BookController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
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

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
          "${Endpoint.koleksi}/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponseBuku responseBuku = ResponseBuku.fromJson(response.data);
        if (responseBuku.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          if (searchQuery.isEmpty) {
            // Jika query pencarian kosong, tampilkan semua data
            change(responseBuku.data, status: RxStatus.success());
          } else {
            // Jika query pencarian tidak kosong, filter data berdasarkan query
            final filteredData = responseBuku.data!
                .where((book) => book.judul!
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
                .toList();
            if (filteredData.isEmpty) {
              change(null, status: RxStatus.empty());
            } else {
              change(filteredData, status: RxStatus.success());
            }
          }
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      change(null, status: RxStatus.error("Error : $e"));
    }
  }

  void clearSearch() {
    searchQuery.value = ''; // Mengubah nilai searchQuery menjadi string kosong
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    getData(); // Panggil method getData() setiap kali nilai pencarian berubah
  }
}
