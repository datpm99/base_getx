import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/pages.dart';
import '/routes/routes.dart';

class NavKeys {
  static const int notice = 0;
  static const int report = 1;
  static const int home = 2;
  static const int unit = 3;
  static const int user = 4;
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
  final String route;
  final int idNav;
  final NavItem navItem;

  NavItemData({
    required this.name,
    required this.icon,
    required this.navItem,
    required this.route,
    required this.idNav,
  });
}

class NavData {
  final List<NavItemData> myData = [
    NavItemData(
      name: 'navbar_notice',
      route: Routes.notice,
      icon: 'assets/icons/ic_notice.png',
      idNav: NavKeys.notice,
      navItem: NavItem(
        navKey: NavKeys.notice,
        getPage: GetPage(
          name: Routes.notice,
          page: () => const NoticeView(),
          binding: NoticeBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_report',
      route: Routes.report,
      icon: 'assets/icons/ic_report.png',
      idNav: NavKeys.report,
      navItem: NavItem(
        navKey: NavKeys.report,
        getPage: GetPage(
          name: Routes.report,
          page: () => const ReportView(),
          binding: ReportBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_home',
      icon: 'assets/icons/ic_home.png',
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
      name: 'navbar_unit',
      icon: 'assets/icons/ic_unit.png',
      route: Routes.unit,
      idNav: NavKeys.unit,
      navItem: NavItem(
        navKey: NavKeys.unit,
        getPage: GetPage(
          name: Routes.unit,
          page: () => const UnitView(),
          binding: UnitBinding(),
        ),
      ),
    ),
    NavItemData(
      name: 'navbar_user',
      icon: 'assets/icons/ic_user.png',
      route: Routes.user,
      idNav: NavKeys.user,
      navItem: NavItem(
        navKey: NavKeys.user,
        getPage: GetPage(
          name: Routes.user,
          page: () => const UserView(),
          binding: UserBinding(),
        ),
      ),
    ),
  ];
}
