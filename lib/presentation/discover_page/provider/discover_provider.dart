import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/discover_page/models/discover_model.dart';
import '../models/profileslist_item_model.dart';

/// A provider class for the DiscoverPage.
///
/// This provider manages the state of the DiscoverPage, including the
/// current discoverModelObj

// ignore_for_file: must_be_immutable
class DiscoverProvider extends ChangeNotifier {
  DiscoverModel discoverModelObj = DiscoverModel();

  @override
  void dispose() {
    super.dispose();
  }
}
