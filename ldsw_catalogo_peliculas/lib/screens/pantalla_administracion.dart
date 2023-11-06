import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/eliminar_pelicula.dart';
import 'package:ldsw_catalogo_peliculas/Conexiones/firebase_obtenerDatos.dart';
import 'package:ldsw_catalogo_peliculas/screens/Agregar_Pelicula.dart';
import 'package:ldsw_catalogo_peliculas/screens/Api_Marvel.dart';
import 'package:ldsw_catalogo_peliculas/screens/Catalogo_De_Peliculas.dart';
import 'package:ldsw_catalogo_peliculas/screens/home_Screen.dart';

class pantallaadministracion extends StatefulWidget {
  @override
  State<pantallaadministracion> createState() => _pantallaadministracionState();
}

class _pantallaadministracionState extends State<pantallaadministracion> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CatalogoDePeliculas()));
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
            onTap: () {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeScreen()));
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
      body: FutureBuilder(
        future: getPeliculas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 5.0, 
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
                child: Column(children: [
                  Text(
                    'Pantalla de administración',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((contex, index) {
                          final pelicula = snapshot.data![index];
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    pelicula.titulo,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (contex) {
                                            return AlertDialog(
                                              title: Text(
                                                  "¿Estás seguro de querer eliminar ${pelicula.titulo}?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      return Navigator.pop(
                                                          contex);
                                                    },
                                                    child: Text("Cancelar")),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FutureBuilder<
                                                                        void>(
                                                                    future: eliminarPelicula(
                                                                        pelicula
                                                                            .id),
                                                                    builder:
                                                                        (contex,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                              .connectionState ==
                                                                          ConnectionState
                                                                              .done) {
                                                                        return pantallaadministracion();
                                                                      } else {
                                                                        return Center(
                                                                            child:
                                                                                CircularProgressIndicator());
                                                                      }
                                                                    })),
                                                      );
                                                    },
                                                    child: Text(
                                                        "Si, estoy seguro")),
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Color(0xFFD916A8),
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                ]),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10.0),
        child: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AgregarPelicula()));
          },
          backgroundColor: Color(0xFFD916A8),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
