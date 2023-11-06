import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/models/peliculas.dart';

class PeliculaItem extends StatelessWidget {
  final Pelicula pelicula;
  const PeliculaItem({required this.pelicula, super.key});

  @override
  Widget build(BuildContext context) {
    print('URL almacenada en la base de datos: ${pelicula.imagenUrl}');

    return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  pelicula.imagenUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),

              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 45.0,
              alignment: Alignment.center,
              child: Text(
                pelicula.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.robotoFlex().fontFamily,
                ),
              ),
            )
          ],
        ));
  }
}
