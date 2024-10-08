import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_base_model.dart';
import 'firestore_error_handler.dart';

/**
   * Created by Eng.Eyad AlSayed on 10/7/2024.
   */

abstract class FireStoreCollectionName {
  static const String signUp = "signUp";
  static const String login = "login";
  static const String forgotPassword = "forgot-password";
  static const String info = "info";
  static const String appConfig = "app-config";
  static const String messages = "messages";
  static const String booking = "booking";
  static const String favorite = "favorite";
  static const String businessMessage = "business-message";
}

abstract class FireStoreDocumentName {
  static const String aboutUs = "about-us";
  static const String privacyPolicy = "privacy-policy";
  static const String contactUs = "contact-us";
  static const String places = "places";
  static const String home = "home";
  static const String activities = "activities";
  static const String activityViews = "activity-views";
  static const String offers = "offers";
  static const String notification = "notification";
  static const String subActivities = "sub-activities";
  static const String subActivityAds = "ads";
  static const String launchType = "launch-type";
  static const String signUpEmail = "signup-email";
  static const String signUpPhone = "signup-phone";
}

abstract class FireStoreGetMethod {
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

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
