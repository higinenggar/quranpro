// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranpro/home.dart';
import 'package:quranpro/widget/tasbih.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa38dbc),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_add,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xffa38dbc),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assalamualaikum',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      //fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "HAAS\nHidupkan Al Qur'an dan As Sunnah",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffCCABD8),
                          Color(0xffDF98FA),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.menu_book, color: Colors.white),
                                  Text(
                                    ' Last Read',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                'Al-Fatiah',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Ayah No: 1',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 80,
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: SvgPicture.asset(
                            'assets/svg/Quran.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        CategoryCard(
                          title: 'Jadwal Sholat',
                          images: 'assets/images/prayer.png',
                        ),
                        GestureDetector(
                          child: CategoryCard(
                            title: "Quran",
                            images: 'assets/images/quran.png',
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => HomeScreen()));
                          },
                        ),
                        CategoryCard(
                          title: "Do'a",
                          images: 'assets/images/doa.png',
                        ),
                        GestureDetector(
                          child: CategoryCard(
                            title: "Tasbih",
                            images: 'assets/images/count.png',
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => TasbihScreen()));
                          },
                        ),
                        CategoryCard(
                          title: "Info Kajian",
                          images: 'assets/images/mosque.png',
                        ),
                        CategoryCard(
                          title: "Merchandise",
                          images: 'assets/images/merch.png',
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hadist Of The Day',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffa38dbc),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          //height: 130,
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                            maxHeight: 400,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: Color(0xffa38dbc))),
                          child: Text(
                            '"Sebaik-baik manusia adalah yang paling bermanfaat bagi orang lain." (HR. Ahmad, Thabrani, dan Daruqutni).',
                            style: TextStyle(
                              color: Color(0xffa38dbc),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.count(
//         shrinkWrap: true,
//         crossAxisCount: 3,
//         childAspectRatio: .95,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//         children: <Widget>[
//           CategoryCard(
//             title: "Jadwal Sholat",
//             images: 'assets/images/prayer.png',
//           ),
//           GestureDetector(
//             child: CategoryCard(
//               title: "Quran",
//               images: 'assets/images/quran.png',
//             ),
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => HomeScreen()));
//             },
//           ),
//           CategoryCard(
//             title: "Do'a",
//             images: 'assets/images/doa.png',
//           ),
//           CategoryCard(
//             title: "Counter",
//             images: 'assets/images/count.png',
//           ),
//           CategoryCard(
//             title: "Info Kajian",
//             images: 'assets/images/mosque.png',
//           ),
//           CategoryCard(
//             title: "Merchandise",
//             images: 'assets/images/merch.png',
//           ),
//         ],
//       ),
//     );
//   }
// }

class CategoryCard extends StatelessWidget {
  final String title;
  final String images;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            images,
            scale: 1.5,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              color: Color(0xffa38dbc),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
