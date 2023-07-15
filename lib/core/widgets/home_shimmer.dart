import 'package:cabo_customer/core/extensions/font_size_extensions.dart';
import 'package:cabo_customer/core/extensions/space_size_extensions.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 500),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          20.vSpace,
          Container(
            width: double.infinity,
            height: 123.sf,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
          ),
          24.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 75.sf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              12.hSpace,
              Expanded(
                child: Container(
                    height: 75.sf,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ],
          ),
          24.vSpace,
          buildContent(
            width: 60.sf,
          ),
          24.vSpace,
          buildContent(
            width: 90.sf,
          ),
          24.vSpace,
          buildContent(
            width: 120.sf,
          ),
        ],
      ),
    );
  }

  Container buildContent({double? height, required double width}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 150.sf,
      width: double.infinity,
    );
  }
}
