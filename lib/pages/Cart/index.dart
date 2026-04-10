import 'package:flutter/material.dart';

//view代表视图组件，page代表路由组件
class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('购物车页'));
  }
}
