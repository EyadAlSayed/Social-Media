import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_base_model.dart';
import 'firestore_error_handler.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

abstract class FireStoreCollectionName {
  static const String home = "home";
}

abstract class FireStoreDocumentName {
  static const String story = "story";
  static const String homePosts = "home_posts";
}

abstract class FireStoreGetMethod {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  static Future<FireStoreBaseModel> getHomePosts() {
    return FireStoreGetMethodErrorHandler.handleError(call: () async {
      return await _instance
          .collection(FireStoreCollectionName.home)
          .doc(FireStoreDocumentName.homePosts)
          .get();
    });
  }

  static Future<FireStoreBaseModel> getStoryPosts() {
    return FireStoreGetMethodErrorHandler.handleError(call: () async {
      return await _instance
          .collection(FireStoreCollectionName.home)
          .doc(FireStoreDocumentName.story)
          .get();
    });
  }
}

abstract class FireStoreAddMethod {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FireStoreBaseModel> signUp(
      {required Map<String, dynamic> body}) async {
    return FireAuthMethodErrorHandler.handleError(
      call: () async {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: body['email'] ?? "",
          password: body['password'] ?? "",
        );
      },
    );
  }

  static Future<FireStoreBaseModel> login(
      {required Map<String, dynamic> body}) async {
    return FireAuthMethodErrorHandler.handleError(
      call: () async {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: body['email'] ?? "",
          password: body['password'] ?? "",
        );

        print(userCredential.user);
        print(userCredential.credential?.token);
        print(userCredential.credential?.accessToken??"");
        print(userCredential.user?.email??"");
        print(userCredential.user?.phoneNumber??"");
      },
    );
  }

  static Future<FireStoreBaseModel> forgotPassword(
      {required Map<String, dynamic> body}) async {
    return FireAuthMethodErrorHandler.handleError(
      call: () async {
        await _auth.sendPasswordResetEmail(
          email: body['email'] ?? "",
        );
      },
    );
  }
}

abstract class FireStoreDeleteMethod {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FireStoreBaseModel> deleteUser(
      {required Map<String, dynamic> body}) async {
    FireStoreBaseModel model = FireStoreBaseModel();

    try {
      await _auth.currentUser?.delete();
    } catch (e) {
      model.code = 1;
      model.error = "error occurred : $e";
      return model;
    }

    model.code = 0;
    model.data = {};
    return model;
  }
}
