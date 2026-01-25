import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/binding/splash_binding.dart';
import 'routes/route_app/route_app.dart';
import 'routes/route_app/route_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return SafeArea(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: RouteApp.route,
            initialBinding: SplashBinding(),
            initialRoute: RouteName.splashscreen,
            home: child,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
              useMaterial3: true,
              primaryColor: Color.fromARGB(255, 68, 35, 253),
              focusColor: Color.fromARGB(255, 39, 206, 33),
              hoverColor: Colors.amber,
              canvasColor: Colors.red,
              cardColor: Color(0xFFF5F7FF),
              // ignore: deprecated_member_use
              shadowColor: Colors.black.withOpacity(0.04),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                scrolledUnderElevation: 0,
                shadowColor: Colors.transparent,
              ),
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                ),
                titleMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                ),
                titleSmall: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                ),
                bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                bodySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
