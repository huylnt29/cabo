import 'package:cabo_customer/core/enums/payment_method.dart';
import 'package:cabo_customer/core/enums/vehicle_type.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/button_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/rounded_container_widget.dart';

class FormBookingScreen extends StatefulWidget {
  const FormBookingScreen({super.key});

  @override
  State<FormBookingScreen> createState() => _FormBookingScreenState();
}

class _FormBookingScreenState extends State<FormBookingScreen> {
  final vehicleTypeIndex = ValueNotifier(0);
  final paymentMethodIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLocationArea(),
          24.vertical,
          Text(
            'Vehicle type',
            style: AppTextStyles.heading3(AppColors.textColor),
          ),
          12.vertical,
          buildVehicleTypeArea(),
          24.vertical,
          Text(
            'Payment method',
            style: AppTextStyles.heading3(AppColors.textColor),
          ),
          12.vertical,
          buildPaymentMethodArea(),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildLocationArea() {
    return RoundedContainerWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Your starting place',
                style: AppTextStyles.heading3(AppColors.textColor),
              ),
              ButtonWidget(
                margin: EdgeInsets.zero,
                title: 'Choose',
                onPressed: () {},
                titleColor: AppColors.textColor,
                backgroundColor: AppColors.purpleBackgroundColor,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Your destination',
                style: AppTextStyles.heading3(AppColors.textColor),
              ),
              ButtonWidget(
                margin: EdgeInsets.zero,
                title: 'Choose',
                onPressed: () {},
                titleColor: AppColors.textColor,
                backgroundColor: AppColors.purpleBackgroundColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildVehicleTypeArea() {
    return SizedBox(
      height: 75.sf,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => buildVehicleTypeItem(
          VehicleType.values[index],
          index,
        ),
        separatorBuilder: (context, index) => 12.horizontal,
        itemCount: VehicleType.values.length,
      ),
    );
  }

  Widget buildVehicleTypeItem(VehicleType vehicleType, int index) {
    return ValueListenableBuilder(
      valueListenable: vehicleTypeIndex,
      builder: (context, value, child) => SizedBox(
        width: 160.sf,
        child: RoundedContainerWidget(
          boxShadowColor: (value == index) ? AppColors.accentColor : null,
          child: InkWell(
            onTap: () => vehicleTypeIndex.value = index,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vehicleType.illustration,
                15.horizontal,
                Text(
                  vehicleType.text,
                  style: AppTextStyles.text(
                    AppColors.textColor,
                    bold: (value == index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentMethodArea() {
    return SizedBox(
      height: 75.sf,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => buildPaymentMethodItem(
          PaymentMethod.values[index],
          index,
        ),
        separatorBuilder: (context, index) => 12.horizontal,
        itemCount: PaymentMethod.values.length,
      ),
    );
  }

  Widget buildPaymentMethodItem(PaymentMethod paymentMethod, int index) {
    return ValueListenableBuilder(
      valueListenable: paymentMethodIndex,
      builder: (context, value, child) => SizedBox(
        width: 140.sf,
        child: RoundedContainerWidget(
          boxShadowColor: (value == index) ? AppColors.accentColor : null,
          child: InkWell(
            onTap: () => paymentMethodIndex.value = index,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentMethod.illustration,
                15.horizontal,
                Text(
                  paymentMethod.text,
                  style: AppTextStyles.text(
                    AppColors.textColor,
                    bold: (value == index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return ButtonWidget(
      margin: EdgeInsets.only(top: 18.sf),
      backgroundColor: AppColors.accentColor,
      title: 'Submit',
      titleColor: AppColors.textColor,
      onPressed: () {},
    );
  }
}
