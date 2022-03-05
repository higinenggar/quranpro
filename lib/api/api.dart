// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranpro/model/surahmodel.dart';

class QuranApi {
  final _baseUrl = 'https://equran.id/api';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/surat'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<SurahModel> surah = it.map((e) => SurahModel.fromJson(e)).toList();

        return surah;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
