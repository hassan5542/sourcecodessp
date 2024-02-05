import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/trending_posts_tab_container_screen/models/trending_posts_tab_container_model.dart';

/// A provider class for the TrendingPostsTabContainerScreen.
///
/// This provider manages the state of the TrendingPostsTabContainerScreen, including the
/// current trendingPostsTabContainerModelObj
class TrendingPostsTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  TrendingPostsTabContainerModel trendingPostsTabContainerModelObj =
      TrendingPostsTabContainerModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
