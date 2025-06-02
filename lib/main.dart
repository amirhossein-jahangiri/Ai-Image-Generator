import 'package:ai_image_generator/ai_generator_screen.dart';
import 'package:ai_image_generator/generator_provider.dart';
import 'package:ai_image_generator/utils/route_config.dart';
import 'package:ai_image_generator/utils/theme_config.dart';
import 'package:ai_image_generator/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GeneratorProvider()),
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ],
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Image Generator Mobile App',
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [Locale('fa', 'IR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeConfig.darkTheme,
      routes: RouteConfig.routes,
      initialRoute: RouteName.HOME_SCREEN,
    );
  }
}
/*
_buildHeaderSlider(context),
SizedBox(height: ScreenSize().getHeightPercentage(4)),
_buildFancyBoxRow(),
SizedBox(height: ScreenSize().getHeightPercentage(2)),
_buildPreviousRequests(context),
SizedBox(height: ScreenSize().getHeightPercentage(2)),
Text('پیشنهاد ها', style: Theme.of(context).textTheme.titleMedium),
_buildTabBar(),
SizedBox(height: 10),
_buildTabBarView(),*/
