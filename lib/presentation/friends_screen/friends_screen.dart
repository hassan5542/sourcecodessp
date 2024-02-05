import '../friends_screen/widgets/follow_item_widget.dart';
import '../friends_screen/widgets/ninetysevenlist_item_widget.dart';
import 'models/follow_item_model.dart';
import 'models/friends_model.dart';
import 'models/ninetysevenlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hassan_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:hassan_s_application/widgets/custom_search_view.dart';
import 'provider/friends_provider.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  FriendsScreenState createState() => FriendsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FriendsProvider(), child: FriendsScreen());
  }
}

class FriendsScreenState extends State<FriendsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 21.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text("lbl_friends".tr,
                                  style: theme.textTheme.headlineLarge)),
                          SizedBox(height: 13.v),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  child: Selector<FriendsProvider,
                                          TextEditingController?>(
                                      selector: (context, provider) =>
                                          provider.searchController,
                                      builder:
                                          (context, searchController, child) {
                                        return CustomSearchView(
                                            controller: searchController,
                                            hintText: "lbl_search".tr,
                                            alignment: Alignment.center);
                                      }))),
                          SizedBox(height: 25.v),
                          Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text("msg_connect_to_your".tr,
                                  style: CustomTextStyles
                                      .titleLargeDeeppurpleA200Bold)),
                          SizedBox(height: 28.v),
                          _buildNinetySevenList(context),
                          SizedBox(height: 27.v),
                          Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text("lbl_recommeded".tr,
                                  style: CustomTextStyles
                                      .titleLargeDeeppurpleA200Bold)),
                          SizedBox(height: 22.v),
                          _buildFollow(context)
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowBackDeepPurpleA200,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowBack(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPersonAddAlt1,
              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
              onTap: () {
                onTapPersonAddAltOne(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildNinetySevenList(BuildContext context) {
    return SizedBox(
        height: 50.v,
        child: Consumer<FriendsProvider>(builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.only(left: 16.h, right: 106.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 30.h);
              },
              itemCount:
                  provider.friendsModelObj.ninetysevenlistItemList.length,
              itemBuilder: (context, index) {
                NinetysevenlistItemModel model =
                    provider.friendsModelObj.ninetysevenlistItemList[index];
                return NinetysevenlistItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildFollow(BuildContext context) {
    return Consumer<FriendsProvider>(builder: (context, provider, child) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.v),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                        height: 2.v,
                        thickness: 2.v,
                        color: theme.colorScheme.secondaryContainer)));
          },
          itemCount: provider.friendsModelObj.followItemList.length,
          itemBuilder: (context, index) {
            FollowItemModel model =
                provider.friendsModelObj.followItemList[index];
            return FollowItemWidget(model);
          });
    });
  }

  /// Navigates to the previous screen.
  onTapArrowBack(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  onTapPersonAddAltOne(BuildContext context) async {
    var url = 'https://accounts.google.com/';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }
}
