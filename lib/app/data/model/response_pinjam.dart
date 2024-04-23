/// status : true
/// message : "DataPinjam Ditemukan"
/// data : [{"id":1,"user_id":"1","book_id":"1","tanggal_pinjam":"2024-01-31","tanggal_kembali":"2024-02-12","status":"DIPINJAM","created_at":"2024-01-31T04:03:29.000000Z","updated_at":"2024-01-31T04:03:29.000000Z","user":{"id":1,"name":"alif","email":"alif@gmail.com","email_verified_at":null,"created_at":"2024-01-23T03:46:20.000000Z","updated_at":"2024-01-23T03:46:20.000000Z"},"buku":{"id":1,"judul":"One Piece1","kategori_id":1,"penulis":"Oda1","penerbit":"oda1","image":null,"tanggal_publikasi":"1998-06-11","created_at":"2024-02-13T01:38:35.000000Z","updated_at":"2024-02-13T01:38:35.000000Z"}}]

class ResponsePinjam {
  ResponsePinjam({
    this.status,
    this.message,
    this.data,
  });

  ResponsePinjam.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }

  bool? status;
  String? message;
  List<DataPinjam>? data;

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
/// user_id : "1"
/// book_id : "1"
/// tanggal_pinjam : "2024-01-31"
/// tanggal_kembali : "2024-02-12"
/// status : "DIPINJAM"
/// created_at : "2024-01-31T04:03:29.000000Z"
/// updated_at : "2024-01-31T04:03:29.000000Z"
/// user : {"id":1,"name":"alif","email":"alif@gmail.com","email_verified_at":null,"created_at":"2024-01-23T03:46:20.000000Z","updated_at":"2024-01-23T03:46:20.000000Z"}
/// buku : {"id":1,"judul":"One Piece1","kategori_id":1,"penulis":"Oda1","penerbit":"oda1","image":null,"tanggal_publikasi":"1998-06-11","created_at":"2024-02-13T01:38:35.000000Z","updated_at":"2024-02-13T01:38:35.000000Z"}

class DataPinjam {
  DataPinjam({
    this.id,
    this.userId,
    this.bookId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.buku,
  });

  DataPinjam.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }

  int? id;
  String? userId;
  String? bookId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }
}

/// id : 1
/// judul : "One Piece1"
/// kategori_id : 1
/// penulis : "Oda1"
/// penerbit : "oda1"
/// image : null
/// tanggal_publikasi : "1998-06-11"
/// created_at : "2024-02-13T01:38:35.000000Z"
/// updated_at : "2024-02-13T01:38:35.000000Z"

class Buku {
  Buku({
    this.id,
    this.judul,
    this.kategoriId,
    this.penulis,
    this.penerbit,
    this.image,
    this.tanggalPublikasi,
    this.createdAt,
    this.updatedAt,
  });

  Buku.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    kategoriId = json['kategori_id'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    image = json['image'];
    tanggalPublikasi = json['tanggal_publikasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? judul;
  int? kategoriId;
  String? penulis;
  String? penerbit;
  dynamic image;
  String? tanggalPublikasi;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['kategori_id'] = kategoriId;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['image'] = image;
    map['tanggal_publikasi'] = tanggalPublikasi;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// name : "alif"
/// email : "alif@gmail.com"
/// email_verified_at : null
/// created_at : "2024-01-23T03:46:20.000000Z"
/// updated_at : "2024-01-23T03:46:20.000000Z"

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
