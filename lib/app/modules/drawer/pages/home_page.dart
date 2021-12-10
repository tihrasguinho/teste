import 'package:flutter/material.dart';
import 'package:test/app/modules/drawer/models/drawer_item_model.dart';
import 'package:test/app/modules/drawer/pages/initial_page.dart';
import 'package:test/app/modules/drawer/widgets/slide_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
      showAppBar: true,
      appBarCenterTitle: true,
      appBarAnimatedIcon: true,
      appBarTitle: 'Slide Drawer',
      onItemSelected: (i) {
        print(i);
      },
      body: InitialPage(),
      items: [
        DrawerItemModel('Home', Icons.home_rounded),
        DrawerItemModel('Profile', Icons.person_rounded),
        DrawerItemModel('Settings', Icons.settings_rounded),
        DrawerItemModel('Search', Icons.search_rounded),
      ],
    );
  }
}
