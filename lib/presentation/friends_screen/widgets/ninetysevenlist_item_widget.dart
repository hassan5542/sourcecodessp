import '../models/ninetysevenlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';

// ignore: must_be_immutable
class NinetysevenlistItemWidget extends StatelessWidget {
  NinetysevenlistItemWidget(
    this.ninetysevenlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NinetysevenlistItemModel ninetysevenlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.h,
      child: CustomImageView(
        imagePath: ninetysevenlistItemModelObj?.trash,
        height: 50.adaptSize,
        width: 50.adaptSize,
      ),
    );
  }
}
