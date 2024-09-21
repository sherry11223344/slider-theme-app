import 'package:color_slider/provider/favourite_provider.dart';
import 'package:color_slider/screen/favourites/myfavourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScren extends StatefulWidget {
  const FavouriteScren({super.key});

  @override
  State<FavouriteScren> createState() => _FavouriteScrenState();
}

class _FavouriteScrenState extends State<FavouriteScren> {
  List<int> favitem = [];
  @override
  Widget build(BuildContext context) {
    // final favprovider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Favourite Item",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Myfavourite()));
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.favitem.contains(index)) {
                            value.removeitem(index);
                          } else {
                            value.additem(index);
                          }
                        },
                        title: Text("item $index"),
                        trailing: Icon(value.favitem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
