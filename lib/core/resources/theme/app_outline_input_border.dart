import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class AppOutlineInputBorders {
  static OutlineInputBorder border(bool isError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: isError ? AppColors.red : AppColors.greyAttribute,
        width: 1,
      ),
    );
  }

  static OutlineInputBorder focused() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.blueAttribute,
        width: 1,
      ),
    );
  }

  static OutlineInputBorder enabled() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.greyOutline,
        width: 1,
      ),
    );
  }

  static OutlineInputBorder disabled() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.greyField,
        width: 1,
      ),
    );
  }
}