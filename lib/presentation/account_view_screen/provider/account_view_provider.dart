import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/account_view_screen/models/account_view_model.dart';

/// A provider class for the AccountViewScreen.
///
/// This provider manages the state of the AccountViewScreen, including the
/// current accountViewModelObj

// ignore_for_file: must_be_immutable
class AccountViewProvider extends ChangeNotifier {
  AccountViewModel accountViewModelObj = AccountViewModel();

  @override
  void dispose() {
    super.dispose();
  }
}
