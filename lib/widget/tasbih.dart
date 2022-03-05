// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa38dbc),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Tasbih Digital',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffa38dbc),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Anda bisa menggunakan ini sebagai penghitung dzikir dan segala sesuatu yang butuh hitungan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    '$_counter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 150,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.refresh,
                          size: 45,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _counter = 0;
                          });
                        },
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 45,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
