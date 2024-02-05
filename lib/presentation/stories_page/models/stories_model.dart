import '../../../core/app_export.dart';
import 'storieslist_item_model.dart';
import 'eventslist_item_model.dart';

class StoriesModel {
  List<StorieslistItemModel> storieslistItemList = [
    StorieslistItemModel(roy: ImageConstant.imgEllipse15, roy1: "Roy"),
    StorieslistItemModel(roy: ImageConstant.imgEllipse22, roy1: "Jordan"),
    StorieslistItemModel(roy: ImageConstant.imgEllipse26, roy1: "Chrystin"),
    StorieslistItemModel(roy: ImageConstant.imgEllipse28, roy1: "Vrindha"),
    StorieslistItemModel(roy1: "Angeline")
  ];

  List<EventslistItemModel> eventslistItemList = [
    EventslistItemModel(
        lIVEWeTheFest: ImageConstant.img19144x147,
        blueLoyalParty: ImageConstant.img192,
        lIVEWeTheFest1: "LIVE - We The Fest",
        price: "19 : 00 | Forg Stadium",
        blueLoyalParty1: "Blue Loyal Party",
        price1: "19 : 35 | Latuna Beach")
  ];
}
