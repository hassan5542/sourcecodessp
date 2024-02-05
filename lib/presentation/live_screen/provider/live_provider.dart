import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/live_screen/models/live_model.dart';

/// A provider class for the LiveScreen.
///
/// This provider manages the state of the LiveScreen, including the
/// current liveModelObj
class LiveProvider extends ChangeNotifier {
  TextEditingController commentController = TextEditingController();

  LiveModel liveModelObj = LiveModel();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }
}
