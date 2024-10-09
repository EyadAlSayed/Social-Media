import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/core/helper/hive_hepler.dart';
import 'app/soical_media_app.dart';
import 'core/helper/app_info_helper.dart';
import 'core/injection/injection_container.dart';
import 'core/resource/app_constant.dart';
import 'core/resource/app_key.dart';
import 'core/storage/shared/app_shared_preferences.dart';
import 'firebase_options.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDI();
  await PackageInfo.fromPlatform().then((value) {
    AppInfoHelper.packageInfo = value;
  });
  await HiveHelper.init();
  SharedPreferences shPref = await SharedPreferences.getInstance();
  AppSharedPreferences.init(shPref);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(
          AppKey.arabicLocalizationCode,
        ),
        Locale(
          AppKey.englishLocalizationCode,
        ),
      ],
      path: AppConstant.assetTranslationPath,
      fallbackLocale: const Locale(
        AppKey.arabicLocalizationCode,
      ),
      startLocale: Locale(AppSharedPreferences.getLanguage()),
      child: const SocialMediaApp(),
    ),
  );
}
