import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/screens/Log_In.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  final _auth = FirebaseAuth.instance;

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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formfield,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa un nombre";
                        } else if (nameController.text.length < 3) {
                          return "Tu nombre debe tener al menos 3 caracteres";
                        }
                        return null;
                      },
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
                      obscureText: passToggle,
                      controller: passController,
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
                              UserCredential userCredential =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passController.text);

                              String usuarioID = userCredential.user!.uid;

                              await FirebaseFirestore.instance
                                  .collection('usuarios')
                                  .doc(usuarioID)
                                  .set({
                                'name': nameController.text,
                                'email': emailController.text,
                                'password': passController.text,
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Usuario registrado exitosamente')),
                              );
                              print('success');
                              nameController.clear();
                              emailController.clear();
                              passController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIn()));
                            } catch (e) {
                              String MsjError = 'Error al registrar cuenta.';
                              if (e is FirebaseAuthException) {
                                if (e.code == 'email-already-in-use') {
                                  MsjError =
                                      'El correo electrónico ya está en uso. Prueba con otro.';
                                }
                              }
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(MsjError)));
                              print('Ha ocurrido un error: $e');
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
                          'Suscribirse',
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
