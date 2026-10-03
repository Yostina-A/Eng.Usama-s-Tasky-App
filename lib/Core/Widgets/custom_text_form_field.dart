import 'package:flutter/material.dart';

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
        Text(
          label,
          style: TextStyle(
            color: Color(0xFFFFFCFC),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator != null
              ? (String? value) => validator!(value)
              : null,
          style: TextStyle(
            color: Color(0xFFFFFCFC),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF6D6D6D),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Color(0xFF282828),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: Colors.white,
        ),
      ],
    );
  }
}
