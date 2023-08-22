import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../automatic_generator/assets.gen.dart';

enum PaymentMethod {
  @JsonValue(1)
  cash,
  @JsonValue(2)
  digital,
}

extension PaymentMethodUtil on PaymentMethod {
  String get text {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.digital:
        return 'Online';
    }
  }

  Image get illustration {
    switch (this) {
      case PaymentMethod.cash:
        return Assets.images.money.image();
      case PaymentMethod.digital:
        return Assets.images.wallet.image();
    }
  }
}
