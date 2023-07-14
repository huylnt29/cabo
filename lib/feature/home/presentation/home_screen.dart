import 'package:cabo_customer/core/enums/load_state.dart';
import 'package:cabo_customer/core/extensions/space_size_extensions.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/feature/home/data/model/customer_summary_model.dart';
import 'package:cabo_customer/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ? Column(
              children: [
                buildVoucherArea(state.vouchers),
                buildSummaryArea(state.customerSummary!),
              ],
            )
          : Container(),
    );
  }

  Widget buildVoucherArea(List<Voucher?>? vouchers) {
    if (vouchers != null && vouchers.isNotEmpty) {
      return Column(
        children: [
          const Text('Hot discounts'),
          ListView.separated(
            itemBuilder: (context, index) => VoucherItem(
              voucher: vouchers[index]!,
            ),
            separatorBuilder: (context, index) => 5.horizontalSpace,
            itemCount: vouchers.length,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget buildSummaryArea(CustomerSummary customerSummary) {
    return Text(customerSummary.totalTrip.toString());
  }
}
