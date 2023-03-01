import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/global.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushReplacementNamed(context, 'random'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Animal World",
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 900,
            color: Colors.red,
            child: Image.network("${list[Random().nextInt(9)]['Image']}",
              fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }
}
