import 'package:flutter/material.dart';

class Category {
  late final String id;
  late final String title;
  late final Color color;

  Category({
    required this.id,
    required this.title,
    this.color = Colors.orange
  });

}