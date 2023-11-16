import 'package:flutter/material.dart';
import 'package:prov/provider/count_provider.dart';
import 'package:prov/provider/example_one_provider.dart';
import 'package:prov/provider/favourite_provider.dart';
import 'package:prov/provider/theme_changer_provider.dart';
import 'package:prov/screen/count_example.dart';
import 'package:prov/screen/dark_theme.dart';
import 'package:prov/screen/example_one.dart';
import 'package:prov/screen/favourite/favourite_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
              )

            ),
            home: const DarkThemeScreen(),
          );
        },
      ),
    );
  }
}
