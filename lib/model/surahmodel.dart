class SurahModel {
  final int nomor;
  final String nama;
  final String nmLatin;
  final int jmlAyat;
  final String tmptTurun;
  final String arti;
  final String deskripsi;
  final String audio;

  SurahModel({
    required this.nomor,
    required this.nama,
    required this.nmLatin,
    required this.jmlAyat,
    required this.tmptTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      nomor: json['nomor'],
      nama: json['nama'],
      nmLatin: json['nama_latin'],
      jmlAyat: json['jumlah_ayat'],
      tmptTurun: json['tempat_turun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio'],
    );
  }
}
