import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/page_view_screen/models/page_view_model.dart';
import '../models/conversions_item_model.dart';

/// A provider class for the PageViewScreen.
///
/// This provider manages the state of the PageViewScreen, including the
/// current pageViewModelObj

// ignore_for_file: must_be_immutable
class PageViewProvider extends ChangeNotifier {
  TextEditingController commentController = TextEditingController();

  PageViewModel pageViewModelObj = PageViewModel();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }
}
