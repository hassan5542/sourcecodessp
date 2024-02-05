import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/friends_screen/models/friends_model.dart';
import '../models/ninetysevenlist_item_model.dart';
import '../models/follow_item_model.dart';

/// A provider class for the FriendsScreen.
///
/// This provider manages the state of the FriendsScreen, including the
/// current friendsModelObj

// ignore_for_file: must_be_immutable
class FriendsProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  FriendsModel friendsModelObj = FriendsModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
