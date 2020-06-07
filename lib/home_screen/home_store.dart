import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../modals/product_item.dart';
part 'home_store.g.dart';

class HomeStore extends _HomeStore with _$HomeStore {}

abstract class _HomeStore with Store {
  var oProducts = ObservableList<ProductItem>();

  var cartProducts = ObservableList<ProductItem>();

  void addItemToCart(ProductItem item) {
    cartProducts.add(item);
  }

  void removeFromList(ProductItem item) {
    oProducts.removeWhere((oItem) => oItem.url == item.url);
  }

  @computed
  int get cartItemCount => cartProducts.length;

  @action
  Future<void> getData() async {
    final url = "https://fakestoreapi.com/products?limit=30";
    final dio = Dio();
    final result = await dio.get('$url');
    final jsonList = List<Map<String, dynamic>>.from(result.data);
    var products = <ProductItem>[];
    try {
      for (final json in jsonList) {
        products.add(
          ProductItem(
            cost: double.tryParse(json['price'].toString()),
            tag: json['title'],
            url: json['image'],
          ),
        );
      }
    } catch (e) {
      print('Error encountered: $e');
      //product items are sample local data
      oProducts.addAll(productItems);
    }

    oProducts.addAll(products);
  }
}
