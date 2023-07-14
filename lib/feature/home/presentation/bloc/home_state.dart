part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    CustomerSummary? customerSummary,
    @Default([]) List<Voucher?> vouchers,
    required LoadState loadState,
  }) = _HomeState;
}
