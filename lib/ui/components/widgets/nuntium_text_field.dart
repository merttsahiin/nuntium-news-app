import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';

class NuntiumTextField extends StatefulWidget {
  const NuntiumTextField({
    required this.hintText,
    required this.prefixIconPath,
    required this.controller,
    super.key,
    this.isPrivate = false,
    this.suffixIcon,
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
    _focus
      ..removeListener(_onFocusChange)
      ..dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      RadiusConstants.circularDefault,
    );

    final prefixIcon = NuntiumSvgIcon(
      widget.prefixIconPath,
      color: _focus.hasFocus || widget.controller.text.isNotEmpty
          ? ColorConstants.purplePrimary
          : ColorConstants.greyPrimary,
    );

    final hintStyle = NuntiumTextStyles.medium16.copyWith(
      color: ColorConstants.greyPrimary,
    );

    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    final enabledBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: widget.controller.text.isNotEmpty
            ? ColorConstants.purplePrimary
            : ColorConstants.transparent,
      ),
    );

    const focusedBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: ColorConstants.purplePrimary),
    );

    final textFieldDecoration = InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: widget.suffixIcon,
      hintText: widget.hintText,
      hintMaxLines: 1,
      hintStyle: hintStyle,
      border: border,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
    );

    final textField = TextField(
      controller: widget.controller,
      focusNode: _focus,
      maxLines: 1,
      keyboardType: TextInputType.text,
      cursorColor: ColorConstants.purplePrimary,
      style: NuntiumTextStyles.medium16,
      obscureText: widget.isPrivate,
      decoration: textFieldDecoration,
    );

    final containerDecoration = BoxDecoration(
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
