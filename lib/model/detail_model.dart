class DetailSurahModel {
  DetailSurahModel({
    required this.ayat,
  });

  List<Ayat> ayat;
}

class Ayat {
  Ayat({
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  String nomor;
  String ar;
  String tr;
  String idn;
}
