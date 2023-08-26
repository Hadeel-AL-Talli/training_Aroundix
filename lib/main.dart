import 'package:clean_architecture/features/random_activity/display/provider/random_activity_provider.dart';
import 'package:clean_architecture/features/random_activity/display/provider/selected_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/random_activity/display/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (context)=> RandomActivityProvider()),
      ChangeNotifierProvider(create: (context)=>SelectedPageProvider())

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Boring App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        color: Colors.transparent,
        elevation: 0,

      iconTheme: IconThemeData(
        color:Colors.black87
      )
        )
      ),

      home: const Home(),
    ),
    
    
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}