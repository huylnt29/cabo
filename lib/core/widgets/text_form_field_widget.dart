import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_modifiers/flutterui_modifiers.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    required this.textInputType,
    required this.colorTheme,
    required this.labelText,
    super.key,
  });
  final TextInputType textInputType;
  final Color colorTheme;
  final String labelText;
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: widget.colorTheme),
        cursorColor: widget.colorTheme,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          label: Text(widget.labelText),
          focusColor: widget.colorTheme,
          labelStyle: AppTextStyles.heading3(widget.colorTheme),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorTheme),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorTheme),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorTheme),
          ),
        ),
      ).margin(all: 20),
    );
  }
}
