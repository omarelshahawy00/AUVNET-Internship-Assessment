import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class TabConfig {
  final String icon;
  final String title;
  final String route;

  const TabConfig({
    required this.icon,
    required this.title,
    required this.route,
  });
}

class NavBarConfig {
  static List<TabConfig> tabConfigs = [
    const TabConfig(
      icon: AssetsManager.nawel7,
      title: 'Home',
      route: Routes.home,
    ),
    const TabConfig(
      icon: AssetsManager.actionKey,
      title: 'Categories',
      route: Routes.categories,
    ),
    const TabConfig(
      icon: AssetsManager.delivery,
      title: 'Deliver',
      route: Routes.delivery,
    ),
    const TabConfig(
      icon: AssetsManager.cart,
      title: 'Cart',
      route: Routes.cart,
    ),
    const TabConfig(
      icon: AssetsManager.user,
      title: 'Profile',
      route: Routes.profile,
    ),
  ];
}
