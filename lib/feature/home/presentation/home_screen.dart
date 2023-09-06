import 'package:cabo_customer/core/theme/app_colors.dart';

import 'package:cabo_customer/feature/home/data/model/customer_summary_model.dart';
import 'package:cabo_customer/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/home_shimmer.dart';

import '../../../core/model/voucher_model.dart';

part 'voucher_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => (state.loadState == LoadState.loaded)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  buildVoucherArea(state.vouchers),
                  12.vertical,
                  buildSummaryArea(state.customerSummary!),
                ],
              ),
            )
          : const HomeShimmer(),
    );
  }

  Widget buildVoucherArea(List<Voucher?>? vouchers) {
    if (vouchers != null && vouchers.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hot discounts',
            style: AppTextStyles.heading1(
              AppColors.secondaryColor,
            ),
          ),
          Container(
            height: 120.sf,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 10.sf,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => VoucherItem(
                voucher: vouchers[index]!,
              ),
              separatorBuilder: (context, index) => 24.hSpace,
              itemCount: vouchers.length,
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget buildSummaryArea(CustomerSummary customerSummary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: AppTextStyles.heading1(
            AppColors.secondaryColor,
          ),
        ),
        12.vSpace,
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 18.sf,
              ),
              padding: EdgeInsets.only(
                top: 8.sf,
                bottom: 24.sf,
                left: 12.sf,
                right: 12.sf,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total trip',
                    style: AppTextStyles.custom(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    customerSummary.totalTrip.toString(),
                    style: AppTextStyles.custom(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 40.sf,
                bottom: 12.sf,
                left: 3.sf,
                right: 3.sf,
              ),
              padding: EdgeInsets.all(15.sf),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.accentColor,
                    spreadRadius: 3,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Recent trip',
                    style: AppTextStyles.heading1(
                      AppColors.secondaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      buildRecentTripFieldItem(
                        'Cost',
                        customerSummary.recentTrip!.cost,
                      ),
                      buildRecentTripFieldItem(
                        'Distance',
                        customerSummary.recentTrip!.distance,
                      ),
                      buildRecentTripFieldItem(
                        'Booking time',
                        customerSummary.recentTrip!.formattedStartTime,
                      ),
                      buildRecentTripFieldItem(
                        'Arriving time',
                        customerSummary.recentTrip!.formattedEndTime,
                      ),
                      buildRecentTripFieldItem(
                        'Booking location',
                        customerSummary.recentTrip!.orderLocation,
                      ),
                      buildRecentTripFieldItem(
                        'Destination',
                        customerSummary.recentTrip!.toLocation,
                      ),
                      buildRecentTripFieldItem(
                        'Payment type',
                        customerSummary.recentTrip!.paymentType?.name ??
                            ErrorMessage.isNotDetermined,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildRecentTripFieldItem(String field, dynamic value) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.sf,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field,
            style: AppTextStyles.custom(
              fontWeight: FontWeight.bold,
            ),
          ),
          12.hSpace,
          Expanded(
              child: Text(
            value.toString(),
            textAlign: TextAlign.right,
          )),
        ],
      ),
    );
  }
}
