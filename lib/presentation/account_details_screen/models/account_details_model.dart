import '../../../core/app_export.dart';
import 'fortysix_item_model.dart';
import 'widget_item_model.dart';

class AccountDetailsModel {
  List<FortysixItemModel> fortysixItemList = [
    FortysixItemModel(fortySix: ImageConstant.img46),
    FortysixItemModel(fortySix: ImageConstant.img47),
    FortysixItemModel(fortySix: ImageConstant.img48)
  ];

  List<WidgetItemModel> widgetItemList = [
    WidgetItemModel(image: ImageConstant.imgEllipse15),
    WidgetItemModel(image: ImageConstant.imgEllipse22),
    WidgetItemModel(image: ImageConstant.imgEllipse24),
    WidgetItemModel(image: ImageConstant.imgEllipse26),
    WidgetItemModel(image: ImageConstant.imgEllipse28)
  ];
}
