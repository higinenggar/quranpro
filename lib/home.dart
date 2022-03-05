// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, annotate_overrides, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'api/api.dart';
import 'widget/detail_surah.dart';
import 'model/surahmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SurahModel> listSurah = [];
  QuranApi reposurah = QuranApi();

  getData() async {
    listSurah = await reposurah.getData();
    setState(() {});
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text(
          "Haas Digital Al Qur'an",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 3.0, color: Color(0xffa38dbc))),
                labelColor: Color(0xffa38dbc),
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: 'Surah'),
                  Tab(text: 'Juz'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, left: 15),
              height: 650,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xffa38dbc), width: 0.5))),
              child: TabBarView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 25, right: 25),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listSurah.length,
                      itemBuilder: (context, index) {
                        final nomorSurah = listSurah[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailSurah(detail_surah: nomorSurah)));
                          },
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      child: SvgPicture.asset(
                                          'assets/svg/banner.svg')),
                                  Text(
                                    listSurah[index].nomor.toString(),
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffa38dbc),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            title: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      listSurah[index].nmLatin,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        color: Color(0xffa38dbc),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      listSurah[index].tmptTurun.toUpperCase() +
                                          " l " +
                                          listSurah[index].jmlAyat.toString() +
                                          " Ayat ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'OpenSans',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            trailing: Text(
                              listSurah[index].nama,
                              style: TextStyle(
                                fontFamily: 'KFGQPC',
                                fontSize: 20,
                                color: Color(0xffa38dbc),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Color(0xffa38dbc),
                        );
                      },
                    ),
                  ),
                  Text('data 2'),
                ],
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  // Widget _buildBottomNavbar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(10),
  //           topRight: Radius.circular(10),
  //         ),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.1),
  //             spreadRadius: 5,
  //             blurRadius: 20,
  //           )
  //         ]),
  //     child: ClipRRect(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20),
  //           topRight: Radius.circular(20),
  //         ),
  //         child: BottomNavigationBar(
  //           backgroundColor: Colors.white,
  //           showSelectedLabels: false,
  //           showUnselectedLabels: false,
  //           selectedItemColor: Colors.teal,
  //           unselectedItemColor: Colors.black26,
  //           items: [
  //             BottomNavigationBarItem(
  //               label: 'Home',
  //               icon: Icon(
  //                 Icons.home_outlined,
  //                 size: 30,
  //               ),
  //             ),
  //             BottomNavigationBarItem(
  //               label: 'Favorite',
  //               icon: Icon(
  //                 Icons.star_outline_rounded,
  //                 size: 30,
  //               ),
  //             ),
  //             BottomNavigationBarItem(
  //               label: 'Person',
  //               icon: Icon(
  //                 Icons.person_outline_rounded,
  //                 size: 30,
  //               ),
  //             ),
  //           ],
  //         )),
  //   );
  // }
}
