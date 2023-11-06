import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/screens/Catalogo_De_Peliculas.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';

class Autenticar {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Usuario autenticado: ${userCredential.user!.uid}');
    } catch (e) {
      print('Error al iniciar sesión: $e');
      throw e;
    }
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(206, 198, 108, 233),
        title: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeScreen()));
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
                SizedBox(width: 2),
                Image.asset(
                  'images/palomitas.png',
                  height: 35.0,
                ),
              ],
            )),
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
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: _formfield,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        bool emailValido = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return "Ingresa tu correo";
                        } else if (!emailValido) {
                          return "Ingresa un correo válido";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: passController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa tu contraseña";
                        } else if (passController.text.length < 6) {
                          return "La contraseña debe tener al menos 6 caracteres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: 200.0,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formfield.currentState!.validate()) {
                            try {
                              await Autenticar().signIn(
                                emailController.text,
                                passController.text,
                              );
                              print('success');
                              emailController.clear();
                              passController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CatalogoDePeliculas()));
                            } on FirebaseAuthException catch (e) {
                              String MsjError = 'Error al iniciar sesión';

                              if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                                  MsjError =
                                      'El correo y/o la contraseña son incorrectas';
                                }
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text(MsjError),
                              )
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD916A8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Text(
                          'Comenzar',
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
