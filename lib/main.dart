import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';


void main() {
  
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0)),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
       home:const  Tabs(),
      //home: const Meals(title: 'ishan', meals: dummyMeals),
    );
  }
}




