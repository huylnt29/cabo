import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:flutter/material.dart';

enum VehicleType { car4, car7 }

extension VehicleTypeUtil on VehicleType {
  String get text {
    switch (this) {
      // case VehicleType.motorcycle:
      //   return 'Motorcycle';
      case VehicleType.car4:
        return '4-slot car';
      case VehicleType.car7:
        return '7-slot car';
    }
  }

  Image get illustration {
    switch (this) {
      // case VehicleType.motorcycle:
      //   return Assets.images.motorcycle.image();
      case VehicleType.car4:
        return Assets.images.car4.image();
      case VehicleType.car7:
        return Assets.images.car7.image();
    }
  }

  String get serverKey {
    switch (this) {
      // case VehicleType.motorcycle:
      //   return Assets.images.motorcycle.image();
      case VehicleType.car4:
        return 'VEHICLE_TYPE_CAR_4';
      case VehicleType.car7:
        return 'VEHICLE_TYPE_CAR_7';
    }
  }
}
