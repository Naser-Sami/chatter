import '/config/_config.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? appBar = AppBar(
  centerTitle: true,
  title: const TextWidget('C H A T T E R'),
  actions: const [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: TPadding.p16),
      child: CircleAvatar(
        radius: 20,
        child: Icon(Icons.person),
      ),
    ),
  ],
);
