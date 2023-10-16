import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/screens/Log_In.dart';
import 'package:ldsw_catalogo_peliculas/screens/Sign_Up.dart';


class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FlickPop',
                style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: GoogleFonts.lobster().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,  
                ),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                'images/palomitas.png', 
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              estiloBoton(color: Color(0xFFD916A8), text: 'Iniciar sesión', onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));}),
              SizedBox(height: 20.0),
              estiloBoton(color: Color(0xFFD916A8), text: 'Registrarse', onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));}),
            ],
          ),
        ),
    );
  }
}

class estiloBoton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;

  const estiloBoton({required this.color, required this.text, this.onPressed,});

  @override
  Widget build(BuildContext context) {
  return Container(
    width: 200.0,
    height: 55.0,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
    ),
  );
  }
}