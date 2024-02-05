import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/trending_tab_container_screen/models/trending_tab_container_model.dart';
import '../models/stories_item_model.dart';

/// A provider class for the TrendingTabContainerScreen.
///
/// This provider manages the state of the TrendingTabContainerScreen, including the
/// current trendingTabContainerModelObj

// ignore_for_file: must_be_immutable
class TrendingTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  TrendingTabContainerModel trendingTabContainerModelObj =
      TrendingTabContainerModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
