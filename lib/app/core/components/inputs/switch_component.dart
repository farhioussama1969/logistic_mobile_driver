import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class SwitchComponent extends StatelessWidget {
  const SwitchComponent(
      {Key? key, required this.enable, required this.onChange, this.activeIconPath, this.inactiveIconPath, this.height, this.width})
      : super(key: key);

  final bool enable;
  final Function(bool value) onChange;
  final String? activeIconPath;
  final String? inactiveIconPath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: MainColors.primaryColor,
      inactiveColor: MainColors.disableColor(context)!,
      activeIcon: activeIconPath != null ? SvgPicture.asset(activeIconPath!, color: MainColors.primaryColor) : null,
      inactiveIcon: inactiveIconPath != null ? SvgPicture.asset(inactiveIconPath!, color: MainColors.primaryColor) : null,
      height: height ?? 22.r,
      width: width ?? 38.r,
      valueFontSize: 20.0.r,
      toggleSize: 20.r,
      value: enable,
      borderRadius: 30.0,
      padding: 2.r,
      onToggle: (value) => onChange(value),
    );
  }
}
