import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your work and get the result",
    image: "assets/images/123.jpg",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: "assets/images/3773.jpg",
    desc:
    "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/16627.jpg",
    desc:
    "Take control of notifications, collaborate live or on your own time.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image2.png",
    desc:
    "Take control of notifications, collaborate live or on your own time.",
  ),
];