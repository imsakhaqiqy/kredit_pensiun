import 'package:flutter/material.dart';

class KreditPensiunService {
  IconData image;
  Color color;
  String title;

  KreditPensiunService({this.image, this.title, this.color});
}

class KreditPensiunServiceImage {
  Image image;
  Color color;
  String title;

  KreditPensiunServiceImage({this.image, this.title, this.color});
}

class Titled {
  String title;
  String image;

  Titled({this.title, this.image});
}
