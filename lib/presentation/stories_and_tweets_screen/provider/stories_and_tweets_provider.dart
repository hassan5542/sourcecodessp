import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/stories_and_tweets_screen/models/stories_and_tweets_model.dart';
import '../models/livestories_item_model.dart';
import '../models/frame_item_model.dart';

/// A provider class for the StoriesAndTweetsScreen.
///
/// This provider manages the state of the StoriesAndTweetsScreen, including the
/// current storiesAndTweetsModelObj

// ignore_for_file: must_be_immutable
class StoriesAndTweetsProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  StoriesAndTweetsModel storiesAndTweetsModelObj = StoriesAndTweetsModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
