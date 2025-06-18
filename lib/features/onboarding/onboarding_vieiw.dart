import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/network/services/prefs.dart';
import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/core/utils/assets_manager.dart';
import 'package:nawel/core/widgets/custom_button.dart';

class OnboardingVieiw extends StatefulWidget {
  const OnboardingVieiw({super.key, this.title, this.subtitle});
  final String? title;
  final String? subtitle;

  static const List<Map<String, String>> _onboardingData = [
    {
      'title': 'all-in-one delivery',
      'subtitle':
          'Order groceries, medicines, and meals delivered straight to your door',
    },
    {
      'title': 'User-to-User Delivery',
      'subtitle': 'Send or receive items from other users quickly and easily',
    },
    {
      'title': 'Sales & Discounts',
      'subtitle': 'Discover exclusive sales and deals every day',
    },
  ];

  @override
  State<OnboardingVieiw> createState() => _OnboardingVieiwState();
}

class _OnboardingVieiwState extends State<OnboardingVieiw> {
  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: OnboardingVieiw._onboardingData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(AssetsManager.bg),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(AssetsManager.ellipse),
              ),
              Positioned(
                top: 80.h,
                right: 0,
                left: 0,
                child: Image.asset(AssetsManager.nawel),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.07,
                    left: 43.w,
                    right: 43.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        OnboardingVieiw._onboardingData[index]['title'] ??
                            'Welcome to Nawel',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          OnboardingVieiw._onboardingData[index]['subtitle'] ??
                              'Discover the best way to manage your tasks and projects with Nawel.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        text: 'Get Started',
                        onPressed: () {
                          SharedPrefsService.setBool(kOnboardingSeen, true);
                          // Navigate to the next screen
                          context.pushReplacementNamed(Routes.login);
                        },
                      ),
                      SizedBox(height: 14.h),
                      Visibility(
                        visible:
                            index < OnboardingVieiw._onboardingData.length - 1,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
