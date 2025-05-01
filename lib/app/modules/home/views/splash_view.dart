import 'dart:async';

import 'package:flutter/material.dart';

import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                  SizedBox(height: 10,),
                  Text("ToDo App", style: TextStyle(
                      fontFamily: 'PlayfairDisplay'
                  ),),
                ],
              )
          ),

        ],
      ),
    );
  }

}