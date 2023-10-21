import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/models/Marvel_personajes.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/Api_Conexion.dart';

class ApiMarvel extends StatefulWidget {
  @override
  _ApiMarvelState createState() => _ApiMarvelState();
}

class _ApiMarvelState extends State<ApiMarvel> {
  List<Character> characters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes de Marvel'),
        backgroundColor: Color.fromARGB(206, 198, 108, 233),
      ),
      body: FutureBuilder<List<Character>>(
        future: fetchCharacter(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No se encontró ningún personaje');
          } else {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 320,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final character = snapshot.data?[index];
                return Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 224.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Material(
                                elevation: 4.0,
                                child: Image.network(
                                  character!.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Center(
                          child: Text(
                            character.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: GoogleFonts.robotoFlex().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

