import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/constants/radius_constants.dart';
import '/ui/components/nuntium_text_styles.dart';
import '/ui/components/widgets/nuntium_svg_icon.dart';

class NuntiumTextField extends StatefulWidget {
  const NuntiumTextField({
    super.key,
    required this.hintText,
    required this.prefixIconPath,
    this.isPrivate = false,
    this.suffixIcon,
    required this.controller,
  });

  final String hintText;
  final String prefixIconPath;
  final bool isPrivate;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  State<NuntiumTextField> createState() => _NuntiumTextFieldState();
}

class _NuntiumTextFieldState extends State<NuntiumTextField> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = const BorderRadius.all(
      RadiusConstants.circularDefault,
    );

    Widget prefixIcon = NuntiumSvgIcon(
      widget.prefixIconPath,
      color: _focus.hasFocus || widget.controller.text.isNotEmpty
          ? ColorConstants.purplePrimary
          : ColorConstants.greyPrimary,
    );

    TextStyle hintStyle = NuntiumTextStyles.medium16.copyWith(
      color: ColorConstants.greyPrimary,
    );

    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: widget.controller.text.isNotEmpty
            ? ColorConstants.purplePrimary
            : ColorConstants.transparent,
      ),
    );

    OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: ColorConstants.purplePrimary),
    );

    InputDecoration textFieldDecoration = InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: widget.suffixIcon,
      hintText: widget.hintText,
      hintMaxLines: 1,
      hintStyle: hintStyle,
      border: border,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
    );

    TextField textField = TextField(
      controller: widget.controller,
      focusNode: _focus,
      maxLines: 1,
      keyboardType: TextInputType.text,
      cursorColor: ColorConstants.purplePrimary,
      style: NuntiumTextStyles.medium16,
      obscureText: widget.isPrivate,
      decoration: textFieldDecoration,
    );

    BoxDecoration containerDecoration = BoxDecoration(
      color: _focus.hasFocus || widget.controller.text.isNotEmpty
          ? ColorConstants.white
          : ColorConstants.greyLighter,
      borderRadius: borderRadius,
    );

    return Container(
      decoration: containerDecoration,
      child: textField,
    );
  }
}
