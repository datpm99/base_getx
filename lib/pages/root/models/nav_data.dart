import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/pages.dart';
import '/routes/routes.dart';

class NavKeys {
  static const int animation = 0;
  static const int utility = 1;
  static const int home = 2;
  static const int chart = 3;
  static const int setting = 4;
}

class NavItem {
  final int navKey;
  final GetPage getPage;

  NavItem({required this.navKey, required this.getPage});

  PageRoute generateRoute(RouteSettings settings) {
    return GetPageRoute(
      page: getPage.page,
      routeName: getPage.name,
      binding: getPage.binding,
    );
  }
}

class NavItemData {
  final String name;
  final String icon;
  final String iconActive;
  final String route;
  final int idNav;
  final NavItem navItem;

  NavItemData({
    required this.name,
    required this.icon,
    required this.iconActive,
    required this.navItem,
    required this.route,
    required this.idNav,
  });
}

class NavData {
  final List<NavItemData> myData = [
    NavItemData(
      name: 'navbar_animation',
      route: Routes.animation,
      icon: 'assets/icons/ic_animation.png',
      iconActive: 'assets/icons/ic_animation_active.png',
      idNav: NavKeys.animation,
      navItem: NavItem(
        navKey: NavKeys.animation,
        getPage: GetPage(
          name: Routes.animation,
          page: () => const AnimationView(),
          binding: AnimationBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_utility',
      route: Routes.utility,
      icon: 'assets/icons/ic_utility.png',
      iconActive: 'assets/icons/ic_utility_active.png',
      idNav: NavKeys.utility,
      navItem: NavItem(
        navKey: NavKeys.utility,
        getPage: GetPage(
          name: Routes.utility,
          page: () => const UtilityView(),
          binding: UtilityBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_home',
      icon: 'assets/icons/ic_home.png',
      iconActive: 'assets/icons/ic_home_active.png',
      route: Routes.home,
      idNav: NavKeys.home,
      navItem: NavItem(
        navKey: NavKeys.home,
        getPage: GetPage(
          name: Routes.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'Chart',
      icon: 'assets/icons/ic_chart.png',
      iconActive: 'assets/icons/ic_chart_active.png',
      route: Routes.chart,
      idNav: NavKeys.chart,
      navItem: NavItem(
        navKey: NavKeys.chart,
        getPage: GetPage(
          name: Routes.chart,
          page: () => const ChartView(),
          binding: ChartBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_setting',
      icon: 'assets/icons/ic_setting.png',
      iconActive: 'assets/icons/ic_setting_active.png',
      route: Routes.setting,
      idNav: NavKeys.setting,
      navItem: NavItem(
        navKey: NavKeys.setting,
        getPage: GetPage(
          name: Routes.setting,
          page: () => const SettingView(),
          binding: SettingBinding(),
        ),
      ),
    ),
  ];
}
