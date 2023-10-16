import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/models/peliculas.dart';
import 'package:ldsw_catalogo_peliculas/screens/Detalle_Pelicula_Screen.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';
import 'package:ldsw_catalogo_peliculas/widgets/Pelicula_Item.dart';

class CatalogoDePeliculas extends StatefulWidget {
  const CatalogoDePeliculas({super.key});

  @override
  State<CatalogoDePeliculas> createState() => _CatalogoDePeliculasState();
}

class _CatalogoDePeliculasState extends State<CatalogoDePeliculas> {
  List<Pelicula> peliculas = listOfPeliculas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            carrusel(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: peliculas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 260,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 13,
                    crossAxisCount: 2
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePeliculaScreen(pelicula: peliculas[index]),),);
                    },
                    child: PeliculaItem(pelicula:peliculas[index]),
                  );
                },
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class carrusel extends StatefulWidget {
  @override
  State<carrusel> createState() => _carruselState();
}

class _carruselState extends State<carrusel> {
  List<String> CarouselSliderImages = [
    'images/your-name.jpg',
    'images/en-busca-de-la-felicidad.jpg',
  ];
  int indexActual = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: CarouselSliderImages.length,
          options: CarouselOptions(
            height: 230.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                indexActual = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(CarouselSliderImages[index]),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              )),
            );
          },
        ),
        SizedBox(height: 10.0),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(CarouselSliderImages.length, (index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: indexActual == index ? Color(0xFFD916A8) : Colors.grey,
                ),
              );
            })),
      ],
    );
  }
}
