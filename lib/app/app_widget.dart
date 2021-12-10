import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Teste',
      builder: asuka.builder,
      navigatorObservers: [asuka.asukaHeroController],
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    ).modular();
  }
}
