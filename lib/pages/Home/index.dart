import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/Hmhot.dart';
import 'package:hm_shop/components/Home/Hmsuggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getSliversChildren() {
    return [
      //包裹普通widget的sliver组件
      SliverToBoxAdapter(child: HmSlider()),
      SliverToBoxAdapter(child: SizedBox(height: 10)), //分类间距
      //SliverGrid和SliverList 只能纵向不能横向滚动
      SliverToBoxAdapter(child: HmCategory()), //分类
      SliverToBoxAdapter(child: SizedBox(height: 10)), //分类间距
      SliverToBoxAdapter(child: HmSuggestion()), //商品
      SliverToBoxAdapter(child: SizedBox(height: 10)), //商品间距
      //Flex组件 可以实现水平方向的滚动-首页热门组件-内边距
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ), //商品推荐
      SliverToBoxAdapter(child: SizedBox(height: 10)), //商品间距
      HmMoreList(), //无限滚动列表
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //physics: ClampingScrollPhysics(), // 👈 关键，禁止拉伸
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: _getSliversChildren(),
    );
  }
}
