import 'dart:convert';

/// stories : [{"user_image":"https://firebasestorage.googleapis.com/v0/b/test-project-a6080.appspot.com/o/I07.png?alt=media&token=103329e3-c58b-4ef6-a1f6-da1478e681e2","user_name":"test","story_tags":["tag"],"story_images":["url"]}]

HomeStoryResponseEntity homeStoryResponseEntityFromJson(String str) =>
    HomeStoryResponseEntity.fromJson(json.decode(str));

String homeStoryResponseEntityToJson(HomeStoryResponseEntity data) =>
    json.encode(data.toJson());

class HomeStoryResponseEntity {
  HomeStoryResponseEntity({
    List<Stories>? stories,
  }) {
    _stories = stories;
  }

  HomeStoryResponseEntity.fromJson(dynamic json) {
    if (json['stories'] != null) {
      _stories = [];
      json['stories'].forEach((v) {
        _stories?.add(Stories.fromJson(v));
      });
    }
  }

  List<Stories>? _stories;

  HomeStoryResponseEntity copyWith({
    List<Stories>? stories,
  }) =>
      HomeStoryResponseEntity(
        stories: stories ?? _stories,
      );

  List<Stories>? get stories => _stories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_stories != null) {
      map['stories'] = _stories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// user_image : "https://firebasestorage.googleapis.com/v0/b/test-project-a6080.appspot.com/o/I07.png?alt=media&token=103329e3-c58b-4ef6-a1f6-da1478e681e2"
/// user_name : "test"
/// story_tags : ["tag"]
/// story_images : ["url"]

Stories storiesFromJson(String str) => Stories.fromJson(json.decode(str));

String storiesToJson(Stories data) => json.encode(data.toJson());

class Stories {
  Stories({
    String? userImage,
    String? userName,
    String? createdAt,
    List<String>? storyTags,
    List<String>? storyImages,
  }) {
    _userImage = userImage;
    _userName = userName;
    _storyTags = storyTags;
    _storyImages = storyImages;
    _createdAt = createdAt;
  }

  Stories.fromJson(dynamic json) {
    _userImage = json['user_image'];
    _userName = json['user_name'];
    _createdAt = json['created_at'];
    _storyTags =
        json['story_tags'] != null ? json['story_tags'].cast<String>() : [];
    _storyImages =
        json['story_images'] != null ? json['story_images'].cast<String>() : [];
  }

  String? _userImage;
  String? _createdAt;
  String? _userName;
  List<String>? _storyTags;
  List<String>? _storyImages;

  Stories copyWith({
    String? userImage,
    String? userName,
    String? createdAt,
    List<String>? storyTags,
    List<String>? storyImages,
  }) =>
      Stories(
        userImage: userImage ?? _userImage,
        userName: userName ?? _userName,
        createdAt: createdAt ?? _createdAt,
        storyTags: storyTags ?? _storyTags,
        storyImages: storyImages ?? _storyImages,
      );

  String? get userImage => _userImage;

  String? get createdAt => _createdAt;

  String? get userName => _userName;

  List<String>? get storyTags => _storyTags;

  List<String>? get storyImages => _storyImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_image'] = _userImage;
    map['user_name'] = _userName;
    map['story_tags'] = _storyTags;
    map['story_images'] = _storyImages;
    map['created_at'] = _createdAt;
    return map;
  }
}
