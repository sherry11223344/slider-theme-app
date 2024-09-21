import 'package:color_slider/provider/darktheme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Darkthemescreen extends StatefulWidget {
  const Darkthemescreen({super.key});

  @override
  State<Darkthemescreen> createState() => _DarkthemescreenState();
}

class _DarkthemescreenState extends State<Darkthemescreen> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<DarkthemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: const Text(
        "Theme Changer",
      )),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
        ],
      ),
    );
  }
}
