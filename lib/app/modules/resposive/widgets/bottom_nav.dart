import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key, required this.items, this.onChanged}) : super(key: key);

  final List<BottomNavItem> items;
  final ValueChanged<int>? onChanged;

  final _selected = ValueNotifier<int>(0);

  void _setSel(int i) => _selected.value = i;

  int get _sel => _selected.value;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _itemsBuilder(),
        ),
      ),
    );
  }

  List<Widget> _itemsBuilder() {
    final data = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];

      data.add(
        AnimatedBuilder(
          animation: _selected,
          builder: (context, child) {
            return IconButton(
              tooltip: item.title,
              onPressed: () {
                _setSel(i);
                if (onChanged != null) onChanged!(i);
              },
              icon: Icon(
                item.icon,
                color: _sel == i
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
              ),
            );
          },
        ),
      );
    }

    return data;
  }
}

class BottomNavItem {
  final String title;
  final IconData icon;

  BottomNavItem(this.title, this.icon);
}
