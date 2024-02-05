import '../page_view_screen/widgets/conversions_item_widget.dart';
import 'models/conversions_item_model.dart';
import 'models/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hassan_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:hassan_s_application/widgets/custom_elevated_button.dart';
import 'package:hassan_s_application/widgets/custom_icon_button.dart';
import 'package:hassan_s_application/widgets/custom_text_form_field.dart';
import 'provider/page_view_provider.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  PageViewScreenState createState() => PageViewScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageViewProvider(), child: PageViewScreen());
  }
}

class PageViewScreenState extends State<PageViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgPageView),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 13.v),
                        decoration: AppDecoration
                            .gradientOnPrimaryContainerToBlueGray
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder15),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          _buildAppBar(context),
                          Spacer(),
                          SizedBox(height: 26.v),
                          _buildStreamDetails(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 24.v,
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowBack,
            margin: EdgeInsets.only(left: 16.h),
            onTap: () {
              onTapArrowBack(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgQuestion,
              margin: EdgeInsets.only(left: 16.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgGrid,
              margin: EdgeInsets.only(left: 24.h, right: 16.h))
        ]);
  }

  /// Section Widget
  Widget _buildPostDescription(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomElevatedButton(
          height: 28.v,
          width: 71.h,
          text: "lbl_4_6".tr,
          buttonStyle: CustomButtonStyles.fillDeepPurpleATL14,
          buttonTextStyle: CustomTextStyles.titleSmallPrimary),
      SizedBox(height: 22.v),
      Container(
          width: 300.h,
          margin: EdgeInsets.only(right: 82.h),
          child: Text("msg_haliford_luxury_hotel".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displayMedium)),
      SizedBox(height: 23.v),
      SizedBox(
          width: 381.h,
          child: Text("msg_halford_hotel_is".tr,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildConversions(BuildContext context) {
    return SizedBox(
        height: 40.v,
        child: Consumer<PageViewProvider>(builder: (context, provider, child) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 13.h);
              },
              itemCount: provider.pageViewModelObj.conversionsItemList.length,
              itemBuilder: (context, index) {
                ConversionsItemModel model =
                    provider.pageViewModelObj.conversionsItemList[index];
                return ConversionsItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildStreamDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(children: [
          _buildPostDescription(context),
          SizedBox(height: 98.v),
          _buildConversions(context),
          SizedBox(height: 40.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Selector<PageViewProvider, TextEditingController?>(
                    selector: (context, provider) => provider.commentController,
                    builder: (context, commentController, child) {
                      return CustomTextFormField(
                          controller: commentController,
                          hintText: "lbl_write_a_comment".tr,
                          hintStyle: CustomTextStyles.titleSmallPrimary,
                          textInputAction: TextInputAction.done,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.h, vertical: 16.v),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray600);
                    })),
            Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: CustomIconButton(
                    height: 50.adaptSize,
                    width: 50.adaptSize,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.fillDeepPurpleATL25,
                    child:
                        CustomImageView(imagePath: ImageConstant.imgGroup9143)))
          ])
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowBack(BuildContext context) {
    NavigatorService.goBack();
  }
}
