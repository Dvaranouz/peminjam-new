import 'package:peminjam_perpustakaan_app/app/data/provider/storage_provider.dart';

class Endpoint {
  static const String baseUrlApi = "http://127.0.0.1:8000/api/";

  static const String login = "${baseUrlApi}login";
  static const String register = "${baseUrlApi}register";
  static const String book = "${baseUrlApi}buku";
  static const String detailbook = "${baseUrlApi}buku";
  static const String pinjam = "${baseUrlApi}pinjam";
  static const String profil = "${baseUrlApi}profil";
  static const String detailpinjam = "${baseUrlApi}detailpinjam";
  static const String koleksi = "${baseUrlApi}koleksi";
}
