
import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {

  const TextStyles ({
    this.titleOne, 
    this.titleTwo,
    this.titleThree, 
    this.bodyOne, 
    this.bodyTwo, 
    this.secondaryText1,
    this.secondaryText2,
    this.secondaryText3, 
    this.screenTitle, 
    this.textFieldLabel, 
    this.textFieldHint,
    this.primaryButtonText,
    this.highPriorityTasksTitle,
    this.undoneTask,
    this.doneTask,
    this.noDataFound });

  final TextStyle? titleOne;
  final TextStyle? titleTwo;
  final TextStyle? titleThree;


  final TextStyle? screenTitle;

  final TextStyle? bodyOne;
  final TextStyle? bodyTwo;

  final TextStyle? secondaryText1;
  final TextStyle? secondaryText2;
  final TextStyle? secondaryText3;

  final TextStyle? textFieldLabel;
  final TextStyle? textFieldHint;

  final TextStyle? primaryButtonText;
  final TextStyle? highPriorityTasksTitle;


  final TextStyle? undoneTask;
  final TextStyle? doneTask;

  final TextStyle? noDataFound;


  @override
  ThemeExtension<TextStyles> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TextStyles> lerp(covariant ThemeExtension<TextStyles>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
  
}