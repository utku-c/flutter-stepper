// ignore_for_file: prefer_const_constructors

import 'package:dynamicmodel_caching_stepper/preferences/shared_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_stepper/custom_stepper.dart';
import 'model/custom_theme_model.dart';

Future<void> main() async {
  await SharedManager.instance.init();
  runApp(ChangeNotifierProvider(
    create: (context) => CustomThemeModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<CustomThemeModel>(context).getThemeData,
      home: CustomStepper(),
    );
  }
}
