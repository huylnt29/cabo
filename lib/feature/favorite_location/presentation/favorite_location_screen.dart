import 'package:cabo_customer/core/enums/favorite_place.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/widgets/no_data_widget.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:cabo_customer/feature/favorite_location/presentation/bloc/favorite_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/action_dialog_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/complete_scaffold_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/gradient_tab_bar.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/list_view_shimmer.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';

import '../../../core/theme/app_colors.dart';

class FavoriteLocationScreen extends StatefulWidget {
  const FavoriteLocationScreen({super.key});

  @override
  State<FavoriteLocationScreen> createState() => _FavoriteLocationScreenState();
}

class _FavoriteLocationScreenState extends State<FavoriteLocationScreen>
    with SingleTickerProviderStateMixin {
  final favoriteLocationBloc = getIt<FavoriteLocationBloc>();
  late final tabController = TabController(
    length: FavoritePlace.values.length,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void initState() {
    favoriteLocationBloc.add(
      GetAllByCategoryEvent(FavoritePlace.values[tabController.index]),
    );
    tabController.addListener(() {
      favoriteLocationBloc.add(
        GetAllByCategoryEvent(FavoritePlace.values[tabController.index]),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favoriteLocationBloc,
      child: CompleteScaffoldWidget(
        appBarTextWidget: const Text(
          'Favorite location',
        ),
        appBarBackgroundColor: AppColors.secondaryColor,
        body: buildBody(),
        actions: [
          buildAddButton(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12.sf,
            vertical: 8.sf,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 3.sf,
            horizontal: 3.sf,
          ),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24.sf),
          ),
          child: Container(child: buildTabBar()),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12.sf,
              vertical: 8.sf,
            ),
            child: buildTabBarView(),
          ),
        ),
      ],
    );
  }

  Widget buildAddButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.add,
        color: AppColors.accentColor,
      ),
    );
  }

  Widget buildTabBar() {
    return GradientTabBar(
      tabController: tabController,
      tabs: FavoritePlace.values.map((e) => e.name).toList(),
      selectedGradientBackgroundColor: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          AppColors.textColor,
          AppColors.secondaryColor.withOpacity(0.5),
        ],
      ),
    );
  }

  Widget buildTabBarView() {
    return BlocBuilder<FavoriteLocationBloc, FavoriteLocationState>(
      builder: (context, state) {
        if (state.loadState == LoadState.loaded) {
          return (state.favoriteLocations!.isNotEmpty)
              ? ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildFavoriteLocationItem(
                    state.favoriteLocations![index],
                  ),
                  itemCount: state.favoriteLocations!.length,
                )
              : const NoDataWidget(
                  message: ErrorMessage.hasNoData,
                );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildFavoriteLocationItem(FavoriteLocation favoriteLocation) {
    return InkWell(
      onTap: () => showDialog<void>(
        context: context,
        builder: (ctx) => ActionDialogWidget(
          isPositiveGradient: true,
          dialogContext: context,
          iconTitle: Icon(
            Icons.warning_amber,
            size: 32.sf,
          ),
          title: 'Confirm deletion',
          message: 'Are you sure to delete this favorite location?',
          titleColor: AppColors.textColor,
          negativeActionTitle: 'Yes',
          positiveActionTitle: 'Cancel',
          onNegativeActionCallback: () {
            favoriteLocationBloc.add(
              DeleteLocationEvent(favoriteLocation.title!),
            );
            Navigator.of(context).pop();
          },
          onPositiveActionCallback: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: Container(
        height: 84.sf,
        margin: EdgeInsets.only(bottom: 12.sf),
        child: RoundedContainerWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  favoriteLocation.title!,
                  style: AppTextStyles.text(
                    AppColors.textColor,
                    bold: true,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  favoriteLocation.address!,
                  style: AppTextStyles.text(AppColors.textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
