import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/di/di.dart';
import 'package:nawel/core/theme/colors_manager.dart';
import 'package:nawel/core/utils/nav_bar_config.dart';
import 'package:nawel/features/home/domain/repos/user_repo.dart';
import 'package:nawel/features/home/presentation/bloc/user_bloc.dart';
import 'package:nawel/features/home/presentation/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainNavWrapper extends StatefulWidget {
  const MainNavWrapper({super.key});

  @override
  State<MainNavWrapper> createState() => _MainNavWrapperState();
}

class _MainNavWrapperState extends State<MainNavWrapper> {
  late PersistentTabController _controller;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => UserBloc(getIt.get<UserRepo>()),
      child: const HomeView(),
    ),
    const Scaffold(body: Center(child: Text('Search'))),
    const Scaffold(body: Center(child: Text('Deliver'))),
    const Scaffold(body: Center(child: Text('Cart'))),
    const Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  void initState() {
    super.initState();
    final currentIndex = _getTabIndexFromLocation(
      GoRouter.of(context).namedLocation(NavBarConfig.tabConfigs[0].route),
    );
    _controller = PersistentTabController(initialIndex: currentIndex);
  }

  int _getTabIndexFromLocation(String location) {
    final index = NavBarConfig.tabConfigs.indexWhere(
      (tab) => location.startsWith(tab.route),
    );
    return index == -1 ? 0 : index;
  }

  void _onTabSelected(int index) {
    final targetRoute = NavBarConfig.tabConfigs[index].route;
    if (GoRouter.of(context).namedLocation(targetRoute) != targetRoute) {
      GoRouter.of(context).go(targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 85,

      context,
      controller: _controller,
      screens: _screens,
      items:
          NavBarConfig.tabConfigs
              .map(
                (tab) => PersistentBottomNavBarItem(
                  icon:
                      tab.title == 'Home'
                          ? Center(
                            child: Image.asset(tab.icon, width: 24, height: 24),
                          )
                          : Center(
                            child: SvgPicture.asset(
                              tab.icon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                  title: tab.title,

                  activeColorPrimary: ColorsManager.primaryColor,
                  inactiveColorPrimary: Colors.grey,
                ),
              )
              .toList(),

      navBarStyle: NavBarStyle.style3,
      onItemSelected: _onTabSelected,
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}
