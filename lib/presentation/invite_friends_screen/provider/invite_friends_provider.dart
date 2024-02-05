import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/invite_friends_screen/models/invite_friends_model.dart';
import '../models/friendlist_item_model.dart';

/// A provider class for the InviteFriendsScreen.
///
/// This provider manages the state of the InviteFriendsScreen, including the
/// current inviteFriendsModelObj

// ignore_for_file: must_be_immutable
class InviteFriendsProvider extends ChangeNotifier {
  InviteFriendsModel inviteFriendsModelObj = InviteFriendsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
