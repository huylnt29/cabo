import 'dart:async';

import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/error_widget.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
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
      body: BlocProvider.value(
        value: driveBookingBloc,
        child: Column(
          children: [
            Expanded(child: buildAddressListArea()),
            18.vertical,
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
    );
  }

  Widget buildAddressListArea() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.sf,
      ).copyWith(top: 12.sf),
      child: BlocBuilder<DriveBookingBloc, DriveBookingState>(
        builder: (context, state) {
          switch (state.addressListLoadState) {
            case LoadState.loaded:
              return ListView.builder(
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
      ),
    );
  }

  Widget buildAddressItem(Address address) {
    return InkWell(
      onTap: () => Navigator.pop(context, address),
      child: Container(
        margin: EdgeInsets.only(bottom: 18.sf),
        child: RoundedContainerWidget(child: Text(address.address)),
      ),
    );
  }
}
