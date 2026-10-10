import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {
  const TextStyles({
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
    this.noDataFound,
  });

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
  TextStyles copyWith({
    TextStyle? titleOne, 
    TextStyle? titleTwo, 
    TextStyle? titleThree,
    TextStyle? screenTitle,
    TextStyle? bodyOne,
    TextStyle? bodyTwo,
    TextStyle? secondaryText1,
    TextStyle? secondaryText2,
    TextStyle? secondaryText3,
    TextStyle? textFieldLabel,
    TextStyle? textFieldHint,
    TextStyle? primaryButtonText,
    TextStyle? highPriorityTasksTitle,
    TextStyle? undoneTask,
    TextStyle? doneTask,
    TextStyle? noDataFound,
    }) {
    return TextStyles(
      titleOne: titleOne ?? titleOne,
      titleTwo: titleTwo ?? titleTwo,
      titleThree: titleTwo ?? titleThree,
      screenTitle: screenTitle ?? screenTitle,
      bodyOne: bodyOne ?? bodyOne,
      bodyTwo: bodyTwo ?? bodyTwo,
      secondaryText1: secondaryText1 ?? secondaryText1,
      secondaryText2: secondaryText2 ?? secondaryText2,
      secondaryText3: secondaryText3 ?? secondaryText3,
      textFieldLabel: textFieldLabel ?? textFieldLabel,
      textFieldHint: textFieldHint ?? textFieldHint,
      primaryButtonText: primaryButtonText ?? primaryButtonText,
      highPriorityTasksTitle: highPriorityTasksTitle ?? highPriorityTasksTitle,
      undoneTask: undoneTask ?? undoneTask,
      doneTask: doneTask ?? doneTask,
      noDataFound: noDataFound ?? noDataFound,
    );
  }

  @override
  TextStyles lerp(covariant TextStyles? other, double t) {
    if (other == null) {
      return this;
    }

    return TextStyles(
      titleOne: TextStyle.lerp(titleOne, other.titleOne, t),
      titleTwo: TextStyle.lerp(titleTwo, other.titleTwo, t),
      titleThree: TextStyle.lerp(titleThree, other.titleThree, t),
      screenTitle: TextStyle.lerp(screenTitle, other.screenTitle, t),
      bodyOne: TextStyle.lerp(bodyOne, other.bodyOne, t),
      bodyTwo: TextStyle.lerp(bodyTwo, other.bodyTwo, t),
      secondaryText1: TextStyle.lerp(secondaryText1, other.secondaryText1, t),
      secondaryText2: TextStyle.lerp(secondaryText2, other.secondaryText2, t),
      secondaryText3: TextStyle.lerp(secondaryText3, other.secondaryText3, t),
      textFieldLabel: TextStyle.lerp(textFieldLabel, other.textFieldLabel, t),
      textFieldHint: TextStyle.lerp(textFieldHint, other.textFieldHint, t),
      primaryButtonText: TextStyle.lerp(
        primaryButtonText,
        other.primaryButtonText,
        t,
      ),
      highPriorityTasksTitle: TextStyle.lerp(
        highPriorityTasksTitle,
        other.highPriorityTasksTitle,
        t,
      ),

      undoneTask: TextStyle.lerp(undoneTask, other.undoneTask, t),
      doneTask: TextStyle.lerp(doneTask, other.doneTask, t),

      noDataFound: TextStyle.lerp(noDataFound, other.noDataFound, t),
    );
  }
}
