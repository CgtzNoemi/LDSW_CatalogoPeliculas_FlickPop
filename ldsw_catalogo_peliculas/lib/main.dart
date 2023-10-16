import 'package:flutter/material.dart';
import 'package:ldsw_catalogo_peliculas/screens/pantalla_Presentacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 225, 179, 243),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
      ),
      home: pantallaPresentacion(),
    );
  }
}

