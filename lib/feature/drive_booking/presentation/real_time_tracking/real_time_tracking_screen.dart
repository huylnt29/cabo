import 'package:cabo_customer/core/theme/app_colors.dart';

import 'package:cabo_customer/core/widgets/no_data_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/long_message.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';

import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/cached_network_image_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/complete_scaffold_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/toast_widget.dart';

import '../../../../core/faked_data/faked_data.dart';

import '../../../../core/router/route_config.dart';
import '../../../../core/router/route_paths.dart';
import '../../../notification/presentation/bloc/notification_bloc.dart';
import '../../data/model/booking_response.dart';

class RealTimeTrackingScreen extends StatefulWidget {
  const RealTimeTrackingScreen({
    super.key,
    this.tripId,
    this.driver,
  });

  final String? tripId;
  final Driver? driver;

  @override
  State<RealTimeTrackingScreen> createState() => _RealTimeTrackingScreenState();
}

class _RealTimeTrackingScreenState extends State<RealTimeTrackingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      onLeadingPressed: () => Routes.router.navigateTo(
        context,
        RoutePath.bottomNavBar,
        clearStack: true,
      ),
      appBarBackgroundColor: AppColors.secondaryColor,
      appBarTextWidget: const Text(
        'Drive tracking',
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (widget.tripId == null || widget.driver == null) {
      return const NoDataWidget(
        message: LongMessage.foundNoDriver,
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.sf,
          vertical: 12.sf,
        ),
        child: Column(
          children: [
            buildDriverArrivalEstimation(),
            24.vertical,
            buildDriverArea(),
          ],
        ),
      );
    }
  }

  Widget buildDriverArea() {
    return RoundedContainerWidget(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetWorkImageWidget(
              imageUrl: '${FakedData.uiAvatarPath}${widget.driver?.fullName}',
            ),
          ),
          18.vertical,
          buildRowItem('Driver name', widget.driver!.fullName),
          12.vertical,
          buildRowItem('Phone', widget.driver!.phoneNumber),
          12.vertical,
          buildRowItem('Vehicle brand', widget.driver!.brand),
          12.vertical,
          buildRowItem('Vehicle number name', widget.driver!.regNo),
          // buildRowItem('Starting location', widget.driver!.realAddress),
        ],
      ),
    );
  }

  Widget buildRowItem(String key, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: AppTextStyles.text(
            AppColors.secondaryColor,
            bold: true,
          ),
        ),
        Text(
          value ?? ErrorMessage.isNotDetermined,
          style: AppTextStyles.text(
            AppColors.secondaryColor,
            bold: false,
          ),
        ),
      ],
    );
  }

  Widget buildDriverArrivalEstimation() {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) =>
          ToastWidget.show('Driver status has been updated.'),
      builder: (context, state) {
        return RoundedContainerWidget(
          boxShadowColor: AppColors.accentColor,
          child: Column(
            children: [
              buildRowItem('Remaing distance', state.driverRemainingDistance),
              12.vertical,
              buildRowItem('Remaing time', state.driverRemainingTime),
            ],
          ),
        );
      },
    );
  }
}
