import 'package:flutter/material.dart';
import 'utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.hintText,
  });

  final TextEditingController controller;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.blue.shade100,
          selectionHandleColor: Colors.blue
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: ScreenSize().getFontSize(4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ScreenSize().getBorderRadius(2)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
