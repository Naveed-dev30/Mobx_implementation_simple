import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/home_screen/home_store.dart';
import 'package:mobx_example/home_screen/widgets/cart.dart';
import 'package:mobx_example/home_screen/widgets/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = HomeStore();

  @override
  void initState() {
    homeStore.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX demo'),
        centerTitle: true,
        actions: [Cart(homeStore: homeStore)],
      ),
      body: Observer(
        builder: (_) => homeStore.oProducts.isNotEmpty
            ? ListView.builder(
                itemCount: homeStore.oProducts.length,
                itemBuilder: (_, index) =>
                    Product(homeStore.oProducts[index], homeStore: homeStore),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
