import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:social_media/feature/main/domain/entities/response/home_story_response_entity.dart';
import 'package:path_provider/path_provider.dart';
import '../../feature/main/domain/entities/response/home_posts_response_entity.dart';
import '../resource/app_key.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/9/2024.
 */

abstract class HiveHelper {
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await openBoxes();
  }

  static void clear() {
    Hive.box(AppKey.homeBox).clear();
  }

  static Future<void> openBoxes() async {
    await Hive.openBox(AppKey.homeBox);
  }


  //// Home stories hive method

  static void saveHomeStories(
      {required String boxKey,
      required String saveKey,
      required HomeStoryResponseEntity entity}) {
    var box = Hive.box(boxKey);
    box.put(saveKey, jsonEncode(entity));
  }

  static HomeStoryResponseEntity getHomeStories(
      {required String boxKey, required String saveKey}) {
    var box = Hive.box(boxKey);
    return jsonDecode(box.get(saveKey));
  }

  //// Home posts hive method

  static void saveHomePosts(
      {required String boxKey,
      required String saveKey,
      required HomePostsResponseEntity entity}) {
    var box = Hive.box(boxKey);
    box.put(saveKey, jsonEncode(entity));
  }

  static HomePostsResponseEntity getHomePosts(
      {required String boxKey, required String saveKey}) {
    var box = Hive.box(boxKey);
    return jsonDecode(box.get(saveKey));
  }
}
