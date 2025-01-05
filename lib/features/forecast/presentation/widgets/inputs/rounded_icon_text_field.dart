import 'package:flutter/material.dart';
import '../../../../../core/resources/theme/app_outline_input_border.dart';
import '../../../../../core/resources/theme/colors.dart';

class RoundedIconTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextInputType inputType;
  final bool isSecureText;
  final bool isLoading;
  final bool isError;

  const RoundedIconTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.inputType, required this.isSecureText,
    this.onChanged,
    required this.isLoading, required this.isError
  });

  @override
  RoundedIconTextFieldState createState() => RoundedIconTextFieldState();
}

class RoundedIconTextFieldState extends State<RoundedIconTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      style: TextStyle(
        color: AppColors.boldText,
        fontSize: 16,
      ),
      enabled: !widget.isLoading,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.greyAttribute,
          fontSize: 16,
        ),
        prefixIcon: Icon(widget.icon),
        prefixIconColor: widget.isError ? AppColors.red : AppColors.greyAttribute,
        filled: true,
        fillColor: AppColors.greyField,
        border: AppOutlineInputBorders.border(widget.isError),
        focusedBorder: AppOutlineInputBorders.focused(),
        enabledBorder: AppOutlineInputBorders.enabled(),
        disabledBorder: AppOutlineInputBorders.disabled(),
      ),
    );
  }
}