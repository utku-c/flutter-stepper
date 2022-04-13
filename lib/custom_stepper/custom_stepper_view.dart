// ignore_for_file: prefer_const_constructors

import 'package:dynamicmodel_caching_stepper/model/custom_theme_model.dart';
import 'package:dynamicmodel_caching_stepper/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_stepper_view_model.dart';

class CustomStepperView extends CustomStepperViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STEPPER"),
        leading: Icon(
          Icons.align_horizontal_left_sharp,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionChip(
                label: Icon(
                  Icons.circle,
                  color: Colors.purple,
                ),
                onPressed: () {
                  Provider.of<CustomThemeModel>(context, listen: false)
                      .setThemeData(myThemePurple);
                },
              ),
              ActionChip(
                label: Icon(
                  Icons.circle,
                  color: Colors.green,
                ),
                onPressed: () {
                  Provider.of<CustomThemeModel>(context, listen: false)
                      .setThemeData(myThemeGreen);
                },
              ),
              ActionChip(
                label: Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  Provider.of<CustomThemeModel>(context, listen: false)
                      .setThemeData(ThemeData.light());
                },
              ),
              ActionChip(
                label: Icon(
                  Icons.circle,
                  color: Colors.black,
                ),
                onPressed: () {
                  Provider.of<CustomThemeModel>(context, listen: false)
                      .setThemeData(ThemeData.dark());
                },
              ),
            ],
          ),
        ],
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: activeCurrentStep,
        steps: stepList(),
        onStepContinue: () {
          if (activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              activeCurrentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (activeCurrentStep == 0) {
            return;
          }

          setState(() {
            activeCurrentStep -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
