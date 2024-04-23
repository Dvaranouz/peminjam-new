/// status : 200
/// message : "DataBuku Ditemukan"
/// data : [{"id":1,"judul":"The Namesake","kategori_id":1,"penulis":"Jhumpa Lahiri","penerbit":" Ananda Publishers","sinopsis":"Interpreter of Maladies karya Jhumpa Lahiri menjadikan penulis muda ini sebagai salah satu penulis paling cemerlang di generasinya. Cerita-ceritanya adalah salah satu dari sedikit karya debut -- dan hanya segelintir koleksinya -- yang memenangkan Hadiah Pulitzer untuk fiksi. Di antara banyak penghargaan dan penghargaan lain yang diterimanya adalah penghargaan New Yorker Debut of the Year, PEN/Hemingway Award, dan pujian kritis tertinggi atas keanggunan, ketajaman, dan kasih sayang dalam merinci kehidupan yang dipindahkan dari India ke Amerika.","image":"https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1480106986i/33917.jpg","tanggal_publikasi":"2003-09-16","created_at":"2024-02-13T01:38:35.000000Z","updated_at":"2024-02-13T01:38:35.000000Z","kategori":{"id":1,"kategori":"manga","created_at":"2024-02-21T08:14:41.000000Z","updated_at":"2024-02-29T08:14:41.000000Z"}}]

class ResponseBuku {
  ResponseBuku({
    this.status,
    this.message,
    this.data,
  });

  ResponseBuku.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }

  int? status;
  String? message;
  List<DataBuku>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// judul : "The Namesake"
/// kategori_id : 1
/// penulis : "Jhumpa Lahiri"
/// penerbit : " Ananda Publishers"
/// sinopsis : "Interpreter of Maladies karya Jhumpa Lahiri menjadikan penulis muda ini sebagai salah satu penulis paling cemerlang di generasinya. Cerita-ceritanya adalah salah satu dari sedikit karya debut -- dan hanya segelintir koleksinya -- yang memenangkan Hadiah Pulitzer untuk fiksi. Di antara banyak penghargaan dan penghargaan lain yang diterimanya adalah penghargaan New Yorker Debut of the Year, PEN/Hemingway Award, dan pujian kritis tertinggi atas keanggunan, ketajaman, dan kasih sayang dalam merinci kehidupan yang dipindahkan dari India ke Amerika."
/// image : "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1480106986i/33917.jpg"
/// tanggal_publikasi : "2003-09-16"
/// created_at : "2024-02-13T01:38:35.000000Z"
/// updated_at : "2024-02-13T01:38:35.000000Z"
/// kategori : {"id":1,"kategori":"manga","created_at":"2024-02-21T08:14:41.000000Z","updated_at":"2024-02-29T08:14:41.000000Z"}

class DataBuku {
  DataBuku({
    this.id,
    this.judul,
    this.kategoriId,
    this.penulis,
    this.penerbit,
    this.sinopsis,
    this.image,
    this.tanggalPublikasi,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  DataBuku.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    kategoriId = json['kategori_id'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    sinopsis = json['sinopsis'];
    image = json['image'];
    tanggalPublikasi = json['tanggal_publikasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori =
        json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  int? id;
  String? judul;
  int? kategoriId;
  String? penulis;
  String? penerbit;
  String? sinopsis;
  String? image;
  String? tanggalPublikasi;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['kategori_id'] = kategoriId;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['sinopsis'] = sinopsis;
    map['image'] = image;
    map['tanggal_publikasi'] = tanggalPublikasi;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    return map;
  }
}

/// id : 1
/// kategori : "manga"
/// created_at : "2024-02-21T08:14:41.000000Z"
/// updated_at : "2024-02-29T08:14:41.000000Z"

class Kategori {
  Kategori({
    this.id,
    this.kategori,
    this.createdAt,
    this.updatedAt,
  });

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    kategori = json['kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? kategori;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori'] = kategori;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
