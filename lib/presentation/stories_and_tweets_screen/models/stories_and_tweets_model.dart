import '../../../core/app_export.dart';
import 'livestories_item_model.dart';
import 'frame_item_model.dart';

class StoriesAndTweetsModel {
  List<LivestoriesItemModel> livestoriesItemList = [
    LivestoriesItemModel(save: ImageConstant.imgSave, newPost: "New Post"),
    LivestoriesItemModel(newPost: "Jordan"),
    LivestoriesItemModel(newPost: "Angeline"),
    LivestoriesItemModel(newPost: "Chrystin"),
    LivestoriesItemModel(newPost: "Vrindha")
  ];

  List<FrameItemModel> frameItemList = [
    FrameItemModel(
        albertOConnor: "Albert O’connor",
        duration: "4  hours ago",
        introduceIAmA:
            "Introduce I am a photographer who travels around the world everyday, these are some of my works as a photographer.",
        zipcode: "2200",
        eightHundred: "800",
        albertOConnor1: "Albert O’connor",
        duration1: "4  hours ago",
        introduceIAmA1:
            "Introduce I am a photographer who travels around the world everyday, these are some of my works as a photographer.")
  ];
}
