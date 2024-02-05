import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/trending_posts_page/models/trending_posts_model.dart';

/// A provider class for the TrendingPostsPage.
///
/// This provider manages the state of the TrendingPostsPage, including the
/// current trendingPostsModelObj

// ignore_for_file: must_be_immutable
class TrendingPostsProvider extends ChangeNotifier {
  TrendingPostsModel trendingPostsModelObj = TrendingPostsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
