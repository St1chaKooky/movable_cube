import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  final Color color;
  final String? errMsg;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.textInputType,
    required this.color,
    this.errMsg,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        errorText: errMsg,
        fillColor: color,
        hintText: hintText,
        hintStyle: const TextStyle(color: MyColors.textDisActiveColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Закругление границы
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Закругление границы при фокусе
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
