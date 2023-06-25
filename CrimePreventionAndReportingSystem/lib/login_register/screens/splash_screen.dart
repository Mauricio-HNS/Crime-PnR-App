import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.of(context).pushReplacementNamed('/home')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset("assets/splash_pic.png", width:300, height:500),
        )
    );
  }
}
