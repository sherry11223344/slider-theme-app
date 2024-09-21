import 'package:color_slider/provider/slider_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("color changer icon"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setvalue(val);
                  });
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.green.withOpacity(value.value),
                      child: const Center(child: Text('Green')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.red.withOpacity(value.value),
                      child: const Center(child: Text('Red')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
