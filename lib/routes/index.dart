// 路由配置
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getWidget() {
  return MaterialApp(
    initialRoute: '/',
    //命名路由
    routes: getRoutes(),
  );
}

//返回该APP的路由配置
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/': (context) => MainPage(), //首页
    '/login': (context) => LoginPage(), //登录页
  };
}
