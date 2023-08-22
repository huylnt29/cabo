import 'package:cabo_customer/core/enums/payment_method.dart';
import 'package:cabo_customer/core/enums/vehicle_type.dart';
import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/location_searching/location_searching_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/button_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/toast_widget.dart';

import '../../../../core/router/route_config.dart';
import '../../../../core/router/route_paths.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../bloc/drive_booking_bloc.dart';

class FormBookingScreen extends StatefulWidget {
  const FormBookingScreen({super.key});

  @override
  State<FormBookingScreen> createState() => _FormBookingScreenState();
}

class _FormBookingScreenState extends State<FormBookingScreen> {
  final driveBookingBloc = getIt<DriveBookingBloc>();
  final vehicleTypeIndex = ValueNotifier(0);
  final paymentMethodIndex = ValueNotifier(0);
  Address? fromLocation;
  Address? toLocation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLocationArea(),
          24.vertical,
          Text(
            'Vehicle type',
            style: AppTextStyles.heading3(AppColors.textColor),
          ),
          12.vertical,
          buildVehicleTypeArea(),
          24.vertical,
          Text(
            'Payment method',
            style: AppTextStyles.heading3(AppColors.textColor),
          ),
          12.vertical,
          buildPaymentMethodArea(),
          BlocProvider.value(
            value: driveBookingBloc,
            child: buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  Widget buildLocationArea() {
    return RoundedContainerWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Your starting place',
                style: AppTextStyles.heading3(AppColors.textColor),
              ),
              ButtonWidget(
                margin: EdgeInsets.zero,
                title: fromLocation?.address ?? 'Pick a place',
                onPressed: () async {
                  final response = await Routes.router.navigateTo(
                    context,
                    RoutePath.locationSearchingScreen,
                    routeSettings: const RouteSettings(
                      arguments: LocationSearchingPurpose.bookingToLocation,
                    ),
                  );
                  setState(() {
                    fromLocation = response;
                  });
                },
                titleColor: AppColors.textColor,
                backgroundColor: AppColors.purpleBackgroundColor,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Your destination',
                style: AppTextStyles.heading3(AppColors.textColor),
              ),
              ButtonWidget(
                margin: EdgeInsets.zero,
                title: toLocation?.address ?? 'Pick a place',
                onPressed: () async {
                  final response = await Routes.router.navigateTo(
                    context,
                    RoutePath.locationSearchingScreen,
                    routeSettings: const RouteSettings(
                      arguments: LocationSearchingPurpose.bookingToLocation,
                    ),
                  );
                  setState(() {
                    toLocation = response;
                  });
                },
                titleColor: AppColors.textColor,
                backgroundColor: AppColors.purpleBackgroundColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildVehicleTypeArea() {
    return SizedBox(
      height: 75.sf,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => buildVehicleTypeItem(
          VehicleType.values[index],
          index,
        ),
        separatorBuilder: (context, index) => 12.horizontal,
        itemCount: VehicleType.values.length,
      ),
    );
  }

  Widget buildVehicleTypeItem(VehicleType vehicleType, int index) {
    return ValueListenableBuilder(
      valueListenable: vehicleTypeIndex,
      builder: (context, value, child) => SizedBox(
        width: 160.sf,
        child: RoundedContainerWidget(
          boxShadowColor: (value == index) ? AppColors.accentColor : null,
          child: InkWell(
            onTap: () => vehicleTypeIndex.value = index,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vehicleType.illustration,
                15.horizontal,
                Text(
                  vehicleType.text,
                  style: AppTextStyles.text(
                    AppColors.textColor,
                    bold: (value == index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentMethodArea() {
    return SizedBox(
      height: 75.sf,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => buildPaymentMethodItem(
          PaymentMethod.values[index],
          index,
        ),
        separatorBuilder: (context, index) => 12.horizontal,
        itemCount: PaymentMethod.values.length,
      ),
    );
  }

  Widget buildPaymentMethodItem(PaymentMethod paymentMethod, int index) {
    return ValueListenableBuilder(
      valueListenable: paymentMethodIndex,
      builder: (context, value, child) => SizedBox(
        width: 140.sf,
        child: RoundedContainerWidget(
          boxShadowColor: (value == index) ? AppColors.accentColor : null,
          child: InkWell(
            onTap: () => paymentMethodIndex.value = index,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentMethod.illustration,
                15.horizontal,
                Text(
                  paymentMethod.text,
                  style: AppTextStyles.text(
                    AppColors.textColor,
                    bold: (value == index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return BlocBuilder<DriveBookingBloc, DriveBookingState>(
      builder: (context, state) {
        return ButtonWidget(
          disabled: (state.bookingLoadState == LoadState.loading),
          margin: EdgeInsets.only(top: 18.sf),
          backgroundColor: AppColors.accentColor,
          title: (state.bookingLoadState != LoadState.loading)
              ? 'Book now!'
              : 'Finding driver...',
          titleColor: AppColors.textColor,
          onPressed: () {
            if (fromLocation == null) {
              ToastWidget.show('Please select your starting place');
              return;
            }
            if (toLocation == null) {
              ToastWidget.show('Please select your destination');
              return;
            }
            driveBookingBloc.add(ConfirmBookingEvent(
              fromLocation!,
              toLocation!,
              paymentMethodIndex.value,
              vehicleTypeIndex.value,
            ));
          },
        );
      },
    );
  }
}
