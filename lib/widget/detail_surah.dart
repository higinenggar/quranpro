// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_initializing_formals, no_logic_in_create_state, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_element, avoid_print
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:quranpro/model/surahmodel.dart';
import 'dart:convert';

class DetailSurah extends StatefulWidget {
  final SurahModel detail_surah;
  const DetailSurah({Key? key, required this.detail_surah}) : super(key: key);
  @override
  _DetailSurahState createState() => _DetailSurahState(detail_surah);
}

class _DetailSurahState extends State<DetailSurah> {
  AudioPlayer audioPlayer = AudioPlayer();

  List _listSurah = [];
  late SurahModel detail_surah;
  var audio = "";
  bool playing = false;

  _DetailSurahState(SurahModel detail_surah) {
    this.detail_surah = detail_surah;
  }

  Future _fetchData() async {
    var response = await get(
      Uri.parse('https://equran.id/api/surat/' + detail_surah.nomor.toString()),
      headers: {
        "Accept": 'application/json',
        "Content-type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _listSurah = jsonData['ayat'];
        audio = jsonData['audio'];
        print(audio);
        //print(_listSurah);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa38dbc),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () {},
        ),
        title: Column(
          children: <Widget>[
            Text(
              detail_surah.nmLatin,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              detail_surah.arti +
                  ' I ' +
                  detail_surah.jmlAyat.toString() +
                  ' Ayat',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              playing == false ? Icons.play_circle : Icons.pause_circle,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              getAudio();
              //await audioPlayer.play(audio);
              //print(audio);
            },
          ),
        ],
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _listSurah.length,
          itemBuilder: (context, index) {
            String tr = _listSurah[index]['tr'];
            RegExp exp =
                RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
            String parsedstring1 = tr.replaceAll(exp, '');
            return Padding(
              padding: const EdgeInsets.only(bottom: 25.0, top: 10, left: 10),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${_listSurah[index]['ar']}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 28,
                        //fontWeight: FontWeight.w600,
                        fontFamily: 'Majeed',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      parsedstring1,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'KFGQPC',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${_listSurah[index]['idn']}',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'KFGQPC',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: SvgPicture.asset('assets/svg/banner.svg')),
                      Text(
                        '${_listSurah[index]['nomor']}',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffa38dbc),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(0xffa38dbc),
              thickness: 1.0,
            );
          },
        ),
      ),
    );
  }

  void getAudio() async {
    if (playing) {
      var res = await audioPlayer.stop();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(audio);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
  }
}
