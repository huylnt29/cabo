// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:math';

import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/extensions/build_context.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
import 'package:cabo_customer/feature/trip_history/presentation/cubit/trip_history_cubit.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/cached_network_image_widget.dart';
import 'package:cabo_customer/feature/trip_history/presentation/trip_history_screen.dart';
import 'package:cabo_customer/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cabo_customer/feature/home/presentation/home_screen.dart';
import 'package:cabo_customer/feature/notification/domain/use_case/notification_use_case.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';

import '../core/faked_data/faked_data.dart';
import '../core/router/route_config.dart';
import '../core/router/route_paths.dart';
import 'drive_booking/presentation/form_booking/form_booking_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.index});
  final int? index;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  /// Controller to handle PageView and also handles initial page
  final _screenController = PageController(initialPage: 0);
  final bottomNavBarIndex = ValueNotifier<int>(0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final List<Widget> bottomBarScreens = [
    BlocProvider.value(
      value: getIt<HomeBloc>()..fetchDataForScreen(),
      child: const HomeScreen(),
    ),
    const FormBookingScreen(),
    BlocProvider.value(
      value: getIt<TripHistoryCubit>()..getTripHistory(),
      child: const TripHistoryScreen(),
    ),
  ];

  // @override
  // void dispose() {
  //   _screenController.dispose();
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    listenToForegroundMessage();
    listenToMessageInTerminatedApp();
    super.didChangeDependencies();
  }

  void listenToForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger.custom(
        Logger.yellow,
        'Got foreground message: ${message.data}',
      );
      getIt<NotificationUseCase>().handleFcmData(
        message,
        context,
      );

      if (message.notification != null) {
        Logger.custom(
          Logger.cyan,
          'Message also contains a notification: ${message.notification.toString()}',
        );
      }
    });
  }

  void listenToMessageInTerminatedApp() {
    firebaseMessaging.getInitialMessage().then((message) async {
      if (message != null) {
        getIt<NotificationUseCase>().handleFcmData(
          message,
          context,
        );
      }
    });
  }

  final List<String> screenTitles = [
    'Home',
    'Drive booking',
    'Booking history',
  ];

  Widget buildFavoriteLocationAction() {
    return IconButton(
      onPressed: () => Routes.router.navigateTo(
        context,
        RoutePath.viewFavoriteLocationScreen,
      ),
      icon: Assets.icons.favoriteLocation.svg(
        color: AppColors.accentColor,
      ),
    );
  }

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
          ).copyWith(left: 12.sf),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetWorkImageWidget(
              imageUrl: FakedData
                  .fakedAvatar[Random().nextInt(FakedData.fakedAvatar.length)],
            ),
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.primaryColor,
        actions: [
          buildFavoriteLocationAction(),
        ],
      ),
      body: PageView(
        controller: _screenController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarScreens.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              top: 18.sf,
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return AnimatedNotchBottomBar(
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
    );
  }
}
