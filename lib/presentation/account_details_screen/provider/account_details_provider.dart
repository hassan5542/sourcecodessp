import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/account_details_screen/models/account_details_model.dart';
import '../models/fortysix_item_model.dart';
import '../models/widget_item_model.dart';

/// A provider class for the AccountDetailsScreen.
///
/// This provider manages the state of the AccountDetailsScreen, including the
/// current accountDetailsModelObj

// ignore_for_file: must_be_immutable
class AccountDetailsProvider extends ChangeNotifier {
  AccountDetailsModel accountDetailsModelObj = AccountDetailsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
