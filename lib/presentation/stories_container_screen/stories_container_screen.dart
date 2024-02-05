import 'models/stories_container_model.dart';
import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/messages_page/messages_page.dart';
import 'package:hassan_s_application/presentation/notifications_page/notifications_page.dart';
import 'package:hassan_s_application/presentation/profile_page/profile_page.dart';
import 'package:hassan_s_application/widgets/custom_bottom_bar.dart';
import 'provider/stories_container_provider.dart';

class StoriesContainerScreen extends StatefulWidget {
  const StoriesContainerScreen({Key? key}) : super(key: key);

  @override
  StoriesContainerScreenState createState() => StoriesContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StoriesContainerProvider(),
        child: StoriesContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class StoriesContainerScreenState extends State<StoriesContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: "/",
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
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
