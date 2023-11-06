import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ldsw_catalogo_peliculas/screens/pantalla_Presentacion.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
  options: const FirebaseOptions(
    storageBucket: "catalogo-peliculas-1a983.appspot.com",
    apiKey: "AIzaSyAOuicP5DZEzM9qPW2gFAgVnrb0Z8J0U98", 
    appId: "1:506025288861:android:30d48fbcfc3fc2304ca074", 
    messagingSenderId: "506025288861", 
    projectId: "catalogo-peliculas-1a983"),
  ) : await Firebase.initializeApp();
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

