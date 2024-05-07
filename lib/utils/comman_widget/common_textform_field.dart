import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

Widget buildCommonTextFormField({
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  bool obscureText = false,
  TextEditingController? controller,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onChanged, // Callback for onChanged event
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    onChanged: onChanged, // Pass the onChanged callback to the TextFormField
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF21A0FF),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      floatingLabelBehavior: labelText != null
          ? FloatingLabelBehavior.auto
          : FloatingLabelBehavior.never,
      labelStyle: labelText != null
          ? const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1,
              color: Colors.grey,
            )
          : null,
    ),
  );
}
