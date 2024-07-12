import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get black => copyWith(color: blackColor);
  TextStyle get black1S => copyWith(color: black1);
  TextStyle get white => copyWith(color: whiteColor);
  TextStyle get grey => copyWith(color: greyColor);
  TextStyle get grey1S => copyWith(color: grey1);
  TextStyle get green3S => copyWith(color: green3);
  TextStyle get pageS => copyWith(color: page);
  TextStyle get primary => copyWith(color: green1);

  TextStyle get light => copyWith(fontWeight: fontLight);
  TextStyle get regularF => copyWith(fontWeight: fontRegular);
  TextStyle get mediumF => copyWith(fontWeight: fontMedium);
  TextStyle get semiBold => copyWith(fontWeight: fontSemiBold);
  TextStyle get bold => copyWith(fontWeight: fontBold);
  TextStyle get extraBold => copyWith(fontWeight: fontBold);
  TextStyle get blackBold => copyWith(fontWeight: fontBlackBold);
}

TextStyle xSmall = GoogleFonts.poppins(fontSize: xSmallSize);
TextStyle small = GoogleFonts.poppins(fontSize: smallSize);
TextStyle regular = GoogleFonts.poppins(fontSize: regularSize);
TextStyle medium = GoogleFonts.poppins(fontSize: mediumSize);
TextStyle base = GoogleFonts.poppins(fontSize: baseSize);
TextStyle mega = GoogleFonts.poppins(fontSize: megaSize);
TextStyle extra = GoogleFonts.poppins(fontSize: extraSize);
TextStyle mass = GoogleFonts.poppins(fontSize: massSize);
