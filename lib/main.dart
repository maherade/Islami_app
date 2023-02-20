import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/splash_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/sura_details/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hadeth_details/hadeth_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    getValueFromShared();

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(settingsProvider.languageCode),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }

  getValueFromShared() async {
    final pref = await SharedPreferences.getInstance();
    settingsProvider.changeLanguage(pref.getString("lang") ?? 'en');

    if (pref.getString("theme") == "light") {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (pref.getString("theme") == "dark") {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
