import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/home_screen/home_store.dart';
import 'package:mobx_example/modals/product_item.dart';

class Cart extends StatelessWidget {
  final HomeStore homeStore;
  Cart({this.homeStore});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(Icons.add_shopping_cart),
        ),
        Observer(
          builder: (_) => Container(
            margin: EdgeInsets.all(10),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: homeStore.cartItemCount > 0
                  ? Colors.yellowAccent
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                homeStore.cartItemCount > 0 ? '${homeStore.cartItemCount}' : '',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
