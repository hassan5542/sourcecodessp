import '../../../core/app_export.dart';
import 'notificationslist_item_model.dart';

class NotificationsModel {
  List<NotificationslistItemModel> notificationslistItemList = [
    NotificationslistItemModel(
        image: ImageConstant.imgEllipse22,
        kevinHasFollowed: "Kevin has followed you",
        duration: "1 hour ago"),
    NotificationslistItemModel(
        image: ImageConstant.imgEllipse2254x52,
        kevinHasFollowed:
            "Arman has commented on your story\n “hey there” to your timeline",
        duration: "2 hours ago"),
    NotificationslistItemModel(image: ImageConstant.imgEllipse221),
    NotificationslistItemModel(
        image: ImageConstant.imgEllipse222,
        kevinHasFollowed:
            "Arman has commented on your story\n “hey there” to your timeline",
        duration: "2 hours ago"),
    NotificationslistItemModel(
        image: ImageConstant.imgEllipse22,
        kevinHasFollowed:
            "Arman has commented on your story\n “hey there” to your timeline",
        duration: "2 hours ago")
  ];
}
