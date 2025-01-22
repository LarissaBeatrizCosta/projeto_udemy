import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_curso_app/controllers/firebase_options.dart';
import 'package:udemy_curso_app/i10/auth.dart';
import 'package:udemy_curso_app/views/home_view.dart';
import 'package:udemy_curso_app/views/login_view.dart';
import 'package:udemy_curso_app/views/profile_view.dart';

import 'package:intl/intl.dart';
import 'package:udemy_curso_app/views/register_product_view.dart';
import 'package:udemy_curso_app/views/splash_view.dart';

import 'binds/user_binds.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;
Future<void> main() async {
  //Altera o idioma para português
  Intl.defaultLocale = 'pt_BR';

  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(
          const LabelOverrides(),
        ),
        FirebaseUILocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'PetShop',
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/profile',
          page: () => ProfileView(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/splash',
          page: () => SplashView(),
          binding: UserBind(),
        ),
        GetPage(
          name: '/register_product',
          page: () => RegisterProductView(),
          binding: UserBind(),
        )
      ],
    );
  }
}
