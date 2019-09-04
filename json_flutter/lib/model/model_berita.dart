// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

List<ModelBerita> modelBeritaFromJson(String str) => new List<ModelBerita>.from(json.decode(str).map((x) => ModelBerita.fromJson(x)));

String modelBeritaToJson(List<ModelBerita> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBerita {
  String idBerita;
  String judulBerita;
  String isiBerita;
  String tglBerita;
  String gambarBerita;

  ModelBerita({
    this.idBerita,
    this.judulBerita,
    this.isiBerita,
    this.tglBerita,
    this.gambarBerita,
  });

  factory ModelBerita.fromJson(Map<String, dynamic> json) => new ModelBerita(
    idBerita: json["id_berita"],
    judulBerita: json["judul_berita"],
    isiBerita: json["isi_berita"],
    tglBerita: json["tgl_berita"],
    gambarBerita: json["gambar_berita"],
  );

  Map<String, dynamic> toJson() => {
    "id_berita": idBerita,
    "judul_berita": judulBerita,
    "isi_berita": isiBerita,
    "tgl_berita": tglBerita,
    "gambar_berita": gambarBerita,
  };
}
