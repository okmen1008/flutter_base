import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/views/shop_view.dart';
import 'package:flutter_base/app/page/orders/views/orders_view.dart';
import 'package:flutter_base/app/page/profile/views/profile_view.dart';
import 'package:flutter_base/app/page/ranktop/views/ranktop_view.dart';
import 'package:flutter_base/app/widgets/common_widget.dart';
import 'package:get/get.dart';
import '../home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends View {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ShopView(),
    OrdersView(),
    RankTopView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget buildPage(context) {
    return Obx(() => Stack(
      children: [
        Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                ),
                label: 'Cửa hàng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_list_outlined),
                label: 'Đơn hàng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.art_track_rounded),
                label: 'Xếp hạng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Cá nhân',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff7C4DFF),
            unselectedItemColor: Color(0xff9b9999),
            onTap: _onItemTapped,
          ),
        ),
        loading(status: controller.status.value, context: context),
      ],
    ));
  }
}
