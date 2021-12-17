import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Modular.to.navigate('/drawer'),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  'Drawer App',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Modular.to.navigate('/responsive'),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  'Responsive Layout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Modular.to.navigate('/notifiers'),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  'Notifiers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Modular.to.navigate('/hooks'),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  'Hooks',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Modular.to.navigate('/web'),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  'Web',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
