import 'package:color_slider/provider/darktheme_provider.dart';
import 'package:color_slider/provider/favourite_provider.dart';
import 'package:color_slider/provider/slider_provider.dart';
import 'package:color_slider/screen/darkthemescreen.dart';
// import 'package:color_slider/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => DarkthemeProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themechanger = Provider.of<DarkthemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themechanger.thememode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(backgroundColor: Colors.red)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                appBarTheme: const AppBarTheme(backgroundColor: Colors.teal)),
            home: const Darkthemescreen(),
          );
        }));
  }
}
