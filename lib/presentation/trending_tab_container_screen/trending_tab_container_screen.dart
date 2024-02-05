import '../trending_tab_container_screen/widgets/stories_item_widget.dart';
import 'models/stories_item_model.dart';
import 'models/trending_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/messages_page/messages_page.dart';
import 'package:hassan_s_application/presentation/notifications_page/notifications_page.dart';
import 'package:hassan_s_application/presentation/profile_page/profile_page.dart';
import 'package:hassan_s_application/presentation/trending_page/trending_page.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_title_searchview.dart';
import 'package:hassan_s_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hassan_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:hassan_s_application/widgets/custom_bottom_bar.dart';
import 'provider/trending_tab_container_provider.dart';

class TrendingTabContainerScreen extends StatefulWidget {
  const TrendingTabContainerScreen({Key? key}) : super(key: key);

  @override
  TrendingTabContainerScreenState createState() =>
      TrendingTabContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TrendingTabContainerProvider(),
        child: TrendingTabContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class TrendingTabContainerScreenState extends State<TrendingTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
    NavigatorService.pushNamed(
      AppRoutes.profilePage,
    );
    NavigatorService.pushNamed(
      AppRoutes.notificationsPage,
    );
    NavigatorService.pushNamed(
      AppRoutes.messagesPage,
    ); // TODO: implement Actions
// TODO: implement Actions
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 25.v),
                  _buildStories(context),
                  SizedBox(height: 33.v),
                  _buildTabview(context),
                  Expanded(
                      child: SizedBox(
                          height: 544.v,
                          child: TabBarView(
                              controller: tabviewController,
                              children: [
                                TrendingPage.builder(context),
                                TrendingPage.builder(context),
                                TrendingPage.builder(context),
                                TrendingPage.builder(context)
                              ])))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: Selector<TrendingTabContainerProvider, TextEditingController?>(
            selector: (context, provider) => provider.searchController,
            builder: (context, searchController, child) {
              return AppbarTitleSearchview(
                  margin: EdgeInsets.only(left: 16.h),
                  hintText: "lbl_search".tr,
                  controller: searchController);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPlay40x40,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v))
        ]);
  }

  /// Section Widget
  Widget _buildStories(BuildContext context) {
    return SizedBox(
        height: 89.v,
        child: Consumer<TrendingTabContainerProvider>(
            builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount:
                  provider.trendingTabContainerModelObj.storiesItemList.length,
              itemBuilder: (context, index) {
                StoriesItemModel model = provider
                    .trendingTabContainerModelObj.storiesItemList[index];
                return StoriesItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
        height: 30.v,
        width: 398.h,
        child: TabBar(
            controller: tabviewController,
            isScrollable: true,
            labelColor: appTheme.deepPurpleA200,
            unselectedLabelColor: appTheme.indigo100,
            tabs: [
              Tab(child: Text("lbl_trending".tr)),
              Tab(child: Text("lbl_latest".tr)),
              Tab(child: Text("lbl_discover".tr)),
              Tab(child: Text("lbl_daily_new".tr))
            ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Streams:
        return "/";
      case BottomBarEnum.Messages:
        return AppRoutes.messagesPage;
      case BottomBarEnum.Notifications:
        return AppRoutes.notificationsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.messagesPage:
        return MessagesPage.builder(context);
      case AppRoutes.notificationsPage:
        return NotificationsPage.builder(context);
      case AppRoutes.profilePage:
        return ProfilePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
