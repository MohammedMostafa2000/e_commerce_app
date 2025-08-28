import 'package:e_commerce_app/core/assets_manager.dart';
import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/categories/categories.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/home/home.dart';
import 'package:e_commerce_app/mainLayout/presentation/tabs/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    Home(),
    Categories(),
    Wishlist(),
    Center(child: Text('Profile')),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          buildBottomNavBarItem(
            activeIcon: IconsManager.activeHome,
            icon: IconsManager.home,
          ),
          buildBottomNavBarItem(
            activeIcon: IconsManager.activeCategories,
            icon: IconsManager.categories,
          ),
          buildBottomNavBarItem(
            activeIcon: IconsManager.activeWishlist,
            icon: IconsManager.wishlist,
          ),
          buildBottomNavBarItem(
            activeIcon: IconsManager.activeProfile,
            icon: IconsManager.profile,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required String activeIcon,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        margin: EdgeInsets.zero,
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(color: ColorsManager.white, shape: BoxShape.circle),
        child: Image.asset(
          activeIcon,
          height: 24.h,
          width: 24.w,
        ),
      ),
      icon: Image.asset(
        icon,
        height: 24.h,
        width: 24.w,
      ),
      label: '',
    );
  }
}
