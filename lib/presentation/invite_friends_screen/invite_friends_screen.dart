import '../invite_friends_screen/widgets/friendlist_item_widget.dart';
import 'models/friendlist_item_model.dart';
import 'models/invite_friends_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:hassan_s_application/widgets/app_bar/custom_app_bar.dart';
import 'provider/invite_friends_provider.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  InviteFriendsScreenState createState() => InviteFriendsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => InviteFriendsProvider(),
        child: InviteFriendsScreen());
  }
}

class InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_invite_friends".tr,
                              style: theme.textTheme.headlineLarge)),
                      SizedBox(height: 20.v),
                      _buildFriendList(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgClose,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapClose(context);
            }),
        actions: [
          AppbarSubtitleOne(
              text: "lbl_next".tr,
              margin: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildFriendList(BuildContext context) {
    return Expanded(child:
        Consumer<InviteFriendsProvider>(builder: (context, provider, child) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
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
          itemCount: provider.inviteFriendsModelObj.friendlistItemList.length,
          itemBuilder: (context, index) {
            FriendlistItemModel model =
                provider.inviteFriendsModelObj.friendlistItemList[index];
            return FriendlistItemWidget(model);
          });
    }));
  }

  /// Navigates to the previous screen.
  onTapClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
