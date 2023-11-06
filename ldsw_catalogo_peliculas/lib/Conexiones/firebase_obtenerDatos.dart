
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ldsw_catalogo_peliculas/models/peliculas.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Pelicula>> getPeliculas() async {
  List<Pelicula> peliculas = [];

  CollectionReference collectionReferencePelicula = db.collection('pelicula');

  QuerySnapshot queryPelicula = await collectionReferencePelicula.get();

  queryPelicula.docs.forEach((documento) 
  { 
      Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
      Pelicula pelicula = Pelicula.fromMap(data, documento.id);
      peliculas.add(pelicula);
  });

  return peliculas;
}