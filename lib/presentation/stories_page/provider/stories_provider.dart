import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/stories_page/models/stories_model.dart';
import '../models/storieslist_item_model.dart';
import '../models/eventslist_item_model.dart';

/// A provider class for the StoriesPage.
///
/// This provider manages the state of the StoriesPage, including the
/// current storiesModelObj

// ignore_for_file: must_be_immutable
class StoriesProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  StoriesModel storiesModelObj = StoriesModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
