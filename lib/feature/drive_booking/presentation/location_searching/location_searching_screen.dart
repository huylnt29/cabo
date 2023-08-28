import 'dart:async';

import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/error_widget.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:cabo_customer/feature/favorite_location/presentation/bloc/favorite_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/complete_scaffold_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/list_view_shimmer.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/text_form_field_widget.dart';

enum LocationSearchingPurpose {
  bookingFromLocation,
  bookingToLocation,
}

class LocationSearchingScreen extends StatefulWidget {
  const LocationSearchingScreen({
    super.key,
    required this.locationSearchingPurpose,
  });
  final LocationSearchingPurpose locationSearchingPurpose;
  @override
  State<LocationSearchingScreen> createState() =>
      _LocationSearchingScreenState();
}

class _LocationSearchingScreenState extends State<LocationSearchingScreen> {
  final driveBookingBloc = getIt<DriveBookingBloc>();
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      appBarTextWidget: const Text(
        'Search location',
      ),
      appBarBackgroundColor: AppColors.secondaryColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: driveBookingBloc),
          BlocProvider.value(
            value: getIt<FavoriteLocationBloc>()..add(GetAllEvent()),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.all(18.sf),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLocalAddressListArea(),
              Text(
                'Hint location',
                style: AppTextStyles.heading3(AppColors.textColor),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12.sf),
                  child: buildRemoteAddressListArea(),
                ),
              ),
              8.vertical,
              TextFormFieldWidget(
                textInputType: TextInputType.streetAddress,
                colorTheme: AppColors.secondaryColor,
                labelText: 'Address',
                onChanged: (keyword) {
                  if (timer?.isActive ?? false) timer?.cancel();
                  timer = Timer(const Duration(seconds: 1), () {
                    driveBookingBloc.add(GetAddressListEvent(keyword));
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRemoteAddressListArea() {
    return BlocBuilder<DriveBookingBloc, DriveBookingState>(
      builder: (context, state) {
        switch (state.addressListLoadState) {
          case LoadState.loaded:
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state.addressList.length,
              itemBuilder: (context, index) => buildAddressItem(
                state.addressList[index],
              ),
            );
          case LoadState.loading:
            return const ListViewShimmer();
          case LoadState.error:
            return const AppErrorWidget();
          case LoadState.initial:
            return Container();
        }
      },
    );
  }

  Widget buildAddressItem(Address address) {
    return InkWell(
      onTap: () => Navigator.pop(context, address),
      child: Container(
        margin: EdgeInsets.only(bottom: 18.sf),
        child: RoundedContainerWidget(
          margin: EdgeInsets.symmetric(vertical: 12.sf),
          child: Text(
            address.address!,
            style: AppTextStyles.text(
              AppColors.textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLocalAddressListArea() {
    return BlocBuilder<FavoriteLocationBloc, FavoriteLocationState>(
      builder: (context, state) {
        if (state.loadState == LoadState.loaded) {
          return (state.favoriteLocations!.isNotEmpty)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorite location',
                      style: AppTextStyles.heading3(AppColors.textColor),
                    ),
                    12.vertical,
                    SizedBox(
                      height: 100.sf,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildLocalAddressItem(
                          state.favoriteLocations![index],
                        ),
                        itemCount: state.favoriteLocations!.length,
                      ),
                    ),
                    24.vertical,
                  ],
                )
              : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildLocalAddressItem(FavoriteLocation favoriteLocation) {
    return InkWell(
      onTap: () => Navigator.pop(
        context,
        Address(
          address: favoriteLocation.address,
          location: favoriteLocation.location,
        ),
      ),
      child: Container(
        height: double.infinity,
        width: 200.sf,
        margin: EdgeInsets.only(right: 18.sf),
        child: RoundedContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      favoriteLocation.title!,
                      style: AppTextStyles.text(
                        AppColors.textColor,
                        bold: true,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.getRandom(),
                        borderRadius: BorderRadius.circular(12.sf),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.sf,
                        vertical: 6.sf,
                      ),
                      child: Text(
                        favoriteLocation.favoritePlace.name,
                        style: AppTextStyles.smallText(AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
              5.vertical,
              Text(
                favoriteLocation.address!,
                style: AppTextStyles.text(AppColors.textColor)
                    .copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
