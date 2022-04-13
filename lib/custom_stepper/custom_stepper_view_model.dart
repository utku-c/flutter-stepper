// ignore_for_file: unused_element, empty_catches, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'custom_stepper.dart';

abstract class CustomStepperViewModel extends State<CustomStepper> {
  int activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  List<Step> stepList() => [
        Step(
          state:
              activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: activeCurrentStep >= 0,
          title: const Text('Account'),
          content: newMethodStepOneTextField(),
        ),
        Step(
            state:
                activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
            isActive: activeCurrentStep >= 1,
            title: const Text('Address'),
            content: newMethodStepTwoTextField()),
        Step(
            state: StepState.complete,
            isActive: activeCurrentStep >= 2,
            title: const Text('Confirm'),
            content: newMethodStepThreeContainer())
      ];

  Container newMethodStepThreeContainer() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'AD: ${name.text}',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'E-Posta: ${email.text}',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Şifre: ${pass.text}',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Adres : ${address.text}',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Pin Kodu : ${pincode.text}',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ));
  }

  Container newMethodStepTwoTextField() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: address,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full House Address',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: pincode,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pin Code',
            ),
          ),
        ],
      ),
    );
  }

  Container newMethodStepOneTextField() {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: pass,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ],
      ),
    );
  }
}
