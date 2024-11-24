import 'package:flutter/material.dart';
import 'package:flutterstore/shared/constants.dart';
import 'package:flutterstore/shared/text_styles.dart';
import 'package:flutterstore/widgets/buttons/mini_button_icon_custom.dart';

// ignore: must_be_immutable
class ImagePickerModal extends StatelessWidget {
  Function() bgPress, onCamera, onLibrary;
  ImagePickerModal({
    required this.bgPress,
    required this.onCamera,
    required this.onLibrary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bgPress,
      child: Container(
        color: blackColor.withOpacity(0.5),
        width: double.infinity,
        height: double.infinity,
        child: SimpleDialog(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Text(
                    'Pilih Pengambilan Gambar',
                    style: medium.black.semiBold,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pilih Dari Mana Kamu Ingin Mengambil Gambar Kamu',
                    textAlign: TextAlign.center,
                    style: regular.copyWith(
                      fontSize: 13,
                      color: black1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MiniButtonIconCustom(
                        icon: Icons.folder,
                        title: 'Library',
                        onPress: onLibrary,
                      ),
                      SizedBox(width: 8),
                      MiniButtonIconCustom(
                        icon: Icons.camera_alt,
                        title: 'Camera',
                        onPress: onCamera,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
