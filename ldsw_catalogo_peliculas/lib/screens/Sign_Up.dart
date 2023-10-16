import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/screens/Log_In.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';



class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(206, 198, 108, 233),
        title: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
          },
          child: Row(
            children: [
              Text(
                'FlickPop',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: GoogleFonts.lobster().fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, 
                ),
              ),
              SizedBox(width:2),
              Image.asset('images/palomitas.png',
              height: 35.0,
              ),
            ],
          )
        ),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Registro',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nombre de usuario',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), 
                          ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), 
                          ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0), 
                          ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: 200.0,
                      height: 55.0,
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD916A8), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text('Suscribirse',
                        style: TextStyle(
                          fontSize: 25.0, 
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

