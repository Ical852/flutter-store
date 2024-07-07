import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get black => copyWith(color: blackColor);
  TextStyle get white => copyWith(color: whiteColor);
  TextStyle get grey => copyWith(color: greyColor);

  TextStyle get light => copyWith(fontWeight: fontLight);
  TextStyle get regularF => copyWith(fontWeight: fontRegular);
  TextStyle get mediumF => copyWith(fontWeight: fontMedium);
  TextStyle get semiBold => copyWith(fontWeight: fontSemiBold);
  TextStyle get bold => copyWith(fontWeight: fontBold);
  TextStyle get extraBold => copyWith(fontWeight: fontBold);
  TextStyle get blackBold => copyWith(fontWeight: fontBlackBold);
}

TextStyle xSmall = TextStyle(fontSize: xSmallSize);
TextStyle small = TextStyle(fontSize: smallSize);
TextStyle regular = TextStyle(fontSize: regularSize);
TextStyle medium = TextStyle(fontSize: mediumSize);
TextStyle base = TextStyle(fontSize: baseSize);
TextStyle mega = TextStyle(fontSize: megaSize);
TextStyle extra = TextStyle(fontSize: extraSize);
TextStyle mass = TextStyle(fontSize: massSize);
