import '../stories_and_tweets_screen/widgets/frame_item_widget.dart';
import '../stories_and_tweets_screen/widgets/livestories_item_widget.dart';
import 'models/frame_item_model.dart';
import 'models/livestories_item_model.dart';
import 'models/stories_and_tweets_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_title_searchview.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:hassan_s_application/widgets/app_bar/custom_app_bar.dart';
import 'provider/stories_and_tweets_provider.dart';

class StoriesAndTweetsScreen extends StatefulWidget {
  const StoriesAndTweetsScreen({Key? key}) : super(key: key);

  @override
  StoriesAndTweetsScreenState createState() => StoriesAndTweetsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StoriesAndTweetsProvider(),
        child: StoriesAndTweetsScreen());
  }
}

class StoriesAndTweetsScreenState extends State<StoriesAndTweetsScreen> {
  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  @override
  void initState(BuildContext context) async {
    super.initState();
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 32.v),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Text("lbl_stories".tr,
                                  style: theme.textTheme.headlineSmall))),
                      SizedBox(height: 19.v),
                      _buildLiveStories(context),
                      SizedBox(height: 22.v),
                      _buildFrame(context)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: Selector<StoriesAndTweetsProvider, TextEditingController?>(
            selector: (context, provider) => provider.searchController,
            builder: (context, searchController, child) {
              return AppbarTitleSearchview(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_search".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgGroup9086,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v))
        ]);
  }

  /// Section Widget
  Widget _buildLiveStories(BuildContext context) {
    return SizedBox(
        height: 89.v,
        child: Consumer<StoriesAndTweetsProvider>(
            builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount:
                  provider.storiesAndTweetsModelObj.livestoriesItemList.length,
              itemBuilder: (context, index) {
                LivestoriesItemModel model = provider
                    .storiesAndTweetsModelObj.livestoriesItemList[index];
                return LivestoriesItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Consumer<StoriesAndTweetsProvider>(
        builder: (context, provider, child) {
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
          itemCount: provider.storiesAndTweetsModelObj.frameItemList.length,
          itemBuilder: (context, index) {
            FrameItemModel model =
                provider.storiesAndTweetsModelObj.frameItemList[index];
            return FrameItemWidget(model);
          });
    });
  }
}
