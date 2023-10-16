import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/models/peliculas.dart';

class DetallePeliculaScreen extends StatefulWidget {
  final Pelicula pelicula;

  DetallePeliculaScreen({required this.pelicula});

  @override
  State<DetallePeliculaScreen> createState() => _DetallePeliculaScreenState();
}

class _DetallePeliculaScreenState extends State<DetallePeliculaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pelicula.titulo),
        backgroundColor: Color.fromARGB(206, 198, 108, 233),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                      child: Image.asset(
                        'images/${widget.pelicula.imagenUrl}',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                widget.pelicula.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: GoogleFonts.robotoFlex().fontFamily,
                ),
              ),
              SizedBox(height: 10.0),
              Wrap(children: [
                Text(
                  'Director: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
                Text(
                  widget.pelicula.director,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
              ]),
              SizedBox(height: 10.0),
              Wrap(children: [
                Text(
                  'Año de estreno: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
                Text(
                  widget.pelicula.anio.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
              ]),
              SizedBox(height: 10.0),
              Wrap(children: [
                Text(
                  'Duración: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
                Text(
                  widget.pelicula.duracion,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
              ]),
              SizedBox(height: 10.0),
              Wrap(children: [
                Text(
                  'Género: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
                Text(
                  widget.pelicula.genero,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.robotoFlex().fontFamily,
                  ),
                ),
              ]),
              SizedBox(height: 10.0),
              Text(
                'Sinopsis: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.robotoFlex().fontFamily,
                ),
              ),
              Text(
                widget.pelicula.sinopsis,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.robotoFlex().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
