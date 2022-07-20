// ignore_for_file: prefer_initializing_formals, unnecessary_this, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// ignore: constant_identifier_names

class Item {
  final String name;
  final String image;

  Item({
    @required name,
    @required image,
  })  : name = name,
        image = image;
}

class Items {
  List<Item> _homeList = <Item>[];
  Items() {
    _homeList.add(Item(
      name: "SmartFlower",
      image: "assets/Flower.jpg",
    ));
    _homeList.add(Item(
      name: "Außenbeleuchtung",
      image: "assets/Außenbeleuchtung.jpg",
    ));
    _homeList.add(Item(
      name: "Parken",
      image: "assets/ParkPBesucher.jpg",
    ));
    _homeList.add(Item(
      name: "Räume",
      image: "assets/Firma.jpg",
    ));
  }

  List<Item> get list => _homeList;
}
