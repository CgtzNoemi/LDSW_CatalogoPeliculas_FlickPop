import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> eliminarPelicula(String documentId)  async {
  try {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('pelicula');
    DocumentReference documentReference = collectionReference.doc(documentId);

    await documentReference.delete();

    print('Pelicula eliminada exitosamente.');
  } catch (error) {
    print('Error al eliminar la película: ${error}');
  }
}
