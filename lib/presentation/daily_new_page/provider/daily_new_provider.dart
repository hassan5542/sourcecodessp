import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/daily_new_page/models/daily_new_model.dart';
import '../models/profileslist1_item_model.dart';
import '../models/forty_item_model.dart';

/// A provider class for the DailyNewPage.
///
/// This provider manages the state of the DailyNewPage, including the
/// current dailyNewModelObj

// ignore_for_file: must_be_immutable
class DailyNewProvider extends ChangeNotifier {
  DailyNewModel dailyNewModelObj = DailyNewModel();

  @override
  void dispose() {
    super.dispose();
  }
}
