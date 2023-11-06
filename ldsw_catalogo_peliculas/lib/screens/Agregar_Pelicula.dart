import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/Upload_image.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/select_image.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';
import 'package:ldsw_catalogo_peliculas/screens/pantalla_administracion.dart';

class AgregarPelicula extends StatefulWidget {
  @override
  State<AgregarPelicula> createState() => _AgregarPeliculaState();
}

class _AgregarPeliculaState extends State<AgregarPelicula> {
  final _formfield = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final directorController = TextEditingController();
  final anioController = TextEditingController();
  final duracionController = TextEditingController();
  final generoController = TextEditingController();
  final sinopsisController = TextEditingController();
  File? imagen_to_upload;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                        'Añadir película',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: tituloController,
                        decoration: InputDecoration(
                          labelText: 'Título',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.title),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa el titulo de la película";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: directorController,
                        decoration: InputDecoration(
                          labelText: 'Director',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.person_2_rounded),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa el nombre del director";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: anioController,
                        decoration: InputDecoration(
                          labelText: 'Año de estreno',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.date_range),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa el año de estreno";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: duracionController,
                        decoration: InputDecoration(
                          labelText: 'Duración',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.timelapse),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa la duración";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: generoController,
                        decoration: InputDecoration(
                          labelText: 'Género',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.type_specimen),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa el año de estreno";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: sinopsisController,
                        decoration: InputDecoration(
                          labelText: 'Sinopsis',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: Icon(Icons.summarize),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa la sinopsis";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0),
                      imagen_to_upload != null
                          ? Image.file(imagen_to_upload!)
                          : Container(
                              height: 100,
                              color: Colors.grey,
                              child: Center(
                                child: Icon(Icons.image, color: Colors.white,),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: () async {
                          final XFile? imagen = await getImage();

                          setState(() {
                            imagen_to_upload = File(imagen!.path);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD916A8),
                          
                        ),
                        child: Text('Seleccionar imagen'),
                      ),
                      Container(
                        width: 200.0,
                        height: 55.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (imagen_to_upload == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Sube una imagen")));
                              return;
                            }

                            if (_formfield.currentState!.validate()) {
                              final uploaded =
                                  await uploadImage(imagen_to_upload!);
                              String anioEstreno = anioController.text;
                              print(uploaded);
                              try {
                                int ValorAnio = int.parse(anioEstreno);
                                FirebaseFirestore firestore =
                                    FirebaseFirestore.instance;
                                await firestore.collection('pelicula').add({
                                  'titulo': tituloController.text,
                                  'director': directorController.text,
                                  'anio': ValorAnio,
                                  'duracion': duracionController.text,
                                  'genero': generoController.text,
                                  'sinopsis': sinopsisController.text,
                                  'imagenUrl': uploaded,
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Película añadida exitosamente")));

                                tituloController.clear();
                                directorController.clear();
                                anioController.clear();
                                duracionController.clear();
                                generoController.clear();
                                sinopsisController.clear();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            pantallaadministracion()));
                              } catch (e) {
                                print('Error al agregar la película: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Error al cargar la película")));
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
                            'Añadir',
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
      ),
    );
  }
}
