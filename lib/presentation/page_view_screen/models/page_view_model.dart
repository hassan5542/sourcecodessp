import 'conversions_item_model.dart';
import '../../../core/app_export.dart';

class PageViewModel {
  List<ConversionsItemModel> conversionsItemList =
      List.generate(4, (index) => ConversionsItemModel());
}
