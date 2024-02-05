import '../models/livestories_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class LivestoriesItemWidget extends StatelessWidget {
  LivestoriesItemWidget(
    this.livestoriesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LivestoriesItemModel livestoriesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 64.adaptSize,
              width: 64.adaptSize,
              padding: EdgeInsets.all(15.h),
              decoration: IconButtonStyleHelper.fillDeepPurpleATL32,
              child: CustomImageView(
                imagePath: livestoriesItemModelObj?.save,
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              livestoriesItemModelObj.newPost!,
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
