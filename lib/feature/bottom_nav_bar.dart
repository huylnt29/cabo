// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:math';

import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/extensions/font_size_extensions.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/feature/car_booking/presentation/car_booking_screen.dart';
import 'package:cabo_customer/feature/drive_history/presentation/drive_history_screen.dart';
import 'package:cabo_customer/feature/home/data/repository/home_repository_impl.dart';
import 'package:cabo_customer/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cabo_customer/feature/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  /// Controller to handle PageView and also handles initial page
  final _screenController = PageController(initialPage: 0);
  final bottomNavBarIndex = ValueNotifier<int>(0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarScreens = [
    BlocProvider(
      create: (_) => HomeBloc(
        HomeRepositoryImpl(
          HomeRemoteDataSource(
            getIt(),
          ),
        ),
      )..fetchDataForScreen(),
      child: const HomeScreen(),
    ),
    const CarBookingScreen(),
    const DriveHistoryScreen(),
  ];

  final List<String> screenTitles = [
    'Home',
    'Drive booking',
    'Booking history',
  ];

  final fakedAvatar = [
    'https://static.vecteezy.com/system/resources/previews/001/503/756/original/boy-face-avatar-cartoon-free-vector.jpg',
    'https://toppng.com/uploads/preview/cool-avatar-transparent-image-cool-boy-avatar-11562893383qsirclznyw.png',
    'https://thumbs.dreamstime.com/b/young-woman-avatar-cartoon-character-profile-picture-young-woman-wearing-blue-t-shirt-bandana-avatar-cartoon-character-149672072.jpg',
    'https://i.pinimg.com/originals/37/0a/bb/370abbaecdac86751e2b7ef9df453f12.jpg',
    'https://i.pinimg.com/originals/51/27/26/5127260decf1999d70da97d44cc59980.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: bottomNavBarIndex,
          builder: (context, value, child) => Text(screenTitles[value]),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.sf,
            horizontal: 5.sf,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              fakedAvatar[Random().nextInt(fakedAvatar.length)],
            ),
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.primaryColor,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Assets.icons.favoriteLocation.svg(
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
      body: PageView(
        controller: _screenController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarScreens.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              top: 5.sf,
              bottom: 100.sf,
              left: 12.sf,
              right: 12.sf,
            ),
            child: bottomBarScreens[index],
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: AppColors.secondaryColor,
        showLabel: false,
        notchColor: AppColors.accentColor,
        bottomBarWidth: 500,
        durationInMilliSeconds: 200,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Assets.icons.home.svg(color: AppColors.primaryColor),
            activeItem: Assets.icons.home.svg(),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Assets.images.cabo.image(),
            activeItem: Assets.images.cabo.image(),
            itemLabel: 'Drive booking',
          ),
          BottomBarItem(
            inActiveItem:
                Assets.icons.driveHistory.svg(color: AppColors.primaryColor),
            activeItem: Assets.icons.driveHistory.svg(),
            itemLabel: 'Drive history',
          ),
        ],
        onTap: (index) {
          _screenController.jumpToPage(index);
          bottomNavBarIndex.value = index;
        },
      ),
    );
  }
}
