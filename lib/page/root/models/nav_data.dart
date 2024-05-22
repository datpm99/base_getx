class NavKeys {
  static const int animation = 0;
  static const int utility = 1;
  static const int home = 2;
  static const int chart = 3;
  static const int setting = 4;
}

class NavItemData {
  final int navId;
  final String icon;
  final String iconActive;
  final String name;

  NavItemData({
    required this.navId,
    required this.icon,
    required this.iconActive,
    required this.name,
  });
}

class NavData {
  final List<NavItemData> myData = [
    NavItemData(
      navId: NavKeys.animation,
      icon: 'assets/icons/ic_animation.png',
      iconActive: 'assets/icons/ic_animation_active.png',
      name: 'navbar_animation',
    ),
    NavItemData(
      navId: NavKeys.utility,
      icon: 'assets/icons/ic_utility.png',
      iconActive: 'assets/icons/ic_utility_active.png',
      name: 'navbar_utility',
    ),
    NavItemData(
      navId: NavKeys.home,
      icon: 'assets/icons/ic_home.png',
      iconActive: 'assets/icons/ic_home_active.png',
      name: 'navbar_home',
    ),
    NavItemData(
      navId: NavKeys.chart,
      icon: 'assets/icons/ic_chart.png',
      iconActive: 'assets/icons/ic_chart_active.png',
      name: 'Chart',
    ),
    NavItemData(
      navId: NavKeys.setting,
      icon: 'assets/icons/ic_setting.png',
      iconActive: 'assets/icons/ic_setting_active.png',
      name: 'navbar_setting',
    ),
  ];
}
