import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/firebase_obtenerDatos.dart';
import 'package:ldsw_catalogo_peliculas/screens/Api_Marvel.dart';
import 'package:ldsw_catalogo_peliculas/screens/Detalle_Pelicula_Screen.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';
import 'package:ldsw_catalogo_peliculas/screens/pantalla_administracion.dart';
import 'package:ldsw_catalogo_peliculas/widgets/Pelicula_Item.dart';

class CatalogoDePeliculas extends StatefulWidget {
  const CatalogoDePeliculas({super.key});

  @override
  State<CatalogoDePeliculas> createState() => _CatalogoDePeliculasState();
}

class _CatalogoDePeliculasState extends State<CatalogoDePeliculas> {
  //List<Pelicula> peliculas = listOfPeliculas();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          SizedBox(
            height: 80.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(206, 198, 108, 233),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _email!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CatalogoDePeliculas()));
            },
            leading: Icon(Icons.movie),
            title: Text(
              'Catálogo de películas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ApiMarvel()));
            },
            leading: Icon(Icons.person_2),
            title: Text(
              'Personajes de Marvel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pantallaadministracion()));
            },
            leading: Icon(Icons.dashboard),
            title: Text(
              'Pantalla de administración',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              _auth.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => homeScreen()));
            },
            leading: Icon(Icons.logout),
            title: Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(206, 198, 108, 233),
        title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatalogoDePeliculas()));
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
            FutureBuilder(
              future: getPeliculas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('Longitud de la lista de películas: ${snapshot.data?.length}');

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 260,
                              mainAxisSpacing: 24,
                              crossAxisSpacing: 13,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetallePeliculaScreen(
                                    pelicula: snapshot.data![index]),
                              ),
                            );
                          },
                          child: PeliculaItem(pelicula: snapshot.data![index]),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
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
