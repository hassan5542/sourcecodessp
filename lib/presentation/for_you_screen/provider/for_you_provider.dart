import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/for_you_screen/models/for_you_model.dart';

/// A provider class for the ForYouScreen.
///
/// This provider manages the state of the ForYouScreen, including the
/// current forYouModelObj
class ForYouProvider extends ChangeNotifier {
  ForYouModel forYouModelObj = ForYouModel();

  @override
  void dispose() {
    super.dispose();
  }
}
