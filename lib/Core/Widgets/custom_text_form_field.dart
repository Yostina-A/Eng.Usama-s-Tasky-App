import 'package:flutter/material.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).extension<TextStyles>()!.bodyOne),
        SizedBox(height: 20),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator != null
              ? (String? value) => validator!(value)
              : null,
          style: Theme.of(context).extension<TextStyles>()!.secondaryText1,
          decoration: InputDecoration(hintText: hintText),
          cursorColor: Colors.white,
        ),
      ],
    );
  }
}
