import 'package:flutter/material.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.itemList,
    required this.controller,
    required this.width,
    required this.height,
    this.spaceBetweenTextAndIcon,
  });
  final String hintText;
  final List<String> itemList;
  final TextEditingController controller;
  final double width;
  final double height;
  final double? spaceBetweenTextAndIcon;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? currentValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appViolet, width: 1)),
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
          style: const TextStyle(color: AppColors.appViolet),
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          dropdownColor: AppColors.gray20,
          iconEnabledColor: AppColors.black,
          hint: Padding(
            padding:
                EdgeInsets.only(right: widget.spaceBetweenTextAndIcon ?? 30.0),
            child: Text(widget.hintText,
                style: const TextStyle(color: AppColors.appViolet)),
          ),
          underline: const SizedBox(),
          items: List.generate(
              widget.itemList.length,
              (index) => DropdownMenuItem<String>(
                  value: widget.itemList[index],
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: widget.spaceBetweenTextAndIcon ?? 30.0),
                    child: Text(widget.itemList[index]
                        // style: textStyle,
                        ),
                  ))),
          value: currentValue,
          onChanged: (String? value) {
            setState(() {
              widget.controller.text = value ?? "";
              currentValue = value;
            });
          }),
    );
  }
}
