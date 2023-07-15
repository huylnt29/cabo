part of 'home_screen.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({required this.voucher, super.key});
  final Voucher voucher;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.sf,
      margin: EdgeInsets.symmetric(
        vertical: 8.sf,
        horizontal: 3.sf,
      ),
      decoration: BoxDecoration(
        color: AppColors.getRandom(),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.secondaryColor,
            spreadRadius: 3,
            blurRadius: 3,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.sf,
        vertical: 1.sf,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.sf,
              vertical: 24.sf,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              voucher.slotRatio,
              style: AppTextStyles.heading2(
                AppColors.primaryColor,
              ),
            ),
          ),
          12.hSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher.title ?? ErrorMessage.isNotDetermined,
                  // maxLines: 2,
                  style: AppTextStyles.heading3(
                    AppColors.secondaryColor,
                  ),
                ),
                3.vSpace,
                Text(
                  voucher.expirationDate,
                  style: AppTextStyles.custom(
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
