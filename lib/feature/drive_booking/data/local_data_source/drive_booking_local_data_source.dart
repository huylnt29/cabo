part of '../../domain/repository/drive_booking_repository.dart';

class DriveBookingLocalDataSource with IsarDatabase {
  Future<int> saveBookingResponse(BookingResponse bookingResponse) async {
    final bookingCollection = isarInstance!.collection<BookingResponse>();

    int modelKey = -1;
    await isarInstance!.writeTxn(() async {
      modelKey = await bookingCollection.put(bookingResponse);
    });
    return modelKey;
  }

  Future<BookingResponse?> getFirstBookingResponse() async {
    final booking = await isarInstance!.collection<BookingResponse>().get(1);
    return booking;
  }

  Future<bool> deleteFirstBookingResponse() async {
    await isarInstance!.writeTxn(() async {
      await isarInstance!.collection<BookingResponse>().delete(1);
      return true;
    });

    return false;
  }
}
