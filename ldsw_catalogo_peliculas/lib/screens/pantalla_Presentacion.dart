import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';

class pantallaPresentacion extends StatefulWidget {
  @override
  State<pantallaPresentacion> createState() => _pantallaPresentacionState();
}

class _pantallaPresentacionState extends State<pantallaPresentacion> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 179, 243),
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  fontFamily: GoogleFonts.satisfy().fontFamily,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
