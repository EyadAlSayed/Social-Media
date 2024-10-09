import 'dart:convert';

/// posts : [{"post_images":[],"total_comments":0,"comments":[{"comment_text":"","user_image":"","user_name":"","created_at":""}],"user_image":"","user_name":"","tagged_user":"","total_likes":0,"post_text":""}]

HomePostsResponseEntity homePostsResponseEntityFromJson(String str) =>
    HomePostsResponseEntity.fromJson(json.decode(str));

String homePostsResponseEntityToJson(HomePostsResponseEntity data) =>
    json.encode(data.toJson());

class HomePostsResponseEntity {
  HomePostsResponseEntity({
    List<Posts>? posts,
  }) {
    _posts = posts;
  }

  HomePostsResponseEntity.fromJson(dynamic json) {
    if (json['posts'] != null) {
      _posts = [];
      json['posts'].forEach((v) {
        _posts?.add(Posts.fromJson(v));
      });
    }
  }

  List<Posts>? _posts;

  HomePostsResponseEntity copyWith({
    List<Posts>? posts,
  }) =>
      HomePostsResponseEntity(
        posts: posts ?? _posts,
      );

  List<Posts>? get posts => _posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_posts != null) {
      map['posts'] = _posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// post_images : []
/// total_comments : 0
/// comments : [{"comment_text":"","user_image":"","user_name":"","created_at":""}]
/// user_image : ""
/// user_name : ""
/// tagged_user : ""
/// total_likes : 0
/// post_text : ""

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    List<String>? postImages,
    List<String>? postTags,
    num? totalComments,
    List<Comments>? comments,
    String? userImage,
    String? userName,
    String? taggedUser,
    num? totalLikes,
    String? postText,
    String? createdAt,
    bool? isLike,
  }) {
    _postImages = postImages;
    _totalComments = totalComments;
    _comments = comments;
    _userImage = userImage;
    _userName = userName;
    _taggedUser = taggedUser;
    _totalLikes = totalLikes;
    _postText = postText;
    _createdAt = createdAt;
    _postTags = postTags;
    _isLike = isLike;
  }

  Posts.fromJson(dynamic json) {
    if (json['post_images'] != null) {
      _postImages = [];
      json['post_images'].forEach((v) {
        _postImages?.add(v);
      });
    }
    if (json['post_tags'] != null) {
      _postTags = [];
      json['post_tags'].forEach((v) {
        _postTags?.add(v);
      });
    }

    _totalComments = json['total_comments'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _userImage = json['user_image'];
    _userName = json['user_name'];
    _taggedUser = json['tagged_user'];
    _totalLikes = json['total_likes'];
    _postText = json['post_text'];
    _createdAt = json['created_at'];
    _isLike = json['is_like'];
  }

  List<String>? _postImages;
  List<String>? _postTags;
  num? _totalComments;
  List<Comments>? _comments;
  String? _userImage;
  String? _userName;
  String? _taggedUser;
  num? _totalLikes;
  String? _postText;
  String? _createdAt;
  bool? _isLike;

  Posts copyWith({
    List<String>? postImages,
    List<String>? postTags,
    num? totalComments,
    List<Comments>? comments,
    String? userImage,
    String? userName,
    String? taggedUser,
    num? totalLikes,
    String? postText,
    String? createdAt,
    bool? isLike,
  }) =>
      Posts(
        postImages: postImages ?? _postImages,
        postTags: postTags ?? _postTags,
        totalComments: totalComments ?? _totalComments,
        comments: comments ?? _comments,
        userImage: userImage ?? _userImage,
        userName: userName ?? _userName,
        taggedUser: taggedUser ?? _taggedUser,
        totalLikes: totalLikes ?? _totalLikes,
        postText: postText ?? _postText,
        createdAt: createdAt ?? _createdAt,
        isLike: isLike ?? _isLike,
      );

  List<String>? get postImages => _postImages;
  List<String>? get postTags => _postTags;

  num? get totalComments => _totalComments;


  set totalComments(num? value) {
    _totalComments = value;
  }

  List<Comments>? get comments => _comments;

  String? get userImage => _userImage;

  String? get userName => _userName;

  String? get taggedUser => _taggedUser;

  num? get totalLikes => _totalLikes;


  set totalLikes(num? value) {
    _totalLikes = value;
  }

  String? get postText => _postText;

  String? get createdAt => _createdAt;


  bool? get isLike => _isLike;

  set isLike(bool? value) {
    _isLike = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_postImages != null) {
      map['post_images'] = _postImages;
    }
    map['total_comments'] = _totalComments;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    map['user_image'] = _userImage;
    map['user_name'] = _userName;
    map['tagged_user'] = _taggedUser;
    map['total_likes'] = _totalLikes;
    map['post_text'] = _postText;
    map['create_at'] = _createdAt;
    return map;
  }
}

/// comment_text : ""
/// user_image : ""
/// user_name : ""
/// created_at : ""

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  Comments({
    String? commentText,
    String? userImage,
    String? userName,
    String? createdAt,
  }) {
    _commentText = commentText;
    _userImage = userImage;
    _userName = userName;
    _createdAt = createdAt;
  }

  Comments.fromJson(dynamic json) {
    _commentText = json['comment_text'];
    _userImage = json['user_image'];
    _userName = json['user_name'];
    _createdAt = json['created_at'];
  }

  String? _commentText;
  String? _userImage;
  String? _userName;
  String? _createdAt;

  Comments copyWith({
    String? commentText,
    String? userImage,
    String? userName,
    String? createdAt,
  }) =>
      Comments(
        commentText: commentText ?? _commentText,
        userImage: userImage ?? _userImage,
        userName: userName ?? _userName,
        createdAt: createdAt ?? _createdAt,
      );

  String? get commentText => _commentText;

  String? get userImage => _userImage;

  String? get userName => _userName;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment_text'] = _commentText;
    map['user_image'] = _userImage;
    map['user_name'] = _userName;
    map['created_at'] = _createdAt;
    return map;
  }
}
