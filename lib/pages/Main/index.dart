import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm_shop/config/tab_config.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';
import 'package:hm_shop/utils/sound_util.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据，根据数据渲染页面，一般应用程序导航是不变的
  final List<Map<String, String>> _tabList = tabList;
  int _currentIndex = 0; //当前选中的索引，默认0
  @override
  void initState() {
    super.initState();
    SoundUtil.init(); //初始化音频播放器
  }

  //根据数据渲染底部导航栏
  List<BottomNavigationBarItem> _getTabWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        //正常图标
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        //选中图标
        activeIcon: Image.asset(
          _tabList[index]["activ_icon"]!,
          width: 30,
          height: 30,
        ),
        //文本
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getWidget() {
    return [HomeView(), CategoryView(), CartView(), MyView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold 是 Flutter 提供的一个组件，用于构建应用的主界面，避开安全区
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getWidget()),
      ),
      // 👇 重点在这里：用 Theme 包裹，这是底部导航栏
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.black.withValues(alpha: 0.05), // 👈 轻微点击效果
          highlightColor: Colors.transparent, // 👈 去掉灰色阴影
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 防止放大
          currentIndex: _currentIndex,
          items: _getTabWidget(),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) async {
            await SoundUtil.playClick();
            HapticFeedback.lightImpact(); // 轻震（推荐）
            setState(() {
              //SystemSound.play(SystemSoundType.click);//系统点击音效
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
