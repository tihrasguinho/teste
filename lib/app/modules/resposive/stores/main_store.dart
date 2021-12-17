import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  final pages = <Widget>[
    Center(child: Text('HOME')),
    Center(child: Text('SEARCH')),
    Center(child: Text('FAVORITES')),
    Center(child: Text('PROFILE')),
  ];

  @observable
  var selected = 0;

  @action
  void setSelected(int i) => selected = i;
}
