part of '../repository/home_repository_impl.dart';

class HomeRemoteDataSource with IsarDatabase {
  HomeRemoteDataSource(this._caboClient);
  final CaboClient _caboClient;

  Future<CustomerSummary> getCustomerSummary() async {
    return CustomerSummary.fromJson({
      'totalTrip': 1,
      'recentTrip': {
        'id': '1',
        'cost': 50000,
        'distance': 12,
        'startTime': 1689261671,
        'endTime': 1689262311,
        'customerOrderLocation':
            '32 Ha Ba Tuong street, Tan Binh district, Ho Chi Minh city',
        'toLocation': '227 Nguyen Van Cu street, district 5, Ho Chi Minh city',
        'paymentType': 1,
      }
    });
  }

  Future<List<Voucher?>> getAllVouchers() async {
    return [
      Voucher.fromJson({
        'id': '1',
        'title': '40\$ ride credit when you rent a Tesla from Hertz',
        'remaining': 12,
        'total': 189,
        'expirationEpochTime': 1689265311,
      }),
      Voucher.fromJson({
        'id': '2',
        'title': '40\$ ride credit when you rent a Tesla from Hertz',
        'remaining': 15,
        'total': 189,
        'expirationEpochTime': 1689266311,
      })
    ];
  }
}
