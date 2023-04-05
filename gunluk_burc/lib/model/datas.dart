import 'package:gunluk_burc/model/web.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import 'dart:convert';

class PlanetInfo {
  final int position;
  final String? name;
  final String? iconImage;
  final String? description;
  final List<String>? images;

  PlanetInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}
