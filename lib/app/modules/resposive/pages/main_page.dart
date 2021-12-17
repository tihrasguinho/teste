import 'package:flutter/material.dart';
import 'package:test/app/modules/resposive/pages/main_mobile.dart';
import 'package:test/app/modules/resposive/pages/main_web.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 500) {
          return MainMobile();
        } else {
          return MainWeb();
        }
      },
    );
  }
}
