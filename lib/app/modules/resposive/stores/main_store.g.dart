// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStoreBase, Store {
  final _$selectedAtom = Atom(name: '_MainStoreBase.selected');

  @override
  int get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$_MainStoreBaseActionController =
      ActionController(name: '_MainStoreBase');

  @override
  void setSelected(int i) {
    final _$actionInfo = _$_MainStoreBaseActionController.startAction(
        name: '_MainStoreBase.setSelected');
    try {
      return super.setSelected(i);
    } finally {
      _$_MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}
