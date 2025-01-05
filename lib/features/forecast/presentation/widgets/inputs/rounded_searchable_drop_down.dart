import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weather_mobile/core/resources/theme/app_outline_input_border.dart';
import '../../../../../core/resources/theme/colors.dart';

class RoundedSearchableDropDown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final bool isLoading;
  final bool isError;
  final List<String> dataList;
  final String hintText;
  final String placeholder;

  const RoundedSearchableDropDown({
    super.key,
    this.onChanged,
    required this.isLoading, required this.isError, required this.dataList, required this.hintText, required this.placeholder
  });

  @override
  RoundedSearchableDropDownState createState() => RoundedSearchableDropDownState();
}

class RoundedSearchableDropDownState extends State<RoundedSearchableDropDown> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          menuProps: MenuProps(
            backgroundColor: AppColors.greyField,
            borderRadius: BorderRadius.circular(12.0)
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.greyAttribute,
                fontSize: 16,
              ),
              border: AppOutlineInputBorders.border(widget.isError),
              filled: true,
              fillColor: AppColors.greyField,
              focusedBorder: AppOutlineInputBorders.focused(),
              enabledBorder: AppOutlineInputBorders.enabled(),
              disabledBorder: AppOutlineInputBorders.disabled(),
            )
          ),
        ),
        items: widget.dataList,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: const TextStyle(
              color: AppColors.greyAttribute,
              fontSize: 16,
            ),
            border: AppOutlineInputBorders.border(widget.isError),
            filled: true,
            fillColor: AppColors.greyField,
            focusedBorder: AppOutlineInputBorders.focused(),
            enabledBorder: AppOutlineInputBorders.enabled(),
            disabledBorder: AppOutlineInputBorders.disabled(),
            enabled: !widget.isLoading
          )
        ),
        onChanged: widget.onChanged
      ),
    );
  }
}