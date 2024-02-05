import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/trending_page/models/trending_model.dart';
import '../models/trendinglist_item_model.dart';

/// A provider class for the TrendingPage.
///
/// This provider manages the state of the TrendingPage, including the
/// current trendingModelObj

// ignore_for_file: must_be_immutable
class TrendingProvider extends ChangeNotifier {
  TrendingModel trendingModelObj = TrendingModel();

  @override
  void dispose() {
    super.dispose();
  }
}
