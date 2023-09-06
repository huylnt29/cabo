import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/error_widget.dart';
import 'package:cabo_customer/core/widgets/no_data_widget.dart';
import 'package:cabo_customer/feature/trip_history/data/model/trip_model.dart';
import 'package:cabo_customer/feature/trip_history/data/model/trip_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/long_message.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/home_shimmer.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/list_view_shimmer.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';

import 'cubit/trip_history_cubit.dart';

class TripHistoryScreen extends StatelessWidget {
  const TripHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripHistoryCubit, TripHistoryState>(
      builder: (context, state) {
        switch (state.loadState) {
          case LoadState.error:
            return const AppErrorWidget();
          case LoadState.loading:
            return const ListViewShimmer(itemHeight: 80);
          case LoadState.initial:
            return Container();
          case LoadState.loaded:
            return (state.trips!.isEmpty)
                ? const NoDataWidget(
                    message: ErrorMessage.hasNoData,
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.trips!.length,
                    itemBuilder: (context, index) => buildTripHistoryItem(
                      state.trips![index],
                    ),
                    separatorBuilder: (context, index) => 12.vertical,
                  );
        }
      },
    );
  }

  Widget buildTripHistoryItem(Trip trip) {
    return RoundedContainerWidget(
      backgroundColor: trip.status!.color,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'From',
                      style: AppTextStyles.text(
                        Colors.white,
                        bold: true,
                      ),
                    ),
                    8.horizontal,
                    SizedBox(
                      width: 180.sf,
                      child: Text(
                        trip.orderLocation!,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.text(
                          AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'To',
                      style: AppTextStyles.text(
                        Colors.white,
                        bold: true,
                      ),
                    ),
                    8.horizontal,
                    SizedBox(
                      width: 180.sf,
                      child: Text(
                        trip.toLocation!,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.text(
                          AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              const Text('VND'),
              Text(trip.cost!),
            ],
          )
        ],
      ),
    );
  }
}
