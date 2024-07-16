
import 'package:flutter/material.dart';
import 'package:try_fit/theme/app_theme.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/core/imports/core_imports.dart';
import 'package:try_fit/views/splash/splash_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: false,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetMaterialApp(
          title: 'TryFits',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: buildCustomTheme(),
           builder: EasyLoading.init(),
          home: const SplashView(),
        ),
      ),
    );
  }
}