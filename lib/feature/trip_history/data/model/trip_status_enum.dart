import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum TripStatus {
  @JsonValue('TRIP_STATUS_NO_DRIVER')
  noDriver,
  @JsonValue('TRIP_STATUS_SEARCHING')
  searching,
  @JsonValue('TRIP_STATUS_PICKING')
  picking,
  @JsonValue('TRIP_STATUS_DONE')
  done,
}

extension TripStatusX on TripStatus {
  Color get color {
    switch (this) {
      case TripStatus.noDriver:
        return const Color.fromARGB(154, 169, 167, 167);
      case TripStatus.searching:
        return const Color.fromARGB(255, 159, 137, 106);
      case TripStatus.picking:
        return const Color.fromARGB(255, 164, 169, 97);
      case TripStatus.done:
        return const Color.fromARGB(175, 144, 194, 176);
    }
  }
}
