import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test/app/modules/resposive/stores/main_store.dart';
import 'package:test/app/modules/resposive/widgets/bottom_nav.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  _MainMobileState createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  final store = MainStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return store.pages[store.selected];
        },
      ),
      bottomNavigationBar: BottomNav(
        onChanged: (i) {
          print(i);
          store.setSelected(i);
        },
        items: [
          BottomNavItem('Home', Icons.home_rounded),
          BottomNavItem('Search', Icons.search_rounded),
          BottomNavItem('Favorites', Icons.favorite_rounded),
          BottomNavItem('Profile', Icons.person_rounded),
        ],
      ),
    );
  }
}
