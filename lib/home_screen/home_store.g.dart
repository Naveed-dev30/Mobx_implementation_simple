// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<int> _$cartItemCountComputed;

  @override
  int get cartItemCount =>
      (_$cartItemCountComputed ??= Computed<int>(() => super.cartItemCount,
              name: '_HomeStore.cartItemCount'))
          .value;

  final _$getDataAsyncAction = AsyncAction('_HomeStore.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
cartItemCount: ${cartItemCount}
    ''';
  }
}
