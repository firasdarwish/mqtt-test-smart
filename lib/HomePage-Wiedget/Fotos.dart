// ignore_for_file: prefer_initializing_formals, unnecessary_this, prefer_final_fields, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// ignore: constant_identifier_placess

class Foto {
  final String places;
  final String image;

  Foto({
    @required places,
    @required image,
  })  : places = places,
        image = image;
}

class Fotos {
  List<Foto> _homeList = <Foto>[];
  Fotos() {
    _homeList.add(Foto(
      places: "Flower",
      image: "assets/Flower1.jpg",
    ));
    _homeList.add(Foto(
      places: "Außenbeleuchtung",
      image: "assets/Außenbeleuchtung1.jpg",
    ));
    _homeList.add(Foto(
      places: "ParkPlatz für Besucher",
      image: "assets/ParkPlatz.jpg",
    ));
    _homeList.add(Foto(
      places: "Elektroauto aufladen",
      image: "assets/elektroauto aufladen.jpg",
    ));
    _homeList.add(Foto(
      places: "Eingang",
      image: "assets/Eingang1.jpg",
    ));
  }

  List<Foto> get listt => _homeList;
}
