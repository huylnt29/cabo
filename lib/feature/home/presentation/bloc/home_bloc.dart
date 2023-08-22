import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/model/voucher_model.dart';
import 'package:cabo_customer/feature/home/data/model/customer_summary_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';

import '../../domain/repository/home_repository.dart';

part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this.homeRepository)
      : super(const HomeState(loadState: LoadState.initial));

  final HomeRepository homeRepository;

  Future<void> fetchDataForScreen() async {
    final customerSummary = await homeRepository.getCustomerSummary();
    final vouchers = await homeRepository.getAllVouchers();
    emit(state.copyWith(
      customerSummary: customerSummary,
      vouchers: vouchers,
      loadState: LoadState.loaded,
    ));
  }
}
