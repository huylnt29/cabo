part of '../../domain/repository/drive_booking_repository.dart';

class DriveBookingLocalDataSource with IsarDatabase {
  DriveBookingLocalDataSource() {
    bookingCollection = isarInstance!.collection<BookingResponse>();
  }
  late IsarCollection<BookingResponse> bookingCollection;

  Future<int> saveBookingResponse(
    BookingResponse bookingResponse,
  ) async {
    int modelKey = -1;
    await isarInstance!.writeTxn(() async {
      modelKey = await bookingCollection.put(bookingResponse);
    });
    return modelKey;
  }

  Future<BookingResponse?> getFirstBookingResponse() async {
    final booking = await bookingCollection.where().findFirst();
    return booking;
  }

  Future<bool> deleteFirstBookingResponse() async {
    await isarInstance!.writeTxn(() async {
      await bookingCollection.where().deleteFirst();
      return true;
    });

    return false;
  }
}
