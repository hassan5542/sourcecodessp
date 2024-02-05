import '../models/fortysix_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';

// ignore: must_be_immutable
class FortysixItemWidget extends StatelessWidget {
  FortysixItemWidget(
    this.fortysixItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FortysixItemModel fortysixItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 117.h,
      child: CustomImageView(
        imagePath: fortysixItemModelObj?.fortySix,
        height: 161.v,
        width: 117.h,
        radius: BorderRadius.circular(
          10.h,
        ),
      ),
    );
  }
}
